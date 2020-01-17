import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:nothing/bloc/summary/event.dart';
import 'package:nothing/bloc/summary/state.dart';
import 'package:rxdart/rxdart.dart';

export 'event.dart';
export 'state.dart';

class SummaryBloc extends Bloc<SummaryEvent, Summary> {
  @override
  Summary get initialState => EmptySummary();

  @override
  Stream<Summary> transformEvents(
    Stream<SummaryEvent> events,
    Stream<Summary> Function(SummaryEvent) next,
  ) {
    return super.transformEvents(
      events.split(
        (e) => e is NewAnswer,
        (yes) => yes
            .buffer(
              yes.debounceTime(const Duration(milliseconds: 150)),
            )
            .where((xs) => xs.length > 0)
            .map((xs) => xs.first)
            .doOnEach(
              (x) => print('--- YES: summary -> ${x.value}'),
            ),
        (no) => no.doOnEach(
          (x) => print(" --- NO: ${x.value}"),
        ),
      ),
      next,
    );
  }

  @override
  Stream<Summary> mapEventToState(
    SummaryEvent event,
  ) async* {
    if (event is NewAnswer) {
      var newState = Summary({
        ...state.summary,
        event.id: event.answer,
      }, state.id + 1);
      yield newState;
    } else if (event is ResetSummary) {
      yield initialState;
    }
  }
}

extension Split<T> on Stream<T> {
  Stream<T> split(
    bool condition(T event),
    Stream<T> yes(Stream<T> stream),
    Stream<T> no(Stream<T> stream),
  ) {
    return Rx.merge([
      this.where(condition).run(yes),
      this.where((x) => !condition(x)).run(no),
    ]);
  }

  Stream<T> run(Stream<T> chain(Stream<T> stream)) => chain(this);
}
