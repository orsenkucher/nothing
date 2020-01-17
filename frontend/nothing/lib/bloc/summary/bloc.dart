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
      // events
      //     .doOnEach(
      //   (x) => print("**EVENTS $x"),
      // )
      //     .split(
      //   (e) => e is NewAnswer,
      //   (yes) {
      //     final window = yes
      //         .doOnEach((_) => print("**Bounce IN"))
      //         .debounceTime(const Duration(milliseconds: 330))
      //         .doOnEach((_) => print("**Bounce OUT"))
      //           ..listen((x) => print("YOYOYO $x"));
      //     return yes
      //         .doOnEach((e) => print("**YES $e"))
      //         .buffer(
      //           window,
      //         )
      //         .where((xs) => xs.length > 0)
      //         // .where(_where)
      //         .map((xs) => xs.first)
      //         .doOnEach(
      //           (x) => print('--- YES: summary -> ${x.value}'),
      //         );
      //   },
      //   (no) => no.doOnEach((x) => print(" --- NO: ${x.value}")),
      // ),
      // events,
      // (Stream<SummaryEvent> events) {
      //   return events;
      // }(events),
      () {
        // final events = events
        final local = events.publishValue();
        // final local = events.publish().autoConnect();
        final yesline = local
            .where((x) => x is NewAnswer)
            .buffer(local.debounceTime(const Duration(seconds: 1)))
            .where((xs) => xs.length > 0)
            .map((xs) => xs.first)
            .doOnEach((x) => print('YES: $x'));
        final noline = local
            .where((x) => !(x is NewAnswer))
            .doOnEach((x) => print('NO: $x'));
        final merged = yesline.mergeWith([noline]);
        // local.conn
        local.connect();
        return merged;
      }(),
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

// extension Split<T> on Stream<T> {
//   Stream<T> split(
//     bool condition(T event),
//     Stream<T> yes(Stream<T> stream),
//     Stream<T> no(Stream<T> stream),
//   ) {
//     final broadcast = this.asBroadcastStream();
//     return Rx.merge([
//       broadcast.where(condition).chain(yes),
//       broadcast.where((x) => !condition(x)).chain(no),
//     ]);
//   }

//   Stream<T> chain(Stream<T> logic(Stream<T> stream)) => logic(this);
// }
