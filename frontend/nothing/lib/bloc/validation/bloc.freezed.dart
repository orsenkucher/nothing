// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$ValidationEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result focus(Question question),
    @required Result check(String answer),
  });

  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result focus(Question question),
    Result check(String answer),
    @required Result orElse(),
  });

  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result focus(_Focus value),
    @required Result check(_Check value),
  });

  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result focus(_Focus value),
    Result check(_Check value),
    @required Result orElse(),
  });
}

class _$ValidationEventTearOff {
  const _$ValidationEventTearOff();

  _Focus focus(Question question) {
    return _Focus(
      question,
    );
  }

  _Check check(String answer) {
    return _Check(
      answer,
    );
  }
}

const $ValidationEvent = _$ValidationEventTearOff();

class _$_Focus with DiagnosticableTreeMixin implements _Focus {
  const _$_Focus(this.question) : assert(question != null);

  @override
  final Question question;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ValidationEvent.focus(question: $question)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ValidationEvent.focus'))
      ..add(DiagnosticsProperty('question', question));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Focus &&
            (identical(other.question, question) ||
                const DeepCollectionEquality()
                    .equals(other.question, question)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(question);

  @override
  _$_Focus copyWith({
    Object question = freezed,
  }) {
    return _$_Focus(
      question == freezed ? this.question : question as Question,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result focus(Question question),
    @required Result check(String answer),
  }) {
    assert(focus != null);
    assert(check != null);
    return focus(question);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result focus(Question question),
    Result check(String answer),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (focus != null) {
      return focus(question);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result focus(_Focus value),
    @required Result check(_Check value),
  }) {
    assert(focus != null);
    assert(check != null);
    return focus(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result focus(_Focus value),
    Result check(_Check value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (focus != null) {
      return focus(this);
    }
    return orElse();
  }
}

abstract class _Focus implements ValidationEvent {
  const factory _Focus(Question question) = _$_Focus;

  Question get question;

  _Focus copyWith({Question question});
}

class _$_Check with DiagnosticableTreeMixin implements _Check {
  const _$_Check(this.answer) : assert(answer != null);

  @override
  final String answer;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ValidationEvent.check(answer: $answer)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ValidationEvent.check'))
      ..add(DiagnosticsProperty('answer', answer));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Check &&
            (identical(other.answer, answer) ||
                const DeepCollectionEquality().equals(other.answer, answer)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(answer);

  @override
  _$_Check copyWith({
    Object answer = freezed,
  }) {
    return _$_Check(
      answer == freezed ? this.answer : answer as String,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result focus(Question question),
    @required Result check(String answer),
  }) {
    assert(focus != null);
    assert(check != null);
    return check(answer);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result focus(Question question),
    Result check(String answer),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (check != null) {
      return check(answer);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result focus(_Focus value),
    @required Result check(_Check value),
  }) {
    assert(focus != null);
    assert(check != null);
    return check(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result focus(_Focus value),
    Result check(_Check value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (check != null) {
      return check(this);
    }
    return orElse();
  }
}

abstract class _Check implements ValidationEvent {
  const factory _Check(String answer) = _$_Check;

  String get answer;

  _Check copyWith({String answer});
}

mixin _$_ValidationState {
  Question get question;
  List<String> get tries;

  _ValidationState copyWith({Question question, List<String> tries});

  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result correct(
            Question question, List<String> tries, Duration duration),
    @required
        Result wrong(
            Question question, List<String> tries, TimePoints timePoints),
    @required
        Result neutral(
            Question question, List<String> tries, TimePoints timePoints),
  });

  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result correct(Question question, List<String> tries, Duration duration),
    Result wrong(Question question, List<String> tries, TimePoints timePoints),
    Result neutral(
        Question question, List<String> tries, TimePoints timePoints),
    @required Result orElse(),
  });

  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result correct(_Correct value),
    @required Result wrong(_Wrong value),
    @required Result neutral(_Neutral value),
  });

  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result correct(_Correct value),
    Result wrong(_Wrong value),
    Result neutral(_Neutral value),
    @required Result orElse(),
  });
}

class _$_ValidationStateTearOff {
  const _$_ValidationStateTearOff();

  _Correct correct(Question question, List<String> tries, Duration duration) {
    return _Correct(
      question,
      tries,
      duration,
    );
  }

  _Wrong wrong(Question question, List<String> tries, TimePoints timePoints) {
    return _Wrong(
      question,
      tries,
      timePoints,
    );
  }

  _Neutral neutral(
      Question question, List<String> tries, TimePoints timePoints) {
    return _Neutral(
      question,
      tries,
      timePoints,
    );
  }
}

const $_ValidationState = _$_ValidationStateTearOff();

class _$_Correct with DiagnosticableTreeMixin implements _Correct {
  const _$_Correct(this.question, this.tries, this.duration)
      : assert(question != null),
        assert(tries != null),
        assert(duration != null);

  @override
  final Question question;
  @override
  final List<String> tries;
  @override
  final Duration duration;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return '_ValidationState.correct(question: $question, tries: $tries, duration: $duration)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', '_ValidationState.correct'))
      ..add(DiagnosticsProperty('question', question))
      ..add(DiagnosticsProperty('tries', tries))
      ..add(DiagnosticsProperty('duration', duration));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Correct &&
            (identical(other.question, question) ||
                const DeepCollectionEquality()
                    .equals(other.question, question)) &&
            (identical(other.tries, tries) ||
                const DeepCollectionEquality().equals(other.tries, tries)) &&
            (identical(other.duration, duration) ||
                const DeepCollectionEquality()
                    .equals(other.duration, duration)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(question) ^
      const DeepCollectionEquality().hash(tries) ^
      const DeepCollectionEquality().hash(duration);

  @override
  _$_Correct copyWith({
    Object question = freezed,
    Object tries = freezed,
    Object duration = freezed,
  }) {
    return _$_Correct(
      question == freezed ? this.question : question as Question,
      tries == freezed ? this.tries : tries as List<String>,
      duration == freezed ? this.duration : duration as Duration,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result correct(
            Question question, List<String> tries, Duration duration),
    @required
        Result wrong(
            Question question, List<String> tries, TimePoints timePoints),
    @required
        Result neutral(
            Question question, List<String> tries, TimePoints timePoints),
  }) {
    assert(correct != null);
    assert(wrong != null);
    assert(neutral != null);
    return correct(question, tries, duration);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result correct(Question question, List<String> tries, Duration duration),
    Result wrong(Question question, List<String> tries, TimePoints timePoints),
    Result neutral(
        Question question, List<String> tries, TimePoints timePoints),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (correct != null) {
      return correct(question, tries, duration);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result correct(_Correct value),
    @required Result wrong(_Wrong value),
    @required Result neutral(_Neutral value),
  }) {
    assert(correct != null);
    assert(wrong != null);
    assert(neutral != null);
    return correct(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result correct(_Correct value),
    Result wrong(_Wrong value),
    Result neutral(_Neutral value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (correct != null) {
      return correct(this);
    }
    return orElse();
  }
}

abstract class _Correct implements _ValidationState {
  const factory _Correct(
      Question question, List<String> tries, Duration duration) = _$_Correct;

  @override
  Question get question;
  @override
  List<String> get tries;
  Duration get duration;

  @override
  _Correct copyWith({Question question, List<String> tries, Duration duration});
}

class _$_Wrong with DiagnosticableTreeMixin implements _Wrong {
  const _$_Wrong(this.question, this.tries, this.timePoints)
      : assert(question != null),
        assert(tries != null),
        assert(timePoints != null);

  @override
  final Question question;
  @override
  final List<String> tries;
  @override
  final TimePoints timePoints;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return '_ValidationState.wrong(question: $question, tries: $tries, timePoints: $timePoints)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', '_ValidationState.wrong'))
      ..add(DiagnosticsProperty('question', question))
      ..add(DiagnosticsProperty('tries', tries))
      ..add(DiagnosticsProperty('timePoints', timePoints));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Wrong &&
            (identical(other.question, question) ||
                const DeepCollectionEquality()
                    .equals(other.question, question)) &&
            (identical(other.tries, tries) ||
                const DeepCollectionEquality().equals(other.tries, tries)) &&
            (identical(other.timePoints, timePoints) ||
                const DeepCollectionEquality()
                    .equals(other.timePoints, timePoints)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(question) ^
      const DeepCollectionEquality().hash(tries) ^
      const DeepCollectionEquality().hash(timePoints);

  @override
  _$_Wrong copyWith({
    Object question = freezed,
    Object tries = freezed,
    Object timePoints = freezed,
  }) {
    return _$_Wrong(
      question == freezed ? this.question : question as Question,
      tries == freezed ? this.tries : tries as List<String>,
      timePoints == freezed ? this.timePoints : timePoints as TimePoints,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result correct(
            Question question, List<String> tries, Duration duration),
    @required
        Result wrong(
            Question question, List<String> tries, TimePoints timePoints),
    @required
        Result neutral(
            Question question, List<String> tries, TimePoints timePoints),
  }) {
    assert(correct != null);
    assert(wrong != null);
    assert(neutral != null);
    return wrong(question, tries, timePoints);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result correct(Question question, List<String> tries, Duration duration),
    Result wrong(Question question, List<String> tries, TimePoints timePoints),
    Result neutral(
        Question question, List<String> tries, TimePoints timePoints),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (wrong != null) {
      return wrong(question, tries, timePoints);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result correct(_Correct value),
    @required Result wrong(_Wrong value),
    @required Result neutral(_Neutral value),
  }) {
    assert(correct != null);
    assert(wrong != null);
    assert(neutral != null);
    return wrong(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result correct(_Correct value),
    Result wrong(_Wrong value),
    Result neutral(_Neutral value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (wrong != null) {
      return wrong(this);
    }
    return orElse();
  }
}

abstract class _Wrong implements _ValidationState {
  const factory _Wrong(
      Question question, List<String> tries, TimePoints timePoints) = _$_Wrong;

  @override
  Question get question;
  @override
  List<String> get tries;
  TimePoints get timePoints;

  @override
  _Wrong copyWith(
      {Question question, List<String> tries, TimePoints timePoints});
}

class _$_Neutral with DiagnosticableTreeMixin implements _Neutral {
  const _$_Neutral(this.question, this.tries, this.timePoints)
      : assert(question != null),
        assert(tries != null),
        assert(timePoints != null);

  @override
  final Question question;
  @override
  final List<String> tries;
  @override
  final TimePoints timePoints;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return '_ValidationState.neutral(question: $question, tries: $tries, timePoints: $timePoints)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', '_ValidationState.neutral'))
      ..add(DiagnosticsProperty('question', question))
      ..add(DiagnosticsProperty('tries', tries))
      ..add(DiagnosticsProperty('timePoints', timePoints));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Neutral &&
            (identical(other.question, question) ||
                const DeepCollectionEquality()
                    .equals(other.question, question)) &&
            (identical(other.tries, tries) ||
                const DeepCollectionEquality().equals(other.tries, tries)) &&
            (identical(other.timePoints, timePoints) ||
                const DeepCollectionEquality()
                    .equals(other.timePoints, timePoints)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(question) ^
      const DeepCollectionEquality().hash(tries) ^
      const DeepCollectionEquality().hash(timePoints);

  @override
  _$_Neutral copyWith({
    Object question = freezed,
    Object tries = freezed,
    Object timePoints = freezed,
  }) {
    return _$_Neutral(
      question == freezed ? this.question : question as Question,
      tries == freezed ? this.tries : tries as List<String>,
      timePoints == freezed ? this.timePoints : timePoints as TimePoints,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result correct(
            Question question, List<String> tries, Duration duration),
    @required
        Result wrong(
            Question question, List<String> tries, TimePoints timePoints),
    @required
        Result neutral(
            Question question, List<String> tries, TimePoints timePoints),
  }) {
    assert(correct != null);
    assert(wrong != null);
    assert(neutral != null);
    return neutral(question, tries, timePoints);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result correct(Question question, List<String> tries, Duration duration),
    Result wrong(Question question, List<String> tries, TimePoints timePoints),
    Result neutral(
        Question question, List<String> tries, TimePoints timePoints),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (neutral != null) {
      return neutral(question, tries, timePoints);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result correct(_Correct value),
    @required Result wrong(_Wrong value),
    @required Result neutral(_Neutral value),
  }) {
    assert(correct != null);
    assert(wrong != null);
    assert(neutral != null);
    return neutral(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result correct(_Correct value),
    Result wrong(_Wrong value),
    Result neutral(_Neutral value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (neutral != null) {
      return neutral(this);
    }
    return orElse();
  }
}

abstract class _Neutral implements _ValidationState {
  const factory _Neutral(
          Question question, List<String> tries, TimePoints timePoints) =
      _$_Neutral;

  @override
  Question get question;
  @override
  List<String> get tries;
  TimePoints get timePoints;

  @override
  _Neutral copyWith(
      {Question question, List<String> tries, TimePoints timePoints});
}

mixin _$ValidationState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result just(_ValidationState state),
    @required Result nothing(),
  });

  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result just(_ValidationState state),
    Result nothing(),
    @required Result orElse(),
  });

  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result just(_Just value),
    @required Result nothing(_Nothing value),
  });

  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result just(_Just value),
    Result nothing(_Nothing value),
    @required Result orElse(),
  });
}

class _$ValidationStateTearOff {
  const _$ValidationStateTearOff();

  _Just just(_ValidationState state) {
    return _Just(
      state,
    );
  }

  _Nothing nothing() {
    return const _Nothing();
  }
}

const $ValidationState = _$ValidationStateTearOff();

class _$_Just with DiagnosticableTreeMixin implements _Just {
  const _$_Just(this.state) : assert(state != null);

  @override
  final _ValidationState state;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ValidationState.just(state: $state)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ValidationState.just'))
      ..add(DiagnosticsProperty('state', state));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Just &&
            (identical(other.state, state) ||
                const DeepCollectionEquality().equals(other.state, state)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(state);

  @override
  _$_Just copyWith({
    Object state = freezed,
  }) {
    return _$_Just(
      state == freezed ? this.state : state as _ValidationState,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result just(_ValidationState state),
    @required Result nothing(),
  }) {
    assert(just != null);
    assert(nothing != null);
    return just(state);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result just(_ValidationState state),
    Result nothing(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (just != null) {
      return just(state);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result just(_Just value),
    @required Result nothing(_Nothing value),
  }) {
    assert(just != null);
    assert(nothing != null);
    return just(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result just(_Just value),
    Result nothing(_Nothing value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (just != null) {
      return just(this);
    }
    return orElse();
  }
}

abstract class _Just implements ValidationState {
  const factory _Just(_ValidationState state) = _$_Just;

  _ValidationState get state;

  _Just copyWith({_ValidationState state});
}

class _$_Nothing with DiagnosticableTreeMixin implements _Nothing {
  const _$_Nothing();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ValidationState.nothing()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'ValidationState.nothing'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Nothing);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result just(_ValidationState state),
    @required Result nothing(),
  }) {
    assert(just != null);
    assert(nothing != null);
    return nothing();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result just(_ValidationState state),
    Result nothing(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (nothing != null) {
      return nothing();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result just(_Just value),
    @required Result nothing(_Nothing value),
  }) {
    assert(just != null);
    assert(nothing != null);
    return nothing(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result just(_Just value),
    Result nothing(_Nothing value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (nothing != null) {
      return nothing(this);
    }
    return orElse();
  }
}

abstract class _Nothing implements ValidationState {
  const factory _Nothing() = _$_Nothing;
}

mixin _$TimePoints {
  List<DateTime> get points;

  TimePoints copyWith({List<DateTime> points});
}

class _$TimePointsTearOff {
  const _$TimePointsTearOff();

  _TimePoints call(List<DateTime> points) {
    return _TimePoints(
      points,
    );
  }
}

const $TimePoints = _$TimePointsTearOff();

class _$_TimePoints with DiagnosticableTreeMixin implements _TimePoints {
  const _$_TimePoints(this.points) : assert(points != null);

  @override
  final List<DateTime> points;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TimePoints(points: $points)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TimePoints'))
      ..add(DiagnosticsProperty('points', points));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TimePoints &&
            (identical(other.points, points) ||
                const DeepCollectionEquality().equals(other.points, points)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(points);

  @override
  _$_TimePoints copyWith({
    Object points = freezed,
  }) {
    return _$_TimePoints(
      points == freezed ? this.points : points as List<DateTime>,
    );
  }
}

abstract class _TimePoints implements TimePoints {
  const factory _TimePoints(List<DateTime> points) = _$_TimePoints;

  @override
  List<DateTime> get points;

  @override
  _TimePoints copyWith({List<DateTime> points});
}
