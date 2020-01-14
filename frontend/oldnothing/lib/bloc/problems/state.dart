import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:nothing/data/model/problem.dart';
import 'package:nothing/error/cloud_error.dart';

abstract class ProblemsState extends Equatable {
  const ProblemsState();
}

class LoadingProblems extends ProblemsState {
  const LoadingProblems();

  @override
  List<Object> get props => [];
}

class LoadedProblems extends ProblemsState {
  final List<Problem> problems;

  const LoadedProblems({
    @required this.problems,
  });

  @override
  List<Object> get props => [problems];
}

class LoadingError extends ProblemsState {
  final CloudError error;

  const LoadingError({
    @required this.error,
  });

  @override
  List<Object> get props => [error];
}
