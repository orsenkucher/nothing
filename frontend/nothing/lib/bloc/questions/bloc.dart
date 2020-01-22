import 'package:flutter/cupertino.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'package:nothing/bloc/questions/state.dart';
import 'package:nothing/bloc/questions/event.dart';
import 'package:nothing/bloc/summary/bloc.dart';
import 'package:nothing/data/questions_repo.dart';
import 'package:nothing/error/cloud_error.dart';

export 'event.dart';
export 'state.dart';

class QuestionsBloc extends HydratedBloc<QuestionsEvent, QuestionsState> {
  final QuestionsRepo repo;
  final SummaryBloc summaryBloc;
  final int loadCount;

  QuestionsBloc({
    @required this.repo,
    @required this.summaryBloc,
    this.loadCount = 6,
  });

  @override
  QuestionsState get initialState =>
      super.initialState ?? LoadedQuestions.empty();

  @override
  Stream<QuestionsState> mapEventToState(QuestionsEvent event) async* {
    if (event is FetchQuestions) {
      yield* _mapFetchQuestions(event);
    }
  }

  Stream<QuestionsState> _mapFetchQuestions(FetchQuestions event) async* {
    if (state is LoadingQuestions) {
      return; // Waiting for server response
    }
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
      final duration = Duration(seconds: 10);
      print("Retry in $duration");
      Future.delayed(duration, () => add(event));
    }
  }

  @override
  QuestionsState fromJson(Map<String, dynamic> json) {
    try {
      return LoadedQuestions.fromJson(json['questions']);
    } catch (_) {
      print('QuestionsState: fromJson error');
      return null;
    }
  }

  @override
  Map<String, dynamic> toJson(QuestionsState state) {
    if (state is LoadedQuestions) {
      try {
        final js = {
          'questions': state.questions.map((i) => i.toJson()).toList()
        };
        return js;
      } catch (_) {
        print('QuestionsState: toJson error');
        return null;
      }
    }
    return null;
  }
}
