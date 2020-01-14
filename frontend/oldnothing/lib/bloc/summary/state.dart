import 'package:equatable/equatable.dart';

class Summary extends Equatable {
  final Map<int, bool> summary;
  const Summary(this.summary);

  @override
  List<Object> get props => [summary];
}

class EmptySummary extends Summary {
  EmptySummary() : super(Map<int, bool>());
}
