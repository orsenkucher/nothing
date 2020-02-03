import 'package:flutter/cupertino.dart';
import 'package:bloc/bloc.dart';

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
  QuestionsState get initialState => LoadedQuestions.empty();

  @override
  Stream<QuestionsState> mapEventToState(QuestionsEvent event) async* {
    if (event is FetchQuestions) {
      yield* _mapFetch(event);
    } else if (event is RefetchQuestions) {
      yield* _mapRefetch(event);
    }
  }

  Stream<QuestionsState> _mapFetch(FetchQuestions event) async* {
    if (state is LoadingQuestions || state is FailedToLoadQuestions) {
      return;
    } // Waiting for server response
    yield LoadingQuestions();
    try {
      var problems = await repo.fetchQuestions(
        count: loadCount,
        summary: summaryBloc.state.summary,
      );
      yield LoadedQuestions(problems);
      summaryBloc.add(ResetSummary());
    } on CloudError catch (error) {
      yield FailedToLoadQuestions(error);
      add(const RefetchQuestions());
    }
  }

  Stream<QuestionsState> _mapRefetch(RefetchQuestions event) async* {
    const duration = Duration(seconds: 10);
    print("Retry in $duration");
    await Future.delayed(duration);
    yield ReloadingQuestions();
    add(const FetchQuestions());
  }
}
