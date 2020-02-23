import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
// import 'package:meta/meta.dart';
import 'package:nothing/bloc/feed/event.dart';
import 'package:nothing/bloc/feed/state.dart';
import 'package:nothing/bloc/questions/bloc.dart';
import 'package:nothing/domain/domain.dart';

export 'event.dart';
export 'state.dart';

class FeedBloc extends HydratedBloc<FeedEvent, FeedState> {
  final QuestionsBloc questionsBloc;
  StreamSubscription _questionsSub;

  FeedBloc({@required this.questionsBloc}) {
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
  FeedState get initialState => super.initialState ?? FeedState.empty;

  @override
  Stream<FeedState> mapEventToState(FeedEvent event) async* {
    yield* event.map(newArrived: _mapNewArrived, moveNext: _mapMoveNext);
    // if (event is NewArrived) {
    //   yield* _mapNewArrived(event);
    // } else if (event is MoveNext) {
    //   yield* _mapMoveNext();
    // }
  }

  Stream<FeedState> _mapNewArrived(NewArrived event) async* {
    // final feed = state.batch.toList()..addAll(event.batch);
    // var cur = state.current;
    // if (cur > threshold) {
    //   feed.removeRange(0, cur - threshold);
    //   cur = threshold;
    // }
    // yield Feed(feed, cur);

    yield FeedState(tree: event.tree);
    //     final tree = state.tree.
    // yield FeedState(tree: )
  }

  Stream<FeedState> _mapMoveNext(MoveNext event) async* {
    // final next = state.current + 1;
    // final feed = state.batch.toList();
    // if (next <= feed.length) {
    //   yield Feed(feed, next);
    // }
    // print('Cached: ${state.batch.length}');
    // if (next + threshold > state.batch.length) {
    //   questionsBloc.add(const FetchQuestions());
    // }
    final currentid = state?.tree?.question?.id;
    yield FeedState(
      tree: event.dir.when<QTree>(
        left: () => state.tree.left,
        right: () => state.tree.right,
      ),
    );
    questionsBloc.add(QuestionsEvent.fetch(currentid));
  }

  @override
  FeedState fromJson(Map<String, dynamic> json) {
    try {
      final state = FeedState.fromJson(json);
      return state;
    } catch (_) {
      print('Feed: fromJson error');
      return null;
    }
  }

  @override
  Map<String, dynamic> toJson(FeedState feed) {
    try {
      final json = feed.toJson();
      return json;
    } catch (_) {
      print('Feed: toJson error');
      return null;
    }
  }
}
