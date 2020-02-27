import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
// import 'package:meta/meta.dart';
import 'package:nothing/bloc/feed/event.dart';
import 'package:nothing/bloc/feed/state.dart';
import 'package:nothing/bloc/questions/bloc.dart';
import 'package:nothing/bloc/validation/bloc.dart';
import 'package:nothing/domain/domain.dart';

export 'event.dart';
export 'state.dart';

class FeedBloc extends HydratedBloc<FeedEvent, FeedState> {
  final ValidationBloc validationBloc;
  final QuestionsBloc questionsBloc;
  StreamSubscription _questionsSub;
  StreamSubscription _validationSub;
  StreamSubscription _selfSub;

  FeedBloc({
    @required this.questionsBloc,
    @required this.validationBloc,
  }) {
    _makeQuestionsSub();
    _makeValidationSub();
    _makeSelfSub();
    if (state?.tree?.question == null) {
      questionsBloc.add(QuestionsEvent.fetch());
    }
  }

  void _makeQuestionsSub() {
    _questionsSub = questionsBloc.listen((state) {
      if (state is Loaded) {
        if (state?.questions?.question != null) {
          add(FeedEvent.newArrived(state.questions));
        }
      }
    });
  }

  void _makeValidationSub() {
    _validationSub = validationBloc.listen((state) {
      state.maybeWhen(
        correct: (question, tries, duration) => add(
          FeedEvent.moveNext(
            duration.inSeconds > 90 ? MoveDir.left() : MoveDir.right(),
          ),
        ),
        orElse: () {},
      );
    });
  }

  void _makeSelfSub() {
    _selfSub = listen((state) {
      final q = state?.tree?.question;
      if (q != null) validationBloc.add(ValidationEvent.focus(q));
    });
  }

  @override
  Future<void> close() {
    _questionsSub.cancel();
    _validationSub.cancel();
    _selfSub.cancel();
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
    // final currentid = state?.tree?.question?.id;
    final next = FeedState(
      tree: event.dir.when<QTree>(
        left: () => state.tree.left,
        right: () => state.tree.right,
      ),
    );
    print(next);
    yield next;
    // if (next?.tree?.question == null) {
    // questionsBloc.add(QuestionsEvent.fetch(currentid));
    if (next?.tree?.question != null) {
      questionsBloc.add(QuestionsEvent.fetch(next.tree.question.id));
    }
    // }
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
