import 'dart:async';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';
import 'package:nothing/bloc/feed/event.dart';
import 'package:nothing/bloc/feed/state.dart';
import 'package:nothing/bloc/questions/bloc.dart';

export 'event.dart';
export 'state.dart';

class FeedBloc extends HydratedBloc<FeedEvent, Feed> {
  final int threshold;
  final QuestionsBloc questionsBloc;
  StreamSubscription _questionsSub;

  FeedBloc({
    @required this.questionsBloc,
    this.threshold = 6,
  }) {
    _makeQuestionsSub();
  }

  void _makeQuestionsSub() {
    _questionsSub = questionsBloc.listen((state) {
      if (state is Loaded) {
        add(FeedEvent.newArrived(state.questions));
      }
    });
  }

  @override
  Future<void> close() {
    _questionsSub.cancel();
    return super.close();
  }

  @override
  Feed get initialState => super.initialState ?? Feed.empty();

  @override
  Stream<Feed> mapEventToState(FeedEvent event) async* {
    yield* event.map(newArrived: _mapNewArrived, moveNext: _mapMoveNext);
    // if (event is NewArrived) {
    //   yield* _mapNewArrived(event);
    // } else if (event is MoveNext) {
    //   yield* _mapMoveNext();
    // }
  }

  Stream<Feed> _mapNewArrived(NewArrived event) async* {
    // final feed = state.batch.toList()..addAll(event.batch);
    // var cur = state.current;
    // if (cur > threshold) {
    //   feed.removeRange(0, cur - threshold);
    //   cur = threshold;
    // }
    // yield Feed(feed, cur);
  }

  Stream<Feed> _mapMoveNext(MoveNext _) async* {
    // final next = state.current + 1;
    // final feed = state.batch.toList();
    // if (next <= feed.length) {
    //   yield Feed(feed, next);
    // }
    // print('Cached: ${state.batch.length}');
    // if (next + threshold > state.batch.length) {
    //   questionsBloc.add(const FetchQuestions());
    // }
  }

  @override
  Feed fromJson(Map<String, dynamic> json) {
    try {
      return Feed.fromJson(json);
    } catch (_) {
      print('Feed: fromJson error');
      return null;
    }
  }

  @override
  Map<String, dynamic> toJson(Feed feed) {
    try {
      return feed.toJson();
    } catch (_) {
      print('Feed: toJson error');
      return null;
    }
  }
}
