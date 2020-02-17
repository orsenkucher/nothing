import 'package:flutter/cupertino.dart';
import 'package:bloc/bloc.dart';

import 'package:nothing/bloc/questions/state.dart';
import 'package:nothing/bloc/questions/event.dart';
import 'package:nothing/bloc/summary/bloc.dart';
import 'package:nothing/domain/domain.dart';
import 'package:nothing/error/cloud_error.dart';
import 'package:nothing/repository/questions.dart';

export 'event.dart';
export 'state.dart';

class QuestionsBloc extends Bloc<QuestionsEvent, QuestionsState> {
  final QuestionsRepo repo;
  final SummaryBloc summaryBloc;
  final int loadCount;

  QuestionsBloc({
    @required this.repo,
    @required this.summaryBloc,
    this.loadCount = 6,
  });

  @override
  QuestionsState get initialState => QuestionsState.loaded(QTree());

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
        count: loadCount,
        summary: summaryBloc.state.summary,
      );
      yield QuestionsState.loaded(problems);
      summaryBloc.add(const SummaryEvent.reset());
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
