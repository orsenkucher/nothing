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
abstract class _ValidationState with _$_ValidationState {
  const factory _ValidationState.correct(
    Question question,
    List<String> tries,
    Duration duration,
  ) = _Correct;
  const factory _ValidationState.wrong(
    Question question,
    List<String> tries,
    TimePoints timePoints,
  ) = _Wrong;
  const factory _ValidationState.neutral(
    Question question,
    List<String> tries,
    TimePoints timePoints,
  ) = _Neutral;
}

@freezed
abstract class ValidationState with _$ValidationState {
  const factory ValidationState.just(_ValidationState state) = _Just;
  const factory ValidationState.nothing() = _Nothing;
}

@freezed
abstract class TimePoints with _$TimePoints {
  const factory TimePoints(List<DateTime> points) = _TimePoints;
  static TimePoints empty() => TimePoints([]);
}

extension $_TimePoints on TimePoints {
  Duration get duration {
    var acc = Duration.zero;
    for (var i = 0; i < this.points.length; i += 2) {
      acc += this.points[i + 1].difference(this.points[i]);
    }
    return acc;
  }

  TimePoints add(DateTime point) {
    return this.copyWith(points: [...this.points, point]);
  }
}

class ValidationBloc extends Bloc<ValidationEvent, ValidationState> {
  @override
  ValidationState get initialState => ValidationState.nothing();

  @override
  Stream<ValidationState> mapEventToState(ValidationEvent event) async* {
    yield event.when(
      focus: (question) => ValidationState.just(
        _ValidationState.neutral(question, [], TimePoints([DateTime.now()])),
      ),
      check: (answer) {
        return state.when<ValidationState>(
          nothing: () => ValidationState.nothing(),
          just: (state) {
            final question = state.question;
            final tries = state.tries;
            final next = state.question.splitted
                    .map((s) => s.toLowerCase())
                    .contains(answer.toLowerCase())
                ? _ValidationState.correct(
                    question,
                    tries,
                    state.map(
                      correct: (c) => throw UnimplementedError(),
                      neutral: (n) => n.timePoints.add(DateTime.now()).duration,
                      wrong: (w) => w.timePoints.add(DateTime.now()).duration,
                    ))
                : _ValidationState.wrong(
                    question,
                    [...tries, answer],
                    state.map(
                      correct: (c) => throw UnimplementedError(),
                      wrong: (w) => w.timePoints,
                      neutral: (n) => n.timePoints,
                    ));
            return ValidationState.just(next);
          },
        );
      },
    );
  }
}
