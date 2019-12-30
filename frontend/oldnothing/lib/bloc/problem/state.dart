import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:nothing/data/model/problem.dart';

abstract class ProblemState extends Equatable {
  const ProblemState();
}

class WaitingProblem extends ProblemState {
  @override
  List<Object> get props => [];
}

class NewProblem extends ProblemState {
  final Problem problem;
  final int index;

  const NewProblem({
    @required this.problem,
    @required this.index,
  });

  @override
  List<Object> get props => [problem, index];
}
