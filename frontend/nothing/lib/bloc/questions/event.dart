import 'package:equatable/equatable.dart';

abstract class QuestionsEvent extends Equatable {
  const QuestionsEvent();
}

class FetchQuestions extends QuestionsEvent {
  const FetchQuestions();

  @override
  List<Object> get props => [];
}
