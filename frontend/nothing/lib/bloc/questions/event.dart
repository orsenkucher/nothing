import 'package:equatable/equatable.dart';

abstract class QusEvent extends Equatable {
  const QusEvent();
}

class FetchQus extends QusEvent {
  final int count;

  const FetchQus({
    this.count = 4,
  });

  @override
  List<Object> get props => [count];
}

class QuestionAnswer extends QusEvent {
  final int idx;
  final bool answer;

  const QuestionAnswer({
    this.idx,
    this.answer,
  });

  @override
  List<Object> get props => [answer];
}
