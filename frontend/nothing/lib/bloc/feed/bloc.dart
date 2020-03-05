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
    if (state?.tree?.question == null) {
      questionsBloc.add(QuestionsEvent.fetch());
    }
  }

  void _makeSelfSub() {
    _selfSub = listen((state) {
      final q = state?.tree?.question;
      if (q != null) validationBloc.add(ValidationEvent.focus(q));
    });
  }

  @override
  Future<void> close() {
    _selfSub.cancel();
    return super.close();
  }

  @override
  FeedState get initialState => super.initialState ?? FeedState.empty;

  @override
  Stream<FeedState> mapEventToState(FeedEvent event) async* {
    yield* event.map(newArrived: _mapNewArrived, moveNext: _mapMoveNext);
  }

  Stream<FeedState> _mapNewArrived(NewArrived event) async* {
    yield FeedState(tree: event.tree);
  }

  Stream<FeedState> _mapMoveNext(MoveNext event) async* {
    final next = FeedState(
      tree: event.dir.when<QTree>(
        left: () => state.tree.left,
        right: () => state.tree.right,
      ),
    );
    print(next);
    yield next;
    if (next?.tree?.question != null) {
      questionsBloc.add(QuestionsEvent.fetch(next.tree.question.id));
    }
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
