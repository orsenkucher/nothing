import 'dart:async';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:nothing/bloc/feed/event.dart';
import 'package:nothing/bloc/feed/state.dart';
import 'package:nothing/bloc/questions/bloc.dart';
import 'package:nothing/bloc/summary/bloc.dart';

export 'event.dart';
export 'state.dart';

class FeedBloc extends Bloc<FeedEvent, Feed> {
  final int threshold;
  final QuestionsBloc questionsBloc;
  final SummaryBloc summaryBloc;
  StreamSubscription _questionsSub;
  StreamSubscription _summarySub;

  FeedBloc({
    @required this.questionsBloc,
    @required this.summaryBloc,
    this.threshold = 6,
  }) {
    _makeQuestionsSub();
    _makeSummarySum();
  }

  void _makeQuestionsSub() {
    _questionsSub = questionsBloc.listen((state) {
      if (state is LoadedQuestions) {
        add(NewArrived(state.questions));
      }
    });
  }

  void _makeSummarySum() {
    _summarySub = summaryBloc.listen((state) {
      if (state.runtimeType == Summary) {
        add(MoveNext());
      }
    });
  }

  @override
  Future<void> close() {
    _questionsSub.cancel();
    _summarySub.cancel();
    return super.close();
  }

  @override
  Feed get initialState => EmptyFeed();

  @override
  Stream<Feed> mapEventToState(FeedEvent event) async* {
    if (event is NewArrived) {
      yield* _mapNewArrived(event);
    } else if (event is MoveNext) {
      yield* _mapMoveNext();
    }
  }

  Stream<Feed> _mapNewArrived(NewArrived event) async* {
    final feed = state.batch.toList()..addAll(event.batch);
    var cur = state.current;
    if (cur > threshold) {
      feed.removeRange(0, cur - threshold);
      cur = threshold;
    }
    yield Feed(feed, cur);
  }

  Stream<Feed> _mapMoveNext() async* {
    final next = state.current + 1;
    final feed = state.batch.toList();
    if (next < feed.length) {
      yield Feed(feed, next);
    }
    if (next + threshold == state.batch.length) {
      questionsBloc.add(FetchQuestions());
    }
  }
}
