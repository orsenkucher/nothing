import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Question extends Equatable {
  final int id;
  final String question;
  final String left;
  final String right;

  const Question({
    @required this.id,
    @required this.question,
    @required this.left,
    @required this.right,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json['id'],
      question: json['question'],
      left: json['left'],
      right: json['right'],
    );
  }

  @override
  List<Object> get props => [question, left, right];
}
