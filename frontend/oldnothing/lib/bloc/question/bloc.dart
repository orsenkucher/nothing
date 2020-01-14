import 'dart:async';

import 'package:meta/meta.dart';
import 'package:nothing/bloc/question/event.dart';
import 'package:nothing/bloc/question/state.dart';
import 'package:bloc/bloc.dart';
import 'package:nothing/bloc/questions/bloc.dart';
import 'package:nothing/data/model/question.dart';

export 'event.dart';
export 'state.dart';

class QuestionBloc extends Bloc<QuestionEvent, QuestionState> {
  final QuestionsBloc questionsBloc;

  StreamSubscription<QuestionsState> _qusetionsSub;
  Iterator<Question> _questions;
  // int _index;

  QuestionBloc({
    @required this.questionsBloc,
  }) {
    _qusetionsSub = questionsBloc.listen((state) {
      if (state is LoadedQuestions) {
        _questions = state.qus.iterator;
        // _index = 0;
        add(NextQuestion());
      }
    });
  }

  @override
  QuestionState get initialState => EmptyQuestion();

  @override
  Stream<QuestionState> mapEventToState(QuestionEvent event) async* {
    print('Next Question');
    final prev = _questions.current;
    if (_questions.moveNext()) {
      // _index++;
      print('Next Question Firing');
      yield NewQuestion(
        newQuestion: _questions.current,
        prevQuestion: prev,
      );
    }
  }

  @override
  void close() {
    _qusetionsSub.cancel();
    super.close();
  }
}
