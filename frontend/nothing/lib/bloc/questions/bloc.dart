import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:nothing/bloc/questions/event.dart';
import 'package:nothing/bloc/questions/state.dart';
import 'package:nothing/data/questions_repo.dart';

export 'event.dart';
export 'state.dart';

class QuBloc extends Bloc<QusEvent, QusState> {
  final QuestionsRepo qusRepo;
  Map<int, bool> summary = Map<int, bool>();

  QuBloc({
    @required this.qusRepo,
  });

  @override
  QusState get initialState => LoadingQus();

  @override
  Stream<QusState> mapEventToState(
    QusEvent event,
  ) async* {
    if (event is QuestionAnswer) {
      summary[event.idx] = event.answer;
    }
    if (event is FetchQus) {
      yield LoadingQus();
      var problems = await qusRepo.fetchQuestions(
        count: event.count,
        summary: summary,
      );
      summary = Map<int, bool>();
      yield LoadedQus(
        qus: problems,
      );
    }
    // else if
  }
}
