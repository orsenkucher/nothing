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
  const factory ValidationEvent.lifecycle(TimePoint point) = _Lifecycle;
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
abstract class TimePoint with _$TimePoint {
  const factory TimePoint.resume(DateTime time) = _Resume;
  const factory TimePoint.suspend(DateTime time) = _Suspend;
  factory TimePoint.resumeNow() => TimePoint.resume(DateTime.now());
  factory TimePoint.suspendNow() => TimePoint.suspend(DateTime.now());
}

@freezed
abstract class TimePoints with _$TimePoints {
  const factory TimePoints(List<TimePoint> points) = _TimePoints;
  factory TimePoints.fromNow() => TimePoints([TimePoint.resumeNow()]);
}

extension TimePoints$ on TimePoints {
  Duration get duration {
    var acc = Duration.zero;
    for (var i = 0; i < this.points.length; i += 2) {
      acc += this.points[i + 1].time.difference(this.points[i].time);
    }
    print('TIME: ${acc.inSeconds}s, ${this.points.length} points');
    return acc;
  }

  TimePoints add(TimePoint point) {
    if (this.points.isEmpty) {
      if (point is _Resume) {
        return this.copyWith(points: [point]);
      } else {
        return this;
      }
    }
    if (this.points.last.runtimeType != point.runtimeType) {
      return this.copyWith(points: [...this.points, point]);
    }
    return this;
  }
}

class ValidationBloc extends Bloc<ValidationEvent, ValidationState> {
  @override
  ValidationState get initialState => ValidationState.nothing();

  @override
  Stream<ValidationState> mapEventToState(ValidationEvent event) async* {
    yield event.when(
      focus: (question) => ValidationState.just(
        _ValidationState.neutral(question, [], TimePoints.fromNow()),
      ),
      check: (answer) => state.when<ValidationState>(
        nothing: () => ValidationState.nothing(),
        just: (state) {
          final question = state.question;
          final tries = state.tries;
          final next = state.question.splitted
                  .map((s) => s.toLowerCase())
                  .contains(answer.toLowerCase())
              ? _ValidationState.correct(
                  question,
                  [...tries, answer],
                  state.map(
                    correct: (c) => throw UnimplementedError(),
                    neutral: (n) =>
                        n.timePoints.add(TimePoint.suspendNow()).duration,
                    wrong: (w) =>
                        w.timePoints.add(TimePoint.suspendNow()).duration,
                  ))
              : _ValidationState.wrong(
                  question,
                  [...tries, answer],
                  state.map(
                    correct: (c) => throw UnimplementedError(),
                    neutral: (n) => n.timePoints,
                    wrong: (w) => w.timePoints,
                  ));
          return ValidationState.just(next);
        },
      ),
      lifecycle: (point) => state.when(
        nothing: () => ValidationState.nothing(),
        just: (state) => ValidationState.just(state.map(
          correct: (_) => state,
          wrong: (w) => w.copyWith(timePoints: w.timePoints.add(point)),
          neutral: (n) => n.copyWith(timePoints: n.timePoints.add(point)),
        )),
      ),
    );
  }
}
