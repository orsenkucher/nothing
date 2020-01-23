import 'package:equatable/equatable.dart';

class Summary extends Equatable {
  final Map<int, bool> summary;
  final id;

  const Summary(this.summary, this.id);
  factory Summary.fromJson(Map<String, dynamic> json) {
    var feed = Summary(
      json['summary']
          .map((k, v) => MapEntry(int.parse(k), v))
          .cast<int, bool>(),
      json['id'],
    );
    return feed;
  }

  Map<String, dynamic> toJson() {
    final json = {
      'summary': summary.map((k, v) => MapEntry(k.toString(), v)),
      'id': id,
    };
    return json;
  }

  @override
  List<Object> get props => [summary, id];
}

class EmptySummary extends Summary {
  EmptySummary() : super(Map<int, bool>(), 0);
}
