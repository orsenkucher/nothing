import 'package:equatable/equatable.dart';

abstract class QuestionEvent extends Equatable {
  const QuestionEvent();
}

class NextQuestion extends QuestionEvent {
  const NextQuestion();

  @override
  List<Object> get props => null;
}
