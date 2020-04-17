import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:bloc/bloc.dart';
import 'package:nothing/bloc/history/bloc.dart';
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
  final HistoryBloc historyBloc;

  QuestionsBloc({
    @required this.repo,
    @required this.summaryBloc,
    @required this.idBloc,
    @required this.historyBloc,
  });

  @override
  QuestionsState get initialState => QuestionsState.empty;

  @override
  Stream<QuestionsState> mapEventToState(QuestionsEvent event) async* {
    yield* event.map(fetch: _mapFetch, refetch: _mapRefetch);
  }

  int lastid;
  Stream<QuestionsState> _mapFetch(Fetch event) async* {
    if (event.currentid == null) {
      final curid = event.currentid ?? historyBloc.state.ids.isEmpty ? 1 : -1;
      add(QuestionsEvent.fetch(curid));
      return;
    }
    yield const QuestionsState.loading();
    try {
      lastid = event.currentid;
      var problems = await repo.fetchQuestions(
        userID: idBloc.state.id,
        currentID: event.currentid,
        answers: summaryBloc.state.answers,
      );
      yield QuestionsState.loaded(problems);
      summaryBloc.add(const SummaryEvent.reset());
    } on CloudError catch (error) {
      yield QuestionsState.error(error);
      add(QuestionsEvent.refetch(event.currentid));
    }
  }

  Stream<QuestionsState> _mapRefetch(Refetch event) async* {
    const duration = Duration(seconds: 10);
    print("Retry in $duration");
    await Future.delayed(duration);
    if (lastid == event.currentid) {
      yield const QuestionsState.reloading();
      add(QuestionsEvent.fetch(event.currentid));
    }
  }
}
