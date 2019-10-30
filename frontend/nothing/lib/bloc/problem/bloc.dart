import 'dart:async';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:nothing/bloc/problem/event.dart';
import 'package:nothing/bloc/problem/state.dart';
import 'package:nothing/bloc/problems/bloc.dart';
import 'package:nothing/data/model/problem.dart';

export 'event.dart';
export 'state.dart';

class ProblemBloc extends Bloc<ProblemEvent, ProblemState> {
  final ProblemsBloc problemsBloc;

  StreamSubscription<ProblemsState> _problemsSubscription;
  Iterator<Problem> _problems;
  int _index;
  Map<int, bool> _summary;

  ProblemBloc({
    @required this.problemsBloc,
  }) {
    _problemsSubscription = problemsBloc.listen((state) {
      if (state is LoadedProblems) {
        _problems = state.problems.iterator;
        _index = 0;
        _summary = Map();
        add(NextProblem());
      }
    });
  }

  @override
  ProblemState get initialState => WaitingProblem();

  @override
  Stream<ProblemState> mapEventToState(
    ProblemEvent event,
  ) async* {
    if (event is NextProblem) {
      yield* _mapNextProblemToState(event);
    } else if (event is AnsweredProblem) {
      yield* _mapAnsweredProblemToState(event);
    }
  }

  Stream<NewProblem> _mapNextProblemToState(NextProblem event) async* {
    if (_problems.moveNext()) {
      _index++;
      yield NewProblem(problem: _problems.current, index: _index);
    } else {
      print("THIS DONE");
      print(_summary);
      problemsBloc.add(AnsweredProblems(results: _summary));
    }
  }

  Stream<NewProblem> _mapAnsweredProblemToState(AnsweredProblem event) async* {
    final problem = _problems.current;
    final prepare = (String s) => s.toLowerCase().replaceAll(RegExp(r'\s'), '');
    _summary[problem.id] =
        problem.answers.map(prepare).contains(prepare(event.answer));

    add(NextProblem());
  }

  @override
  void close() {
    _problemsSubscription.cancel();
    super.close();
  }
}
