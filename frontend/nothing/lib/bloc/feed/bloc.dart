import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:nothing/bloc/feed/event.dart';
import 'package:nothing/bloc/feed/state.dart';
import 'package:nothing/bloc/questions/bloc.dart';
import 'package:nothing/bloc/validation/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

export 'event.dart';
export 'state.dart';

class FeedBloc extends HydratedBloc<FeedEvent, FeedState> {
  final ValidationBloc validationBloc;
  final QuestionsBloc questionsBloc;
  FeedBloc({
    @required this.questionsBloc,
    @required this.validationBloc,
  }) {
    state.when(
      available: (tree) => add(FeedEvent.newArrived(tree)),
      empty: () => questionsBloc.add(QuestionsEvent.fetch()),
    );
  }

  @override
  FeedState get initialState => super.initialState ?? FeedState.empty();

  @override
  Stream<FeedState> mapEventToState(FeedEvent event) async* {
    final next = event.map(
      moveNext: _mapMoveNext,
      newArrived: (n) => FeedState.available(tree: n.tree),
    );
    yield next;
  }

  FeedState _mapMoveNext(MoveNext event) {
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
    return next;
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
