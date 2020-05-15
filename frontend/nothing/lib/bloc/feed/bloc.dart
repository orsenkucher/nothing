import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nothing/bloc/validation/bloc.dart';
import 'package:nothing/bloc/questions/bloc.dart';
import 'package:nothing/ignitor/ignitor.dart';
import 'package:nothing/domain/domain.dart';

part 'bloc.freezed.dart';
part 'bloc.g.dart';

@freezed
abstract class FeedEvent with _$FeedEvent {
  const factory FeedEvent.newArrived(QTree tree) = NewArrived;
  const factory FeedEvent.moveNext(MoveDir dir) = MoveNext;
}

@freezed
abstract class MoveDir with _$MoveDir {
  const factory MoveDir.left() = _Left;
  const factory MoveDir.right() = _Right;
}

@freezed
abstract class FeedState with _$FeedState {
  const factory FeedState.available({
    @required @JsonKey(toJson: _toT) QTree tree,
  }) = _Available;
  const factory FeedState.empty() = _Empty;

  factory FeedState.fromJson(Map<String, dynamic> json) => _$FeedStateFromJson(json);
}

Map<String, dynamic> _toT(QTree t) => t?.toJson();

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
        return next != null ? FeedState.available(tree: next) : FeedState.empty();
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
