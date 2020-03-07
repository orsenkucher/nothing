import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
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
  StreamSubscription _selfSub;

  FeedBloc({
    @required this.questionsBloc,
    @required this.validationBloc,
  }) {
    _makeSelfSub();
    // TODO here is the binding problem(
    if (state.map(available: (_) => false, empty: (_) => true)) {
      questionsBloc.add(QuestionsEvent.fetch());
    }
  }

  void _makeSelfSub() {
    _selfSub = listen((state) {
      state.when(
        available: (tree) =>
            validationBloc.add(ValidationEvent.focus(tree.question)),
        empty: () {},
      );
    });
  }

  @override
  Future<void> close() {
    _selfSub.cancel();
    return super.close();
  }

  @override
  FeedState get initialState => super.initialState ?? FeedState.empty();

  @override
  Stream<FeedState> mapEventToState(FeedEvent event) async* {
    yield* event.map(newArrived: _mapNewArrived, moveNext: _mapMoveNext);
  }

  Stream<FeedState> _mapNewArrived(NewArrived event) async* {
    yield FeedState.available(tree: event.tree);
  }

  Stream<FeedState> _mapMoveNext(MoveNext event) async* {
    final next = state.when<FeedState>(
      available: (tree) {
        final next = event.dir.when(
          left: () => tree.left,
          right: () => tree.right,
        );
        return next != null
            ? FeedState.available(tree: next)
            : FeedState.empty();
      },
      empty: () => FeedState.empty(),
    );
    print(next);
    yield next;
    next.when(
      available: (tree) => questionsBloc.add(
        QuestionsEvent.fetch(tree.question.id),
      ),
      empty: () {},
    );
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
