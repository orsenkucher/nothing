import 'package:equatable/equatable.dart';
import 'package:nothing/data/model/question.dart';

class Feed extends Equatable {
  final List<Question> batch;
  final int current;

  const Feed(this.batch, this.current);
  factory Feed.fromJson(Map<String, dynamic> json) {
    var feed = Feed(
      (json['batch'] as List<dynamic>)
          .map((i) => Question.fromJson(i))
          .toList(),
      json['current'],
    );
    return feed;
  }

  Map<String, dynamic> toJson() {
    final json = {
      'batch': batch.map((i) => i.toJson()).toList(),
      'current': current,
    };
    return json;
  }

  int get len => batch.length;

  @override
  List<Object> get props => [batch, current];
}

class EmptyFeed extends Feed {
  EmptyFeed() : super(List<Question>(), 0);
}
