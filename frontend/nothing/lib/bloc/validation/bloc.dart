import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:bloc/bloc.dart';
import 'package:nothing/domain/domain.dart';

part 'bloc.freezed.dart';

@freezed
class ValidationEvent with _$ValidationEvent {
  const factory ValidationEvent.focus(Question question) = _Focus;
  const factory ValidationEvent.check(String answer) = _Check;
  const factory ValidationEvent.lifecycle(TimePoint point) = _Lifecycle;
  const factory ValidationEvent.skip() = _Skip;
}

@freezed
class _ValidationState2 with _$_ValidationState2 {
  const factory _ValidationState2.correct(
    Question question,
    List<String> answers,
    Duration duration,
  ) = Correct;
  const factory _ValidationState2.wrong(
    Question question,
    List<String> answers,
    TimePoints timePoints,
  ) = Wrong;
  const factory _ValidationState2.neutral(
    Question question,
    List<String> answers,
    TimePoints timePoints,
  ) = Neutral;
  const factory _ValidationState2.skip(
    Question question,
    List<String> answers,
    Duration duration,
  ) = Skipped;
}

@freezed
class ValidationState with _$ValidationState {
  const factory ValidationState.just(_ValidationState2 state) = _Just;
  const factory ValidationState.nothing() = _Nothing;
}

@freezed
class TimePoint with _$TimePoint {
  const factory TimePoint.resume(DateTime time) = _Resume;
  const factory TimePoint.suspend(DateTime time) = _Suspend;
  factory TimePoint.resumeNow() => TimePoint.resume(DateTime.now());
  factory TimePoint.suspendNow() => TimePoint.suspend(DateTime.now());
}

@freezed
class TimePoints with _$TimePoints {
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
  ValidationBloc() : super(ValidationState.nothing());

  @override
  Stream<ValidationState> mapEventToState(ValidationEvent event) async* {
    final next = event.when(
      skip: () => state.when(
        just: (state) => ValidationState.just(
          _ValidationState2.skip(
            state.question,
            [...state.answers],
            Duration.zero,
          ),
        ),
        nothing: () => ValidationState.nothing(),
      ),
      focus: (question) => ValidationState.just(
        _ValidationState2.neutral(question, [], TimePoints.fromNow()),
      ),
      check: (answer) => state.when<ValidationState?>(
        nothing: () => ValidationState.nothing(),
        just: (state) {
          final question = state.question;
          final answers = state.answers;
          final correct = state.question.splitted
              .map((s) => s.replaceAll(' ', ''))
              .map((s) => s.replaceAll('’', "'"))
              .map((s) => s.replaceAll('`', "'"))
              .map((s) => s.toLowerCase())
              .contains(answer.replaceAll(' ', '').toLowerCase());

          if (state is Correct || state is Skipped) {
            return null;
          }

          final timePoints = state.maybeMap(
            neutral: (n) => n.timePoints,
            wrong: (w) => w.timePoints,
            orElse: () => null,
          );
          final duration = timePoints!.add(TimePoint.suspendNow()).duration;

          if (correct) {
            return ValidationState.just(_ValidationState2.correct(question, [...answers, answer], duration));
          } else {
            return ValidationState.just(_ValidationState2.wrong(question, [...answers, answer], timePoints));
          }
        },
      ),
      lifecycle: (point) => state.when(
        nothing: () => ValidationState.nothing(),
        just: (state) => ValidationState.just(state.map(
          correct: (_) => state,
          skip: (_) => state,
          wrong: (w) => w.copyWith(timePoints: w.timePoints.add(point)),
          neutral: (n) => n.copyWith(timePoints: n.timePoints.add(point)),
        )),
      ),
    );

    if (next != null) yield next;
  }
}
