import 'package:meta/meta.dart';

@immutable
abstract class PlayState {}

class LoadingState extends PlayState {}

class TasksState extends PlayState {
  final List<Task> tasks;

  TasksState({
    @required this.tasks,
  });

  factory TasksState.fromJson(List<dynamic> json) {
    var tasks = json.map((f) => Task.fromJson(f)).toList();
    return TasksState(tasks: tasks);
  }
}

class Task {
  final String question;
  final String explanation;
  final List<String> answers;

  Task({
    @required this.question,
    @required this.explanation,
    @required this.answers,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      question: json['question'],
      explanation: json['explanation'],
      answers: List<String>.from(json['answer']),
    );
  }
}
