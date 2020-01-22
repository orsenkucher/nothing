import 'package:equatable/equatable.dart';
import 'package:nothing/data/model/question.dart';
import 'package:nothing/error/cloud_error.dart';

abstract class QuestionsState extends Equatable {
  const QuestionsState();
}

class LoadingQuestions extends QuestionsState {
  const LoadingQuestions();

  @override
  List<Object> get props => [];
}

class LoadedQuestions extends QuestionsState {
  final List<Question> questions;

  const LoadedQuestions(this.questions);
  const LoadedQuestions.empty() : this(const []);

  @override
  List<Object> get props => [questions];
}

class FailedToLoadQuestions extends QuestionsState {
  final CloudError error;
  const FailedToLoadQuestions(this.error);
  @override
  List<Object> get props => [];
}
