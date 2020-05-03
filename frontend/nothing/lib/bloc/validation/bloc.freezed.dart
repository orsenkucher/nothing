// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

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

  _Skip skip() {
    return const _Skip();
  }
}

// ignore: unused_element
const $ValidationEvent = _$ValidationEventTearOff();

mixin _$ValidationEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result focus(Question question),
    @required Result check(String answer),
    @required Result lifecycle(TimePoint point),
    @required Result skip(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result focus(Question question),
    Result check(String answer),
    Result lifecycle(TimePoint point),
    Result skip(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result focus(_Focus value),
    @required Result check(_Check value),
    @required Result lifecycle(_Lifecycle value),
    @required Result skip(_Skip value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result focus(_Focus value),
    Result check(_Check value),
    Result lifecycle(_Lifecycle value),
    Result skip(_Skip value),
    @required Result orElse(),
  });
}

abstract class $ValidationEventCopyWith<$Res> {
  factory $ValidationEventCopyWith(
          ValidationEvent value, $Res Function(ValidationEvent) then) =
      _$ValidationEventCopyWithImpl<$Res>;
}

class _$ValidationEventCopyWithImpl<$Res>
    implements $ValidationEventCopyWith<$Res> {
  _$ValidationEventCopyWithImpl(this._value, this._then);

  final ValidationEvent _value;
  // ignore: unused_field
  final $Res Function(ValidationEvent) _then;
}

abstract class _$FocusCopyWith<$Res> {
  factory _$FocusCopyWith(_Focus value, $Res Function(_Focus) then) =
      __$FocusCopyWithImpl<$Res>;
  $Res call({Question question});

  $QuestionCopyWith<$Res> get question;
}

class __$FocusCopyWithImpl<$Res> extends _$ValidationEventCopyWithImpl<$Res>
    implements _$FocusCopyWith<$Res> {
  __$FocusCopyWithImpl(_Focus _value, $Res Function(_Focus) _then)
      : super(_value, (v) => _then(v as _Focus));

  @override
  _Focus get _value => super._value as _Focus;

  @override
  $Res call({
    Object question = freezed,
  }) {
    return _then(_Focus(
      question == freezed ? _value.question : question as Question,
    ));
  }

  @override
  $QuestionCopyWith<$Res> get question {
    if (_value.question == null) {
      return null;
    }
    return $QuestionCopyWith<$Res>(_value.question, (value) {
      return _then(_value.copyWith(question: value));
    });
  }
}

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
  _$FocusCopyWith<_Focus> get copyWith =>
      __$FocusCopyWithImpl<_Focus>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result focus(Question question),
    @required Result check(String answer),
    @required Result lifecycle(TimePoint point),
    @required Result skip(),
  }) {
    assert(focus != null);
    assert(check != null);
    assert(lifecycle != null);
    assert(skip != null);
    return focus(question);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result focus(Question question),
    Result check(String answer),
    Result lifecycle(TimePoint point),
    Result skip(),
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
    @required Result skip(_Skip value),
  }) {
    assert(focus != null);
    assert(check != null);
    assert(lifecycle != null);
    assert(skip != null);
    return focus(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result focus(_Focus value),
    Result check(_Check value),
    Result lifecycle(_Lifecycle value),
    Result skip(_Skip value),
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
  _$FocusCopyWith<_Focus> get copyWith;
}

abstract class _$CheckCopyWith<$Res> {
  factory _$CheckCopyWith(_Check value, $Res Function(_Check) then) =
      __$CheckCopyWithImpl<$Res>;
  $Res call({String answer});
}

class __$CheckCopyWithImpl<$Res> extends _$ValidationEventCopyWithImpl<$Res>
    implements _$CheckCopyWith<$Res> {
  __$CheckCopyWithImpl(_Check _value, $Res Function(_Check) _then)
      : super(_value, (v) => _then(v as _Check));

  @override
  _Check get _value => super._value as _Check;

  @override
  $Res call({
    Object answer = freezed,
  }) {
    return _then(_Check(
      answer == freezed ? _value.answer : answer as String,
    ));
  }
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
  _$CheckCopyWith<_Check> get copyWith =>
      __$CheckCopyWithImpl<_Check>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result focus(Question question),
    @required Result check(String answer),
    @required Result lifecycle(TimePoint point),
    @required Result skip(),
  }) {
    assert(focus != null);
    assert(check != null);
    assert(lifecycle != null);
    assert(skip != null);
    return check(answer);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result focus(Question question),
    Result check(String answer),
    Result lifecycle(TimePoint point),
    Result skip(),
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
    @required Result skip(_Skip value),
  }) {
    assert(focus != null);
    assert(check != null);
    assert(lifecycle != null);
    assert(skip != null);
    return check(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result focus(_Focus value),
    Result check(_Check value),
    Result lifecycle(_Lifecycle value),
    Result skip(_Skip value),
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
  _$CheckCopyWith<_Check> get copyWith;
}

abstract class _$LifecycleCopyWith<$Res> {
  factory _$LifecycleCopyWith(
          _Lifecycle value, $Res Function(_Lifecycle) then) =
      __$LifecycleCopyWithImpl<$Res>;
  $Res call({TimePoint point});

  $TimePointCopyWith<$Res> get point;
}

class __$LifecycleCopyWithImpl<$Res> extends _$ValidationEventCopyWithImpl<$Res>
    implements _$LifecycleCopyWith<$Res> {
  __$LifecycleCopyWithImpl(_Lifecycle _value, $Res Function(_Lifecycle) _then)
      : super(_value, (v) => _then(v as _Lifecycle));

  @override
  _Lifecycle get _value => super._value as _Lifecycle;

  @override
  $Res call({
    Object point = freezed,
  }) {
    return _then(_Lifecycle(
      point == freezed ? _value.point : point as TimePoint,
    ));
  }

  @override
  $TimePointCopyWith<$Res> get point {
    if (_value.point == null) {
      return null;
    }
    return $TimePointCopyWith<$Res>(_value.point, (value) {
      return _then(_value.copyWith(point: value));
    });
  }
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
  _$LifecycleCopyWith<_Lifecycle> get copyWith =>
      __$LifecycleCopyWithImpl<_Lifecycle>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result focus(Question question),
    @required Result check(String answer),
    @required Result lifecycle(TimePoint point),
    @required Result skip(),
  }) {
    assert(focus != null);
    assert(check != null);
    assert(lifecycle != null);
    assert(skip != null);
    return lifecycle(point);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result focus(Question question),
    Result check(String answer),
    Result lifecycle(TimePoint point),
    Result skip(),
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
    @required Result skip(_Skip value),
  }) {
    assert(focus != null);
    assert(check != null);
    assert(lifecycle != null);
    assert(skip != null);
    return lifecycle(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result focus(_Focus value),
    Result check(_Check value),
    Result lifecycle(_Lifecycle value),
    Result skip(_Skip value),
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
  _$LifecycleCopyWith<_Lifecycle> get copyWith;
}

abstract class _$SkipCopyWith<$Res> {
  factory _$SkipCopyWith(_Skip value, $Res Function(_Skip) then) =
      __$SkipCopyWithImpl<$Res>;
}

class __$SkipCopyWithImpl<$Res> extends _$ValidationEventCopyWithImpl<$Res>
    implements _$SkipCopyWith<$Res> {
  __$SkipCopyWithImpl(_Skip _value, $Res Function(_Skip) _then)
      : super(_value, (v) => _then(v as _Skip));

  @override
  _Skip get _value => super._value as _Skip;
}

class _$_Skip with DiagnosticableTreeMixin implements _Skip {
  const _$_Skip();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ValidationEvent.skip()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'ValidationEvent.skip'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Skip);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result focus(Question question),
    @required Result check(String answer),
    @required Result lifecycle(TimePoint point),
    @required Result skip(),
  }) {
    assert(focus != null);
    assert(check != null);
    assert(lifecycle != null);
    assert(skip != null);
    return skip();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result focus(Question question),
    Result check(String answer),
    Result lifecycle(TimePoint point),
    Result skip(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (skip != null) {
      return skip();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result focus(_Focus value),
    @required Result check(_Check value),
    @required Result lifecycle(_Lifecycle value),
    @required Result skip(_Skip value),
  }) {
    assert(focus != null);
    assert(check != null);
    assert(lifecycle != null);
    assert(skip != null);
    return skip(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result focus(_Focus value),
    Result check(_Check value),
    Result lifecycle(_Lifecycle value),
    Result skip(_Skip value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (skip != null) {
      return skip(this);
    }
    return orElse();
  }
}

abstract class _Skip implements ValidationEvent {
  const factory _Skip() = _$_Skip;
}

class _$_ValidationState2TearOff {
  const _$_ValidationState2TearOff();

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

  _Skipped skip(Question question, List<String> answers, Duration duration) {
    return _Skipped(
      question,
      answers,
      duration,
    );
  }
}

// ignore: unused_element
const _$ValidationState2 = _$_ValidationState2TearOff();

mixin _$_ValidationState2 {
  Question get question;
  List<String> get answers;

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
    @required
        Result skip(Question question, List<String> answers, Duration duration),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result correct(Question question, List<String> answers, Duration duration),
    Result wrong(
        Question question, List<String> answers, TimePoints timePoints),
    Result neutral(
        Question question, List<String> answers, TimePoints timePoints),
    Result skip(Question question, List<String> answers, Duration duration),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result correct(_Correct value),
    @required Result wrong(_Wrong value),
    @required Result neutral(_Neutral value),
    @required Result skip(_Skipped value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result correct(_Correct value),
    Result wrong(_Wrong value),
    Result neutral(_Neutral value),
    Result skip(_Skipped value),
    @required Result orElse(),
  });

  _$ValidationState2CopyWith<_ValidationState2> get copyWith;
}

abstract class _$ValidationState2CopyWith<$Res> {
  factory _$ValidationState2CopyWith(
          _ValidationState2 value, $Res Function(_ValidationState2) then) =
      __$ValidationState2CopyWithImpl<$Res>;
  $Res call({Question question, List<String> answers});

  $QuestionCopyWith<$Res> get question;
}

class __$ValidationState2CopyWithImpl<$Res>
    implements _$ValidationState2CopyWith<$Res> {
  __$ValidationState2CopyWithImpl(this._value, this._then);

  final _ValidationState2 _value;
  // ignore: unused_field
  final $Res Function(_ValidationState2) _then;

  @override
  $Res call({
    Object question = freezed,
    Object answers = freezed,
  }) {
    return _then(_value.copyWith(
      question: question == freezed ? _value.question : question as Question,
      answers: answers == freezed ? _value.answers : answers as List<String>,
    ));
  }

  @override
  $QuestionCopyWith<$Res> get question {
    if (_value.question == null) {
      return null;
    }
    return $QuestionCopyWith<$Res>(_value.question, (value) {
      return _then(_value.copyWith(question: value));
    });
  }
}

abstract class _$CorrectCopyWith<$Res>
    implements _$ValidationState2CopyWith<$Res> {
  factory _$CorrectCopyWith(_Correct value, $Res Function(_Correct) then) =
      __$CorrectCopyWithImpl<$Res>;
  @override
  $Res call({Question question, List<String> answers, Duration duration});

  @override
  $QuestionCopyWith<$Res> get question;
}

class __$CorrectCopyWithImpl<$Res> extends __$ValidationState2CopyWithImpl<$Res>
    implements _$CorrectCopyWith<$Res> {
  __$CorrectCopyWithImpl(_Correct _value, $Res Function(_Correct) _then)
      : super(_value, (v) => _then(v as _Correct));

  @override
  _Correct get _value => super._value as _Correct;

  @override
  $Res call({
    Object question = freezed,
    Object answers = freezed,
    Object duration = freezed,
  }) {
    return _then(_Correct(
      question == freezed ? _value.question : question as Question,
      answers == freezed ? _value.answers : answers as List<String>,
      duration == freezed ? _value.duration : duration as Duration,
    ));
  }
}

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
    return '_ValidationState2.correct(question: $question, answers: $answers, duration: $duration)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', '_ValidationState2.correct'))
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
  _$CorrectCopyWith<_Correct> get copyWith =>
      __$CorrectCopyWithImpl<_Correct>(this, _$identity);

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
    @required
        Result skip(Question question, List<String> answers, Duration duration),
  }) {
    assert(correct != null);
    assert(wrong != null);
    assert(neutral != null);
    assert(skip != null);
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
    Result skip(Question question, List<String> answers, Duration duration),
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
    @required Result skip(_Skipped value),
  }) {
    assert(correct != null);
    assert(wrong != null);
    assert(neutral != null);
    assert(skip != null);
    return correct(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result correct(_Correct value),
    Result wrong(_Wrong value),
    Result neutral(_Neutral value),
    Result skip(_Skipped value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (correct != null) {
      return correct(this);
    }
    return orElse();
  }
}

abstract class _Correct implements _ValidationState2 {
  const factory _Correct(
      Question question, List<String> answers, Duration duration) = _$_Correct;

  @override
  Question get question;
  @override
  List<String> get answers;
  Duration get duration;
  @override
  _$CorrectCopyWith<_Correct> get copyWith;
}

abstract class _$WrongCopyWith<$Res>
    implements _$ValidationState2CopyWith<$Res> {
  factory _$WrongCopyWith(_Wrong value, $Res Function(_Wrong) then) =
      __$WrongCopyWithImpl<$Res>;
  @override
  $Res call({Question question, List<String> answers, TimePoints timePoints});

  @override
  $QuestionCopyWith<$Res> get question;
  $TimePointsCopyWith<$Res> get timePoints;
}

class __$WrongCopyWithImpl<$Res> extends __$ValidationState2CopyWithImpl<$Res>
    implements _$WrongCopyWith<$Res> {
  __$WrongCopyWithImpl(_Wrong _value, $Res Function(_Wrong) _then)
      : super(_value, (v) => _then(v as _Wrong));

  @override
  _Wrong get _value => super._value as _Wrong;

  @override
  $Res call({
    Object question = freezed,
    Object answers = freezed,
    Object timePoints = freezed,
  }) {
    return _then(_Wrong(
      question == freezed ? _value.question : question as Question,
      answers == freezed ? _value.answers : answers as List<String>,
      timePoints == freezed ? _value.timePoints : timePoints as TimePoints,
    ));
  }

  @override
  $TimePointsCopyWith<$Res> get timePoints {
    if (_value.timePoints == null) {
      return null;
    }
    return $TimePointsCopyWith<$Res>(_value.timePoints, (value) {
      return _then(_value.copyWith(timePoints: value));
    });
  }
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
    return '_ValidationState2.wrong(question: $question, answers: $answers, timePoints: $timePoints)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', '_ValidationState2.wrong'))
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
  _$WrongCopyWith<_Wrong> get copyWith =>
      __$WrongCopyWithImpl<_Wrong>(this, _$identity);

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
    @required
        Result skip(Question question, List<String> answers, Duration duration),
  }) {
    assert(correct != null);
    assert(wrong != null);
    assert(neutral != null);
    assert(skip != null);
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
    Result skip(Question question, List<String> answers, Duration duration),
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
    @required Result skip(_Skipped value),
  }) {
    assert(correct != null);
    assert(wrong != null);
    assert(neutral != null);
    assert(skip != null);
    return wrong(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result correct(_Correct value),
    Result wrong(_Wrong value),
    Result neutral(_Neutral value),
    Result skip(_Skipped value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (wrong != null) {
      return wrong(this);
    }
    return orElse();
  }
}

abstract class _Wrong implements _ValidationState2 {
  const factory _Wrong(
          Question question, List<String> answers, TimePoints timePoints) =
      _$_Wrong;

  @override
  Question get question;
  @override
  List<String> get answers;
  TimePoints get timePoints;
  @override
  _$WrongCopyWith<_Wrong> get copyWith;
}

abstract class _$NeutralCopyWith<$Res>
    implements _$ValidationState2CopyWith<$Res> {
  factory _$NeutralCopyWith(_Neutral value, $Res Function(_Neutral) then) =
      __$NeutralCopyWithImpl<$Res>;
  @override
  $Res call({Question question, List<String> answers, TimePoints timePoints});

  @override
  $QuestionCopyWith<$Res> get question;
  $TimePointsCopyWith<$Res> get timePoints;
}

class __$NeutralCopyWithImpl<$Res> extends __$ValidationState2CopyWithImpl<$Res>
    implements _$NeutralCopyWith<$Res> {
  __$NeutralCopyWithImpl(_Neutral _value, $Res Function(_Neutral) _then)
      : super(_value, (v) => _then(v as _Neutral));

  @override
  _Neutral get _value => super._value as _Neutral;

  @override
  $Res call({
    Object question = freezed,
    Object answers = freezed,
    Object timePoints = freezed,
  }) {
    return _then(_Neutral(
      question == freezed ? _value.question : question as Question,
      answers == freezed ? _value.answers : answers as List<String>,
      timePoints == freezed ? _value.timePoints : timePoints as TimePoints,
    ));
  }

  @override
  $TimePointsCopyWith<$Res> get timePoints {
    if (_value.timePoints == null) {
      return null;
    }
    return $TimePointsCopyWith<$Res>(_value.timePoints, (value) {
      return _then(_value.copyWith(timePoints: value));
    });
  }
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
    return '_ValidationState2.neutral(question: $question, answers: $answers, timePoints: $timePoints)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', '_ValidationState2.neutral'))
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
  _$NeutralCopyWith<_Neutral> get copyWith =>
      __$NeutralCopyWithImpl<_Neutral>(this, _$identity);

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
    @required
        Result skip(Question question, List<String> answers, Duration duration),
  }) {
    assert(correct != null);
    assert(wrong != null);
    assert(neutral != null);
    assert(skip != null);
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
    Result skip(Question question, List<String> answers, Duration duration),
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
    @required Result skip(_Skipped value),
  }) {
    assert(correct != null);
    assert(wrong != null);
    assert(neutral != null);
    assert(skip != null);
    return neutral(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result correct(_Correct value),
    Result wrong(_Wrong value),
    Result neutral(_Neutral value),
    Result skip(_Skipped value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (neutral != null) {
      return neutral(this);
    }
    return orElse();
  }
}

abstract class _Neutral implements _ValidationState2 {
  const factory _Neutral(
          Question question, List<String> answers, TimePoints timePoints) =
      _$_Neutral;

  @override
  Question get question;
  @override
  List<String> get answers;
  TimePoints get timePoints;
  @override
  _$NeutralCopyWith<_Neutral> get copyWith;
}

abstract class _$SkippedCopyWith<$Res>
    implements _$ValidationState2CopyWith<$Res> {
  factory _$SkippedCopyWith(_Skipped value, $Res Function(_Skipped) then) =
      __$SkippedCopyWithImpl<$Res>;
  @override
  $Res call({Question question, List<String> answers, Duration duration});

  @override
  $QuestionCopyWith<$Res> get question;
}

class __$SkippedCopyWithImpl<$Res> extends __$ValidationState2CopyWithImpl<$Res>
    implements _$SkippedCopyWith<$Res> {
  __$SkippedCopyWithImpl(_Skipped _value, $Res Function(_Skipped) _then)
      : super(_value, (v) => _then(v as _Skipped));

  @override
  _Skipped get _value => super._value as _Skipped;

  @override
  $Res call({
    Object question = freezed,
    Object answers = freezed,
    Object duration = freezed,
  }) {
    return _then(_Skipped(
      question == freezed ? _value.question : question as Question,
      answers == freezed ? _value.answers : answers as List<String>,
      duration == freezed ? _value.duration : duration as Duration,
    ));
  }
}

class _$_Skipped with DiagnosticableTreeMixin implements _Skipped {
  const _$_Skipped(this.question, this.answers, this.duration)
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
    return '_ValidationState2.skip(question: $question, answers: $answers, duration: $duration)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', '_ValidationState2.skip'))
      ..add(DiagnosticsProperty('question', question))
      ..add(DiagnosticsProperty('answers', answers))
      ..add(DiagnosticsProperty('duration', duration));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Skipped &&
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
  _$SkippedCopyWith<_Skipped> get copyWith =>
      __$SkippedCopyWithImpl<_Skipped>(this, _$identity);

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
    @required
        Result skip(Question question, List<String> answers, Duration duration),
  }) {
    assert(correct != null);
    assert(wrong != null);
    assert(neutral != null);
    assert(skip != null);
    return skip(question, answers, duration);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result correct(Question question, List<String> answers, Duration duration),
    Result wrong(
        Question question, List<String> answers, TimePoints timePoints),
    Result neutral(
        Question question, List<String> answers, TimePoints timePoints),
    Result skip(Question question, List<String> answers, Duration duration),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (skip != null) {
      return skip(question, answers, duration);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result correct(_Correct value),
    @required Result wrong(_Wrong value),
    @required Result neutral(_Neutral value),
    @required Result skip(_Skipped value),
  }) {
    assert(correct != null);
    assert(wrong != null);
    assert(neutral != null);
    assert(skip != null);
    return skip(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result correct(_Correct value),
    Result wrong(_Wrong value),
    Result neutral(_Neutral value),
    Result skip(_Skipped value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (skip != null) {
      return skip(this);
    }
    return orElse();
  }
}

abstract class _Skipped implements _ValidationState2 {
  const factory _Skipped(
      Question question, List<String> answers, Duration duration) = _$_Skipped;

  @override
  Question get question;
  @override
  List<String> get answers;
  Duration get duration;
  @override
  _$SkippedCopyWith<_Skipped> get copyWith;
}

class _$ValidationStateTearOff {
  const _$ValidationStateTearOff();

  _Just just(_ValidationState2 state) {
    return _Just(
      state,
    );
  }

  _Nothing nothing() {
    return const _Nothing();
  }
}

// ignore: unused_element
const $ValidationState = _$ValidationStateTearOff();

mixin _$ValidationState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result just(_ValidationState2 state),
    @required Result nothing(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result just(_ValidationState2 state),
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

abstract class $ValidationStateCopyWith<$Res> {
  factory $ValidationStateCopyWith(
          ValidationState value, $Res Function(ValidationState) then) =
      _$ValidationStateCopyWithImpl<$Res>;
}

class _$ValidationStateCopyWithImpl<$Res>
    implements $ValidationStateCopyWith<$Res> {
  _$ValidationStateCopyWithImpl(this._value, this._then);

  final ValidationState _value;
  // ignore: unused_field
  final $Res Function(ValidationState) _then;
}

abstract class _$JustCopyWith<$Res> {
  factory _$JustCopyWith(_Just value, $Res Function(_Just) then) =
      __$JustCopyWithImpl<$Res>;
  $Res call({_ValidationState2 state});

  _$ValidationState2CopyWith<$Res> get state;
}

class __$JustCopyWithImpl<$Res> extends _$ValidationStateCopyWithImpl<$Res>
    implements _$JustCopyWith<$Res> {
  __$JustCopyWithImpl(_Just _value, $Res Function(_Just) _then)
      : super(_value, (v) => _then(v as _Just));

  @override
  _Just get _value => super._value as _Just;

  @override
  $Res call({
    Object state = freezed,
  }) {
    return _then(_Just(
      state == freezed ? _value.state : state as _ValidationState2,
    ));
  }

  @override
  _$ValidationState2CopyWith<$Res> get state {
    if (_value.state == null) {
      return null;
    }
    return _$ValidationState2CopyWith<$Res>(_value.state, (value) {
      return _then(_value.copyWith(state: value));
    });
  }
}

class _$_Just with DiagnosticableTreeMixin implements _Just {
  const _$_Just(this.state) : assert(state != null);

  @override
  final _ValidationState2 state;

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
  _$JustCopyWith<_Just> get copyWith =>
      __$JustCopyWithImpl<_Just>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result just(_ValidationState2 state),
    @required Result nothing(),
  }) {
    assert(just != null);
    assert(nothing != null);
    return just(state);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result just(_ValidationState2 state),
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
  const factory _Just(_ValidationState2 state) = _$_Just;

  _ValidationState2 get state;
  _$JustCopyWith<_Just> get copyWith;
}

abstract class _$NothingCopyWith<$Res> {
  factory _$NothingCopyWith(_Nothing value, $Res Function(_Nothing) then) =
      __$NothingCopyWithImpl<$Res>;
}

class __$NothingCopyWithImpl<$Res> extends _$ValidationStateCopyWithImpl<$Res>
    implements _$NothingCopyWith<$Res> {
  __$NothingCopyWithImpl(_Nothing _value, $Res Function(_Nothing) _then)
      : super(_value, (v) => _then(v as _Nothing));

  @override
  _Nothing get _value => super._value as _Nothing;
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
    @required Result just(_ValidationState2 state),
    @required Result nothing(),
  }) {
    assert(just != null);
    assert(nothing != null);
    return nothing();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result just(_ValidationState2 state),
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

// ignore: unused_element
const $TimePoint = _$TimePointTearOff();

mixin _$TimePoint {
  DateTime get time;

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

  $TimePointCopyWith<TimePoint> get copyWith;
}

abstract class $TimePointCopyWith<$Res> {
  factory $TimePointCopyWith(TimePoint value, $Res Function(TimePoint) then) =
      _$TimePointCopyWithImpl<$Res>;
  $Res call({DateTime time});
}

class _$TimePointCopyWithImpl<$Res> implements $TimePointCopyWith<$Res> {
  _$TimePointCopyWithImpl(this._value, this._then);

  final TimePoint _value;
  // ignore: unused_field
  final $Res Function(TimePoint) _then;

  @override
  $Res call({
    Object time = freezed,
  }) {
    return _then(_value.copyWith(
      time: time == freezed ? _value.time : time as DateTime,
    ));
  }
}

abstract class _$ResumeCopyWith<$Res> implements $TimePointCopyWith<$Res> {
  factory _$ResumeCopyWith(_Resume value, $Res Function(_Resume) then) =
      __$ResumeCopyWithImpl<$Res>;
  @override
  $Res call({DateTime time});
}

class __$ResumeCopyWithImpl<$Res> extends _$TimePointCopyWithImpl<$Res>
    implements _$ResumeCopyWith<$Res> {
  __$ResumeCopyWithImpl(_Resume _value, $Res Function(_Resume) _then)
      : super(_value, (v) => _then(v as _Resume));

  @override
  _Resume get _value => super._value as _Resume;

  @override
  $Res call({
    Object time = freezed,
  }) {
    return _then(_Resume(
      time == freezed ? _value.time : time as DateTime,
    ));
  }
}

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
  _$ResumeCopyWith<_Resume> get copyWith =>
      __$ResumeCopyWithImpl<_Resume>(this, _$identity);

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
  _$ResumeCopyWith<_Resume> get copyWith;
}

abstract class _$SuspendCopyWith<$Res> implements $TimePointCopyWith<$Res> {
  factory _$SuspendCopyWith(_Suspend value, $Res Function(_Suspend) then) =
      __$SuspendCopyWithImpl<$Res>;
  @override
  $Res call({DateTime time});
}

class __$SuspendCopyWithImpl<$Res> extends _$TimePointCopyWithImpl<$Res>
    implements _$SuspendCopyWith<$Res> {
  __$SuspendCopyWithImpl(_Suspend _value, $Res Function(_Suspend) _then)
      : super(_value, (v) => _then(v as _Suspend));

  @override
  _Suspend get _value => super._value as _Suspend;

  @override
  $Res call({
    Object time = freezed,
  }) {
    return _then(_Suspend(
      time == freezed ? _value.time : time as DateTime,
    ));
  }
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
  _$SuspendCopyWith<_Suspend> get copyWith =>
      __$SuspendCopyWithImpl<_Suspend>(this, _$identity);

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
  _$SuspendCopyWith<_Suspend> get copyWith;
}

class _$TimePointsTearOff {
  const _$TimePointsTearOff();

  _TimePoints call(List<TimePoint> points) {
    return _TimePoints(
      points,
    );
  }
}

// ignore: unused_element
const $TimePoints = _$TimePointsTearOff();

mixin _$TimePoints {
  List<TimePoint> get points;

  $TimePointsCopyWith<TimePoints> get copyWith;
}

abstract class $TimePointsCopyWith<$Res> {
  factory $TimePointsCopyWith(
          TimePoints value, $Res Function(TimePoints) then) =
      _$TimePointsCopyWithImpl<$Res>;
  $Res call({List<TimePoint> points});
}

class _$TimePointsCopyWithImpl<$Res> implements $TimePointsCopyWith<$Res> {
  _$TimePointsCopyWithImpl(this._value, this._then);

  final TimePoints _value;
  // ignore: unused_field
  final $Res Function(TimePoints) _then;

  @override
  $Res call({
    Object points = freezed,
  }) {
    return _then(_value.copyWith(
      points: points == freezed ? _value.points : points as List<TimePoint>,
    ));
  }
}

abstract class _$TimePointsCopyWith<$Res> implements $TimePointsCopyWith<$Res> {
  factory _$TimePointsCopyWith(
          _TimePoints value, $Res Function(_TimePoints) then) =
      __$TimePointsCopyWithImpl<$Res>;
  @override
  $Res call({List<TimePoint> points});
}

class __$TimePointsCopyWithImpl<$Res> extends _$TimePointsCopyWithImpl<$Res>
    implements _$TimePointsCopyWith<$Res> {
  __$TimePointsCopyWithImpl(
      _TimePoints _value, $Res Function(_TimePoints) _then)
      : super(_value, (v) => _then(v as _TimePoints));

  @override
  _TimePoints get _value => super._value as _TimePoints;

  @override
  $Res call({
    Object points = freezed,
  }) {
    return _then(_TimePoints(
      points == freezed ? _value.points : points as List<TimePoint>,
    ));
  }
}

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
  _$TimePointsCopyWith<_TimePoints> get copyWith =>
      __$TimePointsCopyWithImpl<_TimePoints>(this, _$identity);
}

abstract class _TimePoints implements TimePoints {
  const factory _TimePoints(List<TimePoint> points) = _$_TimePoints;

  @override
  List<TimePoint> get points;
  @override
  _$TimePointsCopyWith<_TimePoints> get copyWith;
}
