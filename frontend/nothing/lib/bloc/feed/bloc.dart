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
  const factory FeedEvent.ground() = Ground;
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
  }) = Available;

  // TODO: or is it another bloc created?
  const factory FeedState.pending({
    @required @JsonKey(toJson: _toT) QTree oldTree,
    @required @JsonKey(toJson: _toT) QTree newTree,
  }) = Pending;

  const factory FeedState.empty() = Empty;

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
      pending: (_, __) => void$(), // nothing should be done
      empty: () => questionsBloc.add(QuestionsEvent.fetch()),
    );
  }

  @override
  FeedState get initialPayload => FeedState.empty();

  @override
  Stream<FeedState> mapEventToPayload(FeedEvent event) async* {
    final next = payload.when<FeedState>(
      available: (tree) => event.when(
        moveNext: (dir) {
          final next = dir.when(
            left: () => tree.left,
            right: () => tree.right,
          );
          return next != null ? FeedState.pending(oldTree: tree, newTree: next) : FeedState.empty();
        },
        ground: () => error$(), // this should never happen
        newArrived: (tree) => FeedState.available(tree: tree),
      ),
      pending: (oldTree, newTree) => event.when(
        moveNext: (_) => error$(), // this should never happen
        ground: () => FeedState.available(tree: newTree),
        newArrived: (tree) => FeedState.available(tree: tree),
      ),
      empty: () => FeedState.empty(),
    );
    yield next;
  }

  @override
  dynamic payloadToJson(FeedState payload) => payload.toJson();

  @override
  FeedState payloadFromJson(dynamic json) => FeedState.fromJson(json);
}
