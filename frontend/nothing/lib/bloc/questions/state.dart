import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:nothing/data/model/question.dart';

abstract class QusState extends Equatable {
  const QusState();
}

class LoadingQus extends QusState {
  const LoadingQus();

  @override
  List<Object> get props => [];
}

class LoadedQus extends QusState {
  final List<Question> qus;

  const LoadedQus({
    @required this.qus,
  });

  @override
  List<Object> get props => [qus];
}
