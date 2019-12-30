import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Problem extends Equatable {
  final int id;
  final String question;
  final String explanation;
  final List<String> answers;

  const Problem({
    @required this.id,
    @required this.question,
    @required this.explanation,
    @required this.answers,
  });

  factory Problem.fromJson(Map<String, dynamic> json) {
    return Problem(
      id: json['id'],
      question: json['question'],
      explanation: json['explanation'],
      answers: List<String>.from(json['answers']),
    );
  }

  @override
  List<Object> get props => [question, explanation, answers];
}
