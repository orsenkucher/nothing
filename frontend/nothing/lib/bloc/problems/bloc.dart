import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nothing/bloc/problem/bloc.dart';
import 'package:nothing/bloc/problems/event.dart';
import 'package:nothing/bloc/problems/state.dart';
import 'package:nothing/data/problem_repo.dart';
import 'package:nothing/error/cloud_error.dart';

export 'event.dart';
export 'state.dart';

class ProblemsBloc extends Bloc<ProblemsEvent, ProblemsState> {
  final ProblemRepo problemRepo;
  final BuildContext context;

  ProblemsBloc({
    @required this.problemRepo,
    @required this.context,
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
        var problems = await problemRepo.fetchProblems(event.count);
        yield LoadedProblems(
          problems: problems,
        );
        if (problems.length > 0) {
          BlocProvider.of<ProblemBloc>(context)
              .add(NextProblem(problem: problems[0]));
        }
      } on CloudError catch (error) {
        yield LoadingError(error: error);
      }
    }
  }
}
