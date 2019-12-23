import 'package:nothing/bloc/question/event.dart';
import 'package:nothing/bloc/question/state.dart';

import 'package:bloc/bloc.dart';
export 'event.dart';
export 'state.dart';

class QuestionBloc extends Bloc<QuestionEvent, QuestionState> {
  QuestionBloc();

  @override
  QuestionState get initialState => null;

  @override
  Stream<QuestionState> mapEventToState(QuestionEvent event) async* {
    if (event is QuestionAnswer) {
      // yield
    }
  }
}
