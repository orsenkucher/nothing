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
  const factory FeedEvent.newArrived(QTree tree, [@Default(false) bool forced]) = NewArrived;
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
      empty: (oldTree) => questionsBloc.add(QuestionsEvent.fetch(oldTree?.question?.id)),
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
          if (next != null) {
            return FeedState.pending(
              oldTree: tree,
              newTree: next,
            );
          }
          print('Request and go to empty');
          questionsBloc.add(QuestionsEvent.fetch(tree.question.id));
          return FeedState.empty(tree);
        },
        ground: () => error$(), // this should never happen
        newArrived: (newTree, forced) {
          print('Answer: ${newTree.question.answers}');
          if (tree.question.id == newTree.question.id || forced) {
            print('Swapping tree');
            print(newTree.question);
            return FeedState.available(tree: newTree);
          }
          return null;
        },
      ),
      pending: (oldTree, nextTree) => event.when(
        moveNext: (_) => error$(), // this should never happen
        ground: () {
          print('Grounding on');
          print(nextTree.question);
          // non-history tree
          if (nextTree.left != null && nextTree.right != null || nextTree.left == null && nextTree.right == null) {
            print('Request tree prolongation');
            questionsBloc.add(QuestionsEvent.fetch(nextTree.question.id));
          }
          return FeedState.available(tree: nextTree);
        },
        newArrived: (newTree, forced) {
          print('Arrived on pending');
          if (newTree.question.id != nextTree.question.id && !forced) {
            questionsBloc.add(QuestionsEvent.fetch(nextTree.question.id));
            return null;
          }
          return FeedState.pending(oldTree: oldTree, newTree: newTree);
        },
      ),
      empty: (oldTree) => event.when(
        newArrived: (nextTree, forced) {
          if (oldTree?.question?.id == nextTree.question.id || nextTree.question.id == -1 || forced) {
            return FeedState.available(tree: nextTree.left);
          }
          if (oldTree?.question == null) {
            return FeedState.available(tree: nextTree);
          }
          return null;
        },
        moveNext: (_) => null,
        ground: () => null,
      ),
    );
    if (next != null) yield next;
  }

  @override
  Map<String, dynamic> toJson(FeedState payload) => payload.toJson();

  @override
  FeedState fromJson(Map<String, dynamic> json) {
    // clear();
    return FeedState.fromJson(json);
  }
}
