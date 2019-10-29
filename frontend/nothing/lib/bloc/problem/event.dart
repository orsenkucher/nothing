import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:nothing/data/model/problem.dart';

@immutable
abstract class ProblemEvent extends Equatable {
  const ProblemEvent();
}

class AnsweredProblem extends ProblemEvent {
  final int id;
  final bool correct;
  const AnsweredProblem({
    @required this.id,
    @required this.correct,
  });

  @override
  List<Object> get props => [id, correct];
}

class NextProblem extends ProblemEvent {
  final Problem problem;
  const NextProblem({
    @required this.problem,
  });

  @override
  List<Object> get props => [problem];
}
