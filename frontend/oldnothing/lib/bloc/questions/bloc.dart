import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:nothing/bloc/questions/event.dart';
import 'package:nothing/bloc/questions/state.dart';
import 'package:nothing/bloc/summary/bloc.dart';
import 'package:nothing/data/questions_repo.dart';

export 'event.dart';
export 'state.dart';

class QuestionsBloc extends Bloc<QuestionsEvent, QuestionsState> {
  final QuestionsRepo qusRepo;
  final SummaryBloc summaryBloc;

  QuestionsBloc({
    @required this.qusRepo,
    @required this.summaryBloc,
  });

  @override
  QuestionsState get initialState => LoadingQuestions();

  @override
  Stream<QuestionsState> mapEventToState(
    QuestionsEvent event,
  ) async* {
    if (event is FetchQus) {
      yield LoadingQuestions();
      var problems = await qusRepo.fetchQuestions(
        count: event.count,
        summary: summaryBloc.state.summary,
      );
      yield LoadedQuestions(
        qus: problems,
      );
    }
    // else if
  }
}
