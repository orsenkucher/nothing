import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:nothing/bloc/problems/event.dart';
import 'package:nothing/bloc/problems/state.dart';
import 'package:nothing/data/problems_repo.dart';
import 'package:nothing/error/cloud_error.dart';

export 'event.dart';
export 'state.dart';

class ProblemsBloc extends Bloc<ProblemsEvent, ProblemsState> {
  final ProblemsRepo problemsRepo;

  ProblemsBloc({
    @required this.problemsRepo,
  });

  @override
  ProblemsState get initialState => LoadingProblems();

  @override
  Stream<ProblemsState> mapEventToState(
    ProblemsEvent event,
  ) async* {
    if (event is FetchProblems) {
      yield LoadingProblems();
      try {
        var problems = await problemsRepo.fetchProblems(event.count);
        yield LoadedProblems(
          problems: problems,
        );
      } on CloudError catch (error) {
        yield LoadingError(error: error);
      }
    } else if (event is AnsweredProblems) {
      print(event.results);
      add(FetchProblems());
    }
  }
}
