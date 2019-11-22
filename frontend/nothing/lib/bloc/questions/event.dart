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
