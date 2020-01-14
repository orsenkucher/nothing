import 'package:bloc/bloc.dart';
import 'package:nothing/bloc/summary/event.dart';
import 'package:nothing/bloc/summary/state.dart';

export 'state.dart';
export 'event.dart';

class SummaryBloc extends Bloc<SummaryEvent, Summary> {
  @override
  Summary get initialState => EmptySummary();

  @override
  Stream<Summary> mapEventToState(
    SummaryEvent event,
  ) async* {
    if (event is NewAnswer) {
      var newState = Summary({
        ...state.summary,
        event.idx: event.answer,
      });
      yield newState;
    }
  }
}
