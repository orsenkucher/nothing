import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:bloc/bloc.dart';
import 'package:nothing/bloc/feed/bloc.dart';
import 'package:nothing/bloc/id/bloc.dart';

import 'package:nothing/bloc/questions/state.dart';
import 'package:nothing/bloc/questions/event.dart';
import 'package:nothing/bloc/summary/bloc.dart';
import 'package:nothing/error/cloud_error.dart';
import 'package:nothing/repository/questions.dart';

export 'event.dart';
export 'state.dart';

class QuestionsBloc extends Bloc<QuestionsEvent, QuestionsState> {
  final QuestionsRepo repo;
  final SummaryBloc summaryBloc;
  final IdBloc idBloc;
  final FeedBloc feed;

  StreamSubscription _sub;

  QuestionsBloc({
    @required this.repo,
    @required this.summaryBloc,
    @required this.idBloc,
    @required this.feed,
  }) {
    _sub = feed.listen((state) {
      if (state.tree == null) {
        add(QuestionsEvent.fetch());
      }
    });
  }

  @override
  Future<void> close() async {
    await _sub.cancel();
    return super.close();
  }

  @override
  QuestionsState get initialState => QuestionsState.empty;

  @override
  Stream<QuestionsState> mapEventToState(QuestionsEvent event) async* {
    yield* event.map(fetch: _mapFetch, refetch: _mapRefetch);
  }

  Stream<QuestionsState> _mapFetch(Fetch event) async* {
    if (state is Loading || state is Error) {
      return;
    } // Waiting for server response
    yield const QuestionsState.loading();
    try {
      var problems = await repo.fetchQuestions(
        userID: idBloc.state.id,
        currentID: feed.state.tree?.question?.id ?? -1,
        answers: summaryBloc.state.answers,
      );
      yield QuestionsState.loaded(problems);
      summaryBloc.add(const SummaryEvent.reset());
      feed.add(NewArrived(problems));
    } on CloudError catch (error) {
      yield QuestionsState.error(error);
      add(const QuestionsEvent.refetch());
    }
  }

  Stream<QuestionsState> _mapRefetch(Refetch event) async* {
    const duration = Duration(seconds: 10);
    print("Retry in $duration");
    await Future.delayed(duration);
    yield const QuestionsState.reloading();
    add(const QuestionsEvent.fetch());
  }
}
