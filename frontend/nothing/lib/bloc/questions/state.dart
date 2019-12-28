import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:nothing/data/model/question.dart';

abstract class QuestionsState extends Equatable {
  const QuestionsState();
}

class LoadingQuestions extends QuestionsState {
  const LoadingQuestions();

  @override
  List<Object> get props => [];
}

class LoadedQuestions extends QuestionsState {
  final List<Question> qus;

  const LoadedQuestions({
    @required this.qus,
  });

  @override
  List<Object> get props => [qus];
}

class QuestionsSummary extends QuestionsState {
  final Map<int, bool> summary;
  const QuestionsSummary({
    @required this.summary,
  });

  @override
  List<Object> get props => [summary];
}
