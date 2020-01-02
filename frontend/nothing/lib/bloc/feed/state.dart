import 'package:equatable/equatable.dart';
import 'package:nothing/data/model/question.dart';

class Feed extends Equatable {
  final List<Question> batch;
  final List<Question> prevBatch;

  const Feed(this.batch, this.prevBatch);

  @override
  List<Object> get props => [batch, prevBatch];
}

class EmptyFeed extends Feed {
  EmptyFeed() : super(List<Question>(), List<Question>());
}
