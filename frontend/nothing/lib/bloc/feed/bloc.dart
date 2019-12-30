import 'dart:async';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:nothing/bloc/feed/event.dart';
import 'package:nothing/bloc/feed/state.dart';
import 'package:nothing/bloc/questions/bloc.dart';

export 'event.dart';
export 'state.dart';

class FeedBloc extends Bloc<FeedEvent, Feed> {
  final int threshold;
  final QuestionsBloc questionsBloc;
  StreamSubscription _sub;

  FeedBloc({
    @required this.questionsBloc,
    this.threshold = 6,
  }) {
    _sub = questionsBloc.listen((state) {
      if (state is LoadedQuestions) {
        add(NewArrived(state.questions));
      }
    });
  }

  @override
  Future<void> close() {
    _sub.cancel();
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
    yield Feed(state.batch..addAll(event.batch));
  }

  Stream<Feed> _mapMoveNext() async* {
    yield Feed(state.batch..removeAt(0));
    if (state.batch.length < threshold) {
      questionsBloc.add(FetchQuestions());
    }
  }
}
