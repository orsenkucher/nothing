import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class SummaryEvent extends Equatable {
  const SummaryEvent();
}

class NewAnswer extends SummaryEvent {
  final int idx;
  final bool answer;

  const NewAnswer({
    @required this.idx,
    @required this.answer,
  });

  @override
  List<Object> get props => [idx, answer];
}

class ResetSummary extends SummaryEvent {
  @override
  List<Object> get props => [];
}
