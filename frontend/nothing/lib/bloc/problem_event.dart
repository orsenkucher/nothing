import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

@immutable
abstract class ProblemEvent extends Equatable {
  const ProblemEvent();
}

class FetchProblems extends ProblemEvent {
  final int count;

  const FetchProblems({
    @required this.count,
  });

  @override
  List<Object> get props => [count];
}
