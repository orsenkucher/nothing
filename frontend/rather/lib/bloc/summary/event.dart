import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class SummaryEvent extends Equatable {
  const SummaryEvent();
}

class NewAnswer extends SummaryEvent {
  final int id;
  final bool answer;

  const NewAnswer({
    @required this.id,
    @required this.answer,
  });

  @override
  List<Object> get props => [id, answer];

  @override
  String toString() => 'Answer: $id -> $answer :: ${super.toString()}';
}

class ResetSummary extends SummaryEvent {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'Reset :: ${super.toString()}';
}
