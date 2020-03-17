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
    @required Result lifecycle(TimePoint point),
  });

  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result focus(Question question),
    Result check(String answer),
    Result lifecycle(TimePoint point),
    @required Result orElse(),
  });

  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result focus(_Focus value),
    @required Result check(_Check value),
    @required Result lifecycle(_Lifecycle value),
  });

  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result focus(_Focus value),
    Result check(_Check value),
    Result lifecycle(_Lifecycle value),
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

  _Lifecycle lifecycle(TimePoint point) {
    return _Lifecycle(
      point,
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
    @required Result lifecycle(TimePoint point),
  }) {
    assert(focus != null);
    assert(check != null);
    assert(lifecycle != null);
    return focus(question);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result focus(Question question),
    Result check(String answer),
    Result lifecycle(TimePoint point),
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
    @required Result lifecycle(_Lifecycle value),
  }) {
    assert(focus != null);
    assert(check != null);
    assert(lifecycle != null);
    return focus(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result focus(_Focus value),
    Result check(_Check value),
    Result lifecycle(_Lifecycle value),
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
    @required Result lifecycle(TimePoint point),
  }) {
    assert(focus != null);
    assert(check != null);
    assert(lifecycle != null);
    return check(answer);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result focus(Question question),
    Result check(String answer),
    Result lifecycle(TimePoint point),
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
    @required Result lifecycle(_Lifecycle value),
  }) {
    assert(focus != null);
    assert(check != null);
    assert(lifecycle != null);
    return check(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result focus(_Focus value),
    Result check(_Check value),
    Result lifecycle(_Lifecycle value),
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

class _$_Lifecycle with DiagnosticableTreeMixin implements _Lifecycle {
  const _$_Lifecycle(this.point) : assert(point != null);

  @override
  final TimePoint point;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ValidationEvent.lifecycle(point: $point)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ValidationEvent.lifecycle'))
      ..add(DiagnosticsProperty('point', point));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Lifecycle &&
            (identical(other.point, point) ||
                const DeepCollectionEquality().equals(other.point, point)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(point);

  @override
  _$_Lifecycle copyWith({
    Object point = freezed,
  }) {
    return _$_Lifecycle(
      point == freezed ? this.point : point as TimePoint,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result focus(Question question),
    @required Result check(String answer),
    @required Result lifecycle(TimePoint point),
  }) {
    assert(focus != null);
    assert(check != null);
    assert(lifecycle != null);
    return lifecycle(point);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result focus(Question question),
    Result check(String answer),
    Result lifecycle(TimePoint point),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (lifecycle != null) {
      return lifecycle(point);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result focus(_Focus value),
    @required Result check(_Check value),
    @required Result lifecycle(_Lifecycle value),
  }) {
    assert(focus != null);
    assert(check != null);
    assert(lifecycle != null);
    return lifecycle(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result focus(_Focus value),
    Result check(_Check value),
    Result lifecycle(_Lifecycle value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (lifecycle != null) {
      return lifecycle(this);
    }
    return orElse();
  }
}

abstract class _Lifecycle implements ValidationEvent {
  const factory _Lifecycle(TimePoint point) = _$_Lifecycle;

  TimePoint get point;

  _Lifecycle copyWith({TimePoint point});
}

mixin _$_ValidationState {
  Question get question;
  List<String> get answers;

  _ValidationState copyWith({Question question, List<String> answers});

  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result correct(
            Question question, List<String> answers, Duration duration),
    @required
        Result wrong(
            Question question, List<String> answers, TimePoints timePoints),
    @required
        Result neutral(
            Question question, List<String> answers, TimePoints timePoints),
  });

  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result correct(Question question, List<String> answers, Duration duration),
    Result wrong(
        Question question, List<String> answers, TimePoints timePoints),
    Result neutral(
        Question question, List<String> answers, TimePoints timePoints),
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

  _Correct correct(Question question, List<String> answers, Duration duration) {
    return _Correct(
      question,
      answers,
      duration,
    );
  }

  _Wrong wrong(Question question, List<String> answers, TimePoints timePoints) {
    return _Wrong(
      question,
      answers,
      timePoints,
    );
  }

  _Neutral neutral(
      Question question, List<String> answers, TimePoints timePoints) {
    return _Neutral(
      question,
      answers,
      timePoints,
    );
  }
}

const $_ValidationState = _$_ValidationStateTearOff();

class _$_Correct with DiagnosticableTreeMixin implements _Correct {
  const _$_Correct(this.question, this.answers, this.duration)
      : assert(question != null),
        assert(answers != null),
        assert(duration != null);

  @override
  final Question question;
  @override
  final List<String> answers;
  @override
  final Duration duration;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return '_ValidationState.correct(question: $question, answers: $answers, duration: $duration)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', '_ValidationState.correct'))
      ..add(DiagnosticsProperty('question', question))
      ..add(DiagnosticsProperty('answers', answers))
      ..add(DiagnosticsProperty('duration', duration));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Correct &&
            (identical(other.question, question) ||
                const DeepCollectionEquality()
                    .equals(other.question, question)) &&
            (identical(other.answers, answers) ||
                const DeepCollectionEquality()
                    .equals(other.answers, answers)) &&
            (identical(other.duration, duration) ||
                const DeepCollectionEquality()
                    .equals(other.duration, duration)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(question) ^
      const DeepCollectionEquality().hash(answers) ^
      const DeepCollectionEquality().hash(duration);

  @override
  _$_Correct copyWith({
    Object question = freezed,
    Object answers = freezed,
    Object duration = freezed,
  }) {
    return _$_Correct(
      question == freezed ? this.question : question as Question,
      answers == freezed ? this.answers : answers as List<String>,
      duration == freezed ? this.duration : duration as Duration,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result correct(
            Question question, List<String> answers, Duration duration),
    @required
        Result wrong(
            Question question, List<String> answers, TimePoints timePoints),
    @required
        Result neutral(
            Question question, List<String> answers, TimePoints timePoints),
  }) {
    assert(correct != null);
    assert(wrong != null);
    assert(neutral != null);
    return correct(question, answers, duration);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result correct(Question question, List<String> answers, Duration duration),
    Result wrong(
        Question question, List<String> answers, TimePoints timePoints),
    Result neutral(
        Question question, List<String> answers, TimePoints timePoints),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (correct != null) {
      return correct(question, answers, duration);
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
      Question question, List<String> answers, Duration duration) = _$_Correct;

  @override
  Question get question;
  @override
  List<String> get answers;
  Duration get duration;

  @override
  _Correct copyWith(
      {Question question, List<String> answers, Duration duration});
}

class _$_Wrong with DiagnosticableTreeMixin implements _Wrong {
  const _$_Wrong(this.question, this.answers, this.timePoints)
      : assert(question != null),
        assert(answers != null),
        assert(timePoints != null);

  @override
  final Question question;
  @override
  final List<String> answers;
  @override
  final TimePoints timePoints;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return '_ValidationState.wrong(question: $question, answers: $answers, timePoints: $timePoints)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', '_ValidationState.wrong'))
      ..add(DiagnosticsProperty('question', question))
      ..add(DiagnosticsProperty('answers', answers))
      ..add(DiagnosticsProperty('timePoints', timePoints));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Wrong &&
            (identical(other.question, question) ||
                const DeepCollectionEquality()
                    .equals(other.question, question)) &&
            (identical(other.answers, answers) ||
                const DeepCollectionEquality()
                    .equals(other.answers, answers)) &&
            (identical(other.timePoints, timePoints) ||
                const DeepCollectionEquality()
                    .equals(other.timePoints, timePoints)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(question) ^
      const DeepCollectionEquality().hash(answers) ^
      const DeepCollectionEquality().hash(timePoints);

  @override
  _$_Wrong copyWith({
    Object question = freezed,
    Object answers = freezed,
    Object timePoints = freezed,
  }) {
    return _$_Wrong(
      question == freezed ? this.question : question as Question,
      answers == freezed ? this.answers : answers as List<String>,
      timePoints == freezed ? this.timePoints : timePoints as TimePoints,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result correct(
            Question question, List<String> answers, Duration duration),
    @required
        Result wrong(
            Question question, List<String> answers, TimePoints timePoints),
    @required
        Result neutral(
            Question question, List<String> answers, TimePoints timePoints),
  }) {
    assert(correct != null);
    assert(wrong != null);
    assert(neutral != null);
    return wrong(question, answers, timePoints);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result correct(Question question, List<String> answers, Duration duration),
    Result wrong(
        Question question, List<String> answers, TimePoints timePoints),
    Result neutral(
        Question question, List<String> answers, TimePoints timePoints),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (wrong != null) {
      return wrong(question, answers, timePoints);
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
          Question question, List<String> answers, TimePoints timePoints) =
      _$_Wrong;

  @override
  Question get question;
  @override
  List<String> get answers;
  TimePoints get timePoints;

  @override
  _Wrong copyWith(
      {Question question, List<String> answers, TimePoints timePoints});
}

class _$_Neutral with DiagnosticableTreeMixin implements _Neutral {
  const _$_Neutral(this.question, this.answers, this.timePoints)
      : assert(question != null),
        assert(answers != null),
        assert(timePoints != null);

  @override
  final Question question;
  @override
  final List<String> answers;
  @override
  final TimePoints timePoints;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return '_ValidationState.neutral(question: $question, answers: $answers, timePoints: $timePoints)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', '_ValidationState.neutral'))
      ..add(DiagnosticsProperty('question', question))
      ..add(DiagnosticsProperty('answers', answers))
      ..add(DiagnosticsProperty('timePoints', timePoints));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Neutral &&
            (identical(other.question, question) ||
                const DeepCollectionEquality()
                    .equals(other.question, question)) &&
            (identical(other.answers, answers) ||
                const DeepCollectionEquality()
                    .equals(other.answers, answers)) &&
            (identical(other.timePoints, timePoints) ||
                const DeepCollectionEquality()
                    .equals(other.timePoints, timePoints)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(question) ^
      const DeepCollectionEquality().hash(answers) ^
      const DeepCollectionEquality().hash(timePoints);

  @override
  _$_Neutral copyWith({
    Object question = freezed,
    Object answers = freezed,
    Object timePoints = freezed,
  }) {
    return _$_Neutral(
      question == freezed ? this.question : question as Question,
      answers == freezed ? this.answers : answers as List<String>,
      timePoints == freezed ? this.timePoints : timePoints as TimePoints,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result correct(
            Question question, List<String> answers, Duration duration),
    @required
        Result wrong(
            Question question, List<String> answers, TimePoints timePoints),
    @required
        Result neutral(
            Question question, List<String> answers, TimePoints timePoints),
  }) {
    assert(correct != null);
    assert(wrong != null);
    assert(neutral != null);
    return neutral(question, answers, timePoints);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result correct(Question question, List<String> answers, Duration duration),
    Result wrong(
        Question question, List<String> answers, TimePoints timePoints),
    Result neutral(
        Question question, List<String> answers, TimePoints timePoints),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (neutral != null) {
      return neutral(question, answers, timePoints);
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
          Question question, List<String> answers, TimePoints timePoints) =
      _$_Neutral;

  @override
  Question get question;
  @override
  List<String> get answers;
  TimePoints get timePoints;

  @override
  _Neutral copyWith(
      {Question question, List<String> answers, TimePoints timePoints});
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

mixin _$TimePoint {
  DateTime get time;

  TimePoint copyWith({DateTime time});

  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result resume(DateTime time),
    @required Result suspend(DateTime time),
  });

  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result resume(DateTime time),
    Result suspend(DateTime time),
    @required Result orElse(),
  });

  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result resume(_Resume value),
    @required Result suspend(_Suspend value),
  });

  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result resume(_Resume value),
    Result suspend(_Suspend value),
    @required Result orElse(),
  });
}

class _$TimePointTearOff {
  const _$TimePointTearOff();

  _Resume resume(DateTime time) {
    return _Resume(
      time,
    );
  }

  _Suspend suspend(DateTime time) {
    return _Suspend(
      time,
    );
  }
}

const $TimePoint = _$TimePointTearOff();

class _$_Resume with DiagnosticableTreeMixin implements _Resume {
  const _$_Resume(this.time) : assert(time != null);

  @override
  final DateTime time;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TimePoint.resume(time: $time)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TimePoint.resume'))
      ..add(DiagnosticsProperty('time', time));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Resume &&
            (identical(other.time, time) ||
                const DeepCollectionEquality().equals(other.time, time)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(time);

  @override
  _$_Resume copyWith({
    Object time = freezed,
  }) {
    return _$_Resume(
      time == freezed ? this.time : time as DateTime,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result resume(DateTime time),
    @required Result suspend(DateTime time),
  }) {
    assert(resume != null);
    assert(suspend != null);
    return resume(time);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result resume(DateTime time),
    Result suspend(DateTime time),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (resume != null) {
      return resume(time);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result resume(_Resume value),
    @required Result suspend(_Suspend value),
  }) {
    assert(resume != null);
    assert(suspend != null);
    return resume(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result resume(_Resume value),
    Result suspend(_Suspend value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (resume != null) {
      return resume(this);
    }
    return orElse();
  }
}

abstract class _Resume implements TimePoint {
  const factory _Resume(DateTime time) = _$_Resume;

  @override
  DateTime get time;

  @override
  _Resume copyWith({DateTime time});
}

class _$_Suspend with DiagnosticableTreeMixin implements _Suspend {
  const _$_Suspend(this.time) : assert(time != null);

  @override
  final DateTime time;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TimePoint.suspend(time: $time)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TimePoint.suspend'))
      ..add(DiagnosticsProperty('time', time));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Suspend &&
            (identical(other.time, time) ||
                const DeepCollectionEquality().equals(other.time, time)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(time);

  @override
  _$_Suspend copyWith({
    Object time = freezed,
  }) {
    return _$_Suspend(
      time == freezed ? this.time : time as DateTime,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result resume(DateTime time),
    @required Result suspend(DateTime time),
  }) {
    assert(resume != null);
    assert(suspend != null);
    return suspend(time);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result resume(DateTime time),
    Result suspend(DateTime time),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (suspend != null) {
      return suspend(time);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result resume(_Resume value),
    @required Result suspend(_Suspend value),
  }) {
    assert(resume != null);
    assert(suspend != null);
    return suspend(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result resume(_Resume value),
    Result suspend(_Suspend value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (suspend != null) {
      return suspend(this);
    }
    return orElse();
  }
}

abstract class _Suspend implements TimePoint {
  const factory _Suspend(DateTime time) = _$_Suspend;

  @override
  DateTime get time;

  @override
  _Suspend copyWith({DateTime time});
}

mixin _$TimePoints {
  List<TimePoint> get points;

  TimePoints copyWith({List<TimePoint> points});
}

class _$TimePointsTearOff {
  const _$TimePointsTearOff();

  _TimePoints call(List<TimePoint> points) {
    return _TimePoints(
      points,
    );
  }
}

const $TimePoints = _$TimePointsTearOff();

class _$_TimePoints with DiagnosticableTreeMixin implements _TimePoints {
  const _$_TimePoints(this.points) : assert(points != null);

  @override
  final List<TimePoint> points;

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
      points == freezed ? this.points : points as List<TimePoint>,
    );
  }
}

abstract class _TimePoints implements TimePoints {
  const factory _TimePoints(List<TimePoint> points) = _$_TimePoints;

  @override
  List<TimePoint> get points;

  @override
  _TimePoints copyWith({List<TimePoint> points});
}
