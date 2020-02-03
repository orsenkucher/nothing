import 'package:equatable/equatable.dart';
import 'package:nothing/data/model/question.dart';

abstract class FeedEvent extends Equatable {
  const FeedEvent();
}

class MoveNext extends FeedEvent {
  const MoveNext();

  @override
  List<Object> get props => [];
}

class NewArrived extends FeedEvent {
  final List<Question> batch;

  const NewArrived(this.batch);

  @override
  List<Object> get props => [batch];
}
