import 'package:equatable/equatable.dart';
import 'package:nothing/data/model/question.dart';

class Feed extends Equatable {
  final List<Question> batch;
  final int current;

  const Feed(this.batch, this.current);

  int get len => batch.length;

  @override
  List<Object> get props => [batch, current];
}

class EmptyFeed extends Feed {
  EmptyFeed() : super(List<Question>(), 0);
}
