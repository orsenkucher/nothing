import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class ProblemEvent extends Equatable {
  const ProblemEvent();
}

class AnsweredProblem extends ProblemEvent {
  final String answer;
  const AnsweredProblem({
    @required this.answer,
  });

  @override
  List<Object> get props => [answer];
}

class NextProblem extends ProblemEvent {
  const NextProblem();

  @override
  List<Object> get props => null;
}
