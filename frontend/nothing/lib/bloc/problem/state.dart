import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:nothing/data/model/problem.dart';

abstract class ProblemState extends Equatable {
  const ProblemState();
}

class InitialProblemState extends ProblemState {
  @override
  List<Object> get props => [];
}

class NewProblem extends ProblemState {
  final Problem problem;

  const NewProblem({
    @required this.problem,
  });

  @override
  List<Object> get props => [problem];
}
