import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:nothing/data/problem_repo.dart';
import 'package:nothing/error/cloud_error.dart';
import './bloc.dart';

class ProblemBloc extends Bloc<ProblemEvent, ProblemState> {
  final ProblemRepo problemRepo;

  ProblemBloc({
    @required this.problemRepo,
  });

  @override
  ProblemState get initialState => LoadingProblem();

  @override
  Stream<ProblemState> mapEventToState(
    ProblemEvent event,
  ) async* {
    if (event is FetchProblems) {
      yield LoadingProblem();
      try {
        yield LoadedProblem(
          problems: await problemRepo.fetchProblems(event.count),
        );
      } on CloudError catch (error) {
        yield LoadingError(error: error);
      }
    }
  }
}
