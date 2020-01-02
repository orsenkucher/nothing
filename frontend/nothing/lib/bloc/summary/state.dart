import 'package:equatable/equatable.dart';

class Summary extends Equatable {
  final Map<int, bool> summary;
  final id;

  const Summary(this.summary, this.id);

  @override
  List<Object> get props => [summary, id];
}

class EmptySummary extends Summary {
  EmptySummary() : super(Map<int, bool>(), 0);
}
