import 'package:equatable/equatable.dart';

abstract class QuestionsEvent extends Equatable {
  const QuestionsEvent();
}

class FetchQus extends QuestionsEvent {
  final int count;

  const FetchQus({
    this.count = 4,
  });

  @override
  List<Object> get props => [count];
}
