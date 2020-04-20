import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:nothing/bloc/feed/event.dart';
import 'package:nothing/bloc/feed/state.dart';
import 'package:nothing/bloc/questions/bloc.dart';
import 'package:nothing/bloc/validation/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nothing/ignitor/ignitor.dart';

export 'event.dart';
export 'state.dart';

class FeedBloc extends IgnitedBloc<FeedEvent, FeedState> {
  final ValidationBloc validationBloc;
  final QuestionsBloc questionsBloc;
  FeedBloc({
    @required this.questionsBloc,
    @required this.validationBloc,
  });

  @override
  void ignition(FeedState paylaod) {
    paylaod.when(
      available: (tree) => add(FeedEvent.newArrived(tree)),
      empty: () => questionsBloc.add(QuestionsEvent.fetch()),
    );
  }

  @override
  FeedState get initialPayload => FeedState.empty();

  @override
  Stream<FeedState> mapEventToPayload(FeedEvent event) async* {
    final next = event.map(
      moveNext: _mapMoveNext,
      newArrived: (n) => FeedState.available(tree: n.tree),
    );
    yield next;
  }

  FeedState _mapMoveNext(MoveNext event) {
    final next = payload.when<FeedState>(
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
  dynamic payloadToJson(FeedState payload) => payload.toJson();

  @override
  FeedState payloadFromJson(dynamic json) => FeedState.fromJson(json);
}
