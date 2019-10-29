import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:nothing/data/model/problem.dart';
import 'package:nothing/error/cloud_error.dart';

@immutable
abstract class ProblemState extends Equatable {
  const ProblemState();
}

class LoadingProblem extends ProblemState {
  const LoadingProblem();

  @override
  List<Object> get props => [];
}

class LoadedProblem extends ProblemState {
  final List<Problem> problems;

  const LoadedProblem({
    @required this.problems,
  });

  @override
  List<Object> get props => [problems];
}

class LoadingError extends ProblemState {
  final CloudError error;

  const LoadingError({
    @required this.error,
  });

  @override
  List<Object> get props => [error];
}
