import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:nothing/bloc/problem/event.dart';
import 'package:nothing/bloc/problem/state.dart';

export 'event.dart';
export 'state.dart';

class ProblemBloc extends Bloc<ProblemEvent, ProblemState> {
  @override
  ProblemState get initialState => InitialProblemState();

  @override
  Stream<ProblemState> mapEventToState(
    ProblemEvent event,
  ) async* {
    if (event is NextProblem) {
      yield NewProblem(problem: event.problem);
    } else if (event is AnsweredProblem) {
      // yield NewProblem
    }
  }
}
