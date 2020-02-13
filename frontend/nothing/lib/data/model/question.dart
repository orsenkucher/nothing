import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

class Question extends Equatable {
  final int id;
  final String question;
  final String explanation;
  final List<String> answers;

  const Question({
    @required this.id,
    @required this.question,
    @required this.explanation,
    @required this.answers,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json['id'],
      question: json['question'],
      explanation: json['explanation'],
      answers: json['answers'],
      //(json['answers'] as List<dynamic>).map((i) => i).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'question': question,
      'explanation': explanation,
      'answers': answers,
    };
  }

  @override
  List<Object> get props => [
        id,
        question,
        explanation,
        answers,
      ];
}
