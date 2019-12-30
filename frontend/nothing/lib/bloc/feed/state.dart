import 'package:equatable/equatable.dart';
import 'package:nothing/data/model/question.dart';

class Feed extends Equatable {
  final List<Question> batch;

  const Feed(this.batch);

  @override
  List<Object> get props => [batch];
}

class EmptyFeed extends Feed {
  EmptyFeed() : super(List<Question>());
}
