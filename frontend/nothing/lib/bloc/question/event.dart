import 'package:equatable/equatable.dart';

abstract class QuestionEvent extends Equatable {
  const QuestionEvent();
}

class QuestionAnswer extends QuestionEvent {
  final bool answer;

  const QuestionAnswer({
    this.answer,
  });

  @override
  List<Object> get props => [answer];
}
