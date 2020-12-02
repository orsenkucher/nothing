import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nothing/bloc/validation/bloc.dart';
import 'package:nothing/bloc/questions/bloc.dart';
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
    @required QTree tree,
  }) = Available;

  // TODO: or is it another bloc created?
  const factory FeedState.pending({
    @required QTree oldTree,
    @required QTree newTree,
  }) = Pending;

  const factory FeedState.empty([QTree oldTree]) = Empty;

  factory FeedState.fromJson(Map<String, dynamic> json) => _$FeedStateFromJson(json);
}

class FeedBloc extends HydratedBloc<FeedEvent, FeedState> {
  final ValidationBloc validationBloc;
  final QuestionsBloc questionsBloc;
  FeedBloc({
    @required this.questionsBloc,
    @required this.validationBloc,
  }) : super(FeedState.empty(null)) {
    state.when(
      available: (tree) => add(FeedEvent.newArrived(tree)),
      pending: (_, __) => void$(), // nothing should be done
      empty: (_) => questionsBloc.add(QuestionsEvent.fetch()),
    );
  }

  @override
  Stream<FeedState> mapEventToState(FeedEvent event) async* {
    final next = state.when<FeedState>(
      available: (tree) => event.when(
        moveNext: (dir) {
          var next = dir.when(
            left: () => tree.left,
            right: () => tree.right,
          );
          next ??= tree.left ?? tree.right; // to make asymmetric tree work
          return next != null
              ? FeedState.pending(
                  oldTree: tree,
                  newTree: next,
                )
              : FeedState.empty(tree);
        },
        ground: () => error$(), // this should never happen
        newArrived: (tree) {
          print('Answer: ${tree.question.answers}');
          return FeedState.available(tree: tree);
        },
      ),
      pending: (oldTree, newTree) => event.when(
        moveNext: (_) => error$(), // this should never happen
        ground: () {
          print('Grounding');
          questionsBloc.add(QuestionsEvent.fetch(newTree.question.id));
          return FeedState.available(tree: newTree);
        },
        newArrived: (tree) {
          print('Arrived on pending');
          return FeedState.available(tree: tree);

          // return FeedState.pending(oldTree: tree, newTree: )
        },
      ),
      empty: (oldTree) => event.when(
        newArrived: (newTree) => oldTree != null
            ? FeedState.pending(oldTree: oldTree, newTree: newTree)
            : FeedState.available(tree: newTree),
        moveNext: (_) => FeedState.empty(null),
        ground: () => FeedState.empty(null),
      ),
    );
    yield next;
  }

  @override
  Map<String, dynamic> toJson(FeedState payload) => payload.toJson();

  @override
  FeedState fromJson(Map<String, dynamic> json) {
    // clear();
    return FeedState.fromJson(json);
  }
}
