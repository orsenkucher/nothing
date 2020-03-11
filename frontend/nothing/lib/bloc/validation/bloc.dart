import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:bloc/bloc.dart';
import 'package:nothing/domain/domain.dart';

part 'bloc.freezed.dart';

@freezed
abstract class ValidationEvent with _$ValidationEvent {
  const factory ValidationEvent.focus(Question question) = _Focus;
  const factory ValidationEvent.check(String answer) = _Check;
}

@freezed
abstract class ValidationState with _$ValidationState {
  const factory ValidationState.correct(
    Question question,
    List<String> tries,
    Duration duration,
  ) = _Correct;
  const factory ValidationState.wrong(
    Question question,
    List<String> tries,
    List<DateTime> timePoints,
  ) = _Wrong;
  const factory ValidationState.neutral(
    Question question,
    List<String> tries,
    List<DateTime> timePoints,
  ) = _Neutral;

  // Вот бы задать что за nothing может идти только neutral
  //
  // Маркиро, [09.03.20 22:57]
  // Шо метро во франции в компайл тайме проверяет кучу кейсов на ошибки
  // Потому что там нельзя открыть дверь два раза, ибо открытый тип двери не открывается
  // Перескоки на станции невозможны
  const factory ValidationState.nothing() = _Nothing;
}

class TimePoints {
  final List<DateTime> _points = List<DateTime>();
  void add(DateTime point) {
    _points.add(point);
  }

  Duration get duration {
    // assert(_points.length % 2 == 0);
    var acc = Duration.zero;
    for (var i = 0; i < _points.length; i += 2) {
      acc += _points[i + 1].difference(_points[i]);
    }
    return acc;
  }
}

class ValidationBloc extends Bloc<ValidationEvent, ValidationState> {
  // final FeedBloc feed;
  // StreamSubscription _sub;

  // ValidationBloc() {
  //   //{@required this.feed}) {
  //   _sub = listen(
  //     (state) {
  //       state.maybeWhen<Function>(
  //         correct: (qid, tries, duration) => () {
  //           // feed.add(
  //           //   FeedEvent.moveNext(
  //           //       duration.inSeconds > 90 ? MoveDir.left() : MoveDir.right()),
  //           // );
  //           // ==================
  //           Future.delayed(const Duration(seconds: 3), () {
  //             state.maybeMap(
  //               correct: (_) => add(ValidationEvent.purge()),
  //               orElse: () {},
  //             );
  //           });
  //         },
  //         orElse: () => () {},
  //       )();
  //     },
  //   );
  // }

  // @override
  // Future<void> close() async {
  //   await _sub.cancel();
  //   return super.close();
  // }

  @override
  ValidationState get initialState =>
      // ValidationState.neutral(feed.state?.tree?.question?.id ?? -1, 0, DateTime.now());
      // ValidationState.neutral(0, 0, DateTime.now());
      // neutral();
      // ValidationState.neutral(null, [], [DateTime.now()]);
      ValidationState.nothing();

  // ValidationState neutral([Question q, bool green = false]) =>
  //     ValidationState.neutral(q, 0, DateTime.now(), green);

  @override
  Stream<ValidationState> mapEventToState(ValidationEvent event) async* {
    // Боже, это не фп, а какой-то бред))
    yield event.when(
      focus: (question) =>
          ValidationState.neutral(question, [], [DateTime.now()]),

      // focus: (question) => neutral(question, true),
      // focus: (question) => state.copyWith(question: question),
      // purge: () => state.maybeMap(
      //       correct: (s) => neutral(s.question),
      //       orElse: () => state,
      //     ),
      // purge: () => ValidationState.neutral(
      //     state.question,
      //     state.tries,
      //     state.map(
      //         correct: (_) => DateTime.now(),
      //         neutral: (s) => s.time,
      //         wrong: (s) => s.time)), //neutral(state.question),
      // check: (ans) => (state.question?.splitted
      //             ?.map((s) => s.toLowerCase())
      //             ?.contains(ans.toLowerCase()) ??
      //         false)
      //     ? ValidationState.correct(
      //         state.question,
      //         state.tries,
      //         DateTime.now().difference(state.when(
      //           correct: (_, __, ____) => DateTime.now(),
      //           neutral: (_, __, t, ____) => t,
      //           wrong: (_, __, t) => t,
      //         )))
      //     : ValidationState.wrong(
      //         state.question,
      //         state.tries + 1,
      //         state.when(
      //           correct: (_, __, ___) => DateTime.now(),
      //           neutral: (_, __, t, ____) => t,
      //           wrong: (_, __, t) => t,
      check: (answer) {
        // if (state.maybeWhen(nothing: () => true, orElse: () => false)) return;
        // check(ValidationState){

        // }
        // state.maybeWhen( nothing: (_),orElse: ());

        return state.maybeWhen<ValidationState>(
          nothing: () => ValidationState.nothing(),
          orElse: () {
            // if (state is _Nothing) return;
            // state.
            return ValidationState.nothing();
          },
        );
      },
    );
  }
}
