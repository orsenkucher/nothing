import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Question extends Equatable {
  final int id;
  final String question;
  final String left;
  final String right;
  final int leftn;
  final int rightn;

  const Question({
    @required this.id,
    @required this.question,
    @required this.left,
    @required this.right,
    this.leftn = 0,
    this.rightn = 0,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json['id'],
      question: json['question'],
      left: json['left'],
      right: json['right'],
      leftn: json['leftn'],
      rightn: json['rightn'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'question': question,
      'left': left,
      'right': right,
      'leftn': leftn,
      'rightn': rightn,
    };
  }

  @override
  List<Object> get props => [
        id,
        question,
        left,
        right,
        leftn,
        rightn,
      ];
}
