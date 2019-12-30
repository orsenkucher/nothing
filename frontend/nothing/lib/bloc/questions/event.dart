import 'package:equatable/equatable.dart';

abstract class QuestionsEvent extends Equatable {
  const QuestionsEvent();
}

class FetchQuestions extends QuestionsEvent {
  final int count;

  const FetchQuestions(this.count);

  @override
  List<Object> get props => [count];
}
