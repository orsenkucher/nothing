import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import 'package:nothing/bloc/questions/state.dart';
import 'package:nothing/bloc/questions/event.dart';
import 'package:nothing/bloc/summary/bloc.dart';
import 'package:nothing/data/questions_repo.dart';
import 'package:nothing/error/cloud_error.dart';

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
  QuestionsState get initialState => LoadingQuestions();

  @override
  Stream<QuestionsState> mapEventToState(QuestionsEvent event) async* {
    if (event is FetchQuestions) {
      yield* _mapFetchQuestions(event);
    }
  }

  Stream<QuestionsState> _mapFetchQuestions(FetchQuestions event) async* {
    yield LoadingQuestions();
    try {
      var problems = await repo.fetchQuestions(
        count: loadCount,
        summary: summaryBloc.state.summary,
      );
      yield LoadedQuestions(problems);
    } on CloudError catch (error) {
      yield FailedToLoadQuestions(error);
      final duration = Duration(seconds: 10);
      print("Retry in $duration");
      Future.delayed(duration, () => add(event));
    }
  }
}
