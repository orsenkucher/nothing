import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:nothing/data/model/question.dart';

abstract class QuestionState extends Equatable {
  const QuestionState();
}

class NewQuestion extends QuestionState {
  final Question newQuestion;
  final Question prevQuestion;

  const NewQuestion({
    @required this.newQuestion,
    this.prevQuestion,
  });

  @override
  List<Object> get props => [newQuestion, prevQuestion];
}

class EmptyQuestion extends QuestionState {
  const EmptyQuestion();

  @override
  List<Object> get props => null;
}
