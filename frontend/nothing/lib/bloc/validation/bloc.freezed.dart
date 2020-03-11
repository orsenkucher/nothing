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

mixin _$ValidationState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result correct(
            Question question, List<String> tries, Duration duration),
    @required
        Result wrong(
            Question question, List<String> tries, List<DateTime> timePoints),
    @required
        Result neutral(
            Question question, List<String> tries, List<DateTime> timePoints),
    @required Result nothing(),
  });

  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result correct(Question question, List<String> tries, Duration duration),
    Result wrong(
        Question question, List<String> tries, List<DateTime> timePoints),
    Result neutral(
        Question question, List<String> tries, List<DateTime> timePoints),
    Result nothing(),
    @required Result orElse(),
  });

  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result correct(_Correct value),
    @required Result wrong(_Wrong value),
    @required Result neutral(_Neutral value),
    @required Result nothing(_Nothing value),
  });

  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result correct(_Correct value),
    Result wrong(_Wrong value),
    Result neutral(_Neutral value),
    Result nothing(_Nothing value),
    @required Result orElse(),
  });
}

class _$ValidationStateTearOff {
  const _$ValidationStateTearOff();

  _Correct correct(Question question, List<String> tries, Duration duration) {
    return _Correct(
      question,
      tries,
      duration,
    );
  }

  _Wrong wrong(
      Question question, List<String> tries, List<DateTime> timePoints) {
    return _Wrong(
      question,
      tries,
      timePoints,
    );
  }

  _Neutral neutral(
      Question question, List<String> tries, List<DateTime> timePoints) {
    return _Neutral(
      question,
      tries,
      timePoints,
    );
  }

  _Nothing nothing() {
    return const _Nothing();
  }
}

const $ValidationState = _$ValidationStateTearOff();

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
    return 'ValidationState.correct(question: $question, tries: $tries, duration: $duration)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ValidationState.correct'))
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
            Question question, List<String> tries, List<DateTime> timePoints),
    @required
        Result neutral(
            Question question, List<String> tries, List<DateTime> timePoints),
    @required Result nothing(),
  }) {
    assert(correct != null);
    assert(wrong != null);
    assert(neutral != null);
    assert(nothing != null);
    return correct(question, tries, duration);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result correct(Question question, List<String> tries, Duration duration),
    Result wrong(
        Question question, List<String> tries, List<DateTime> timePoints),
    Result neutral(
        Question question, List<String> tries, List<DateTime> timePoints),
    Result nothing(),
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
    @required Result nothing(_Nothing value),
  }) {
    assert(correct != null);
    assert(wrong != null);
    assert(neutral != null);
    assert(nothing != null);
    return correct(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result correct(_Correct value),
    Result wrong(_Wrong value),
    Result neutral(_Neutral value),
    Result nothing(_Nothing value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (correct != null) {
      return correct(this);
    }
    return orElse();
  }
}

abstract class _Correct implements ValidationState {
  const factory _Correct(
      Question question, List<String> tries, Duration duration) = _$_Correct;

  Question get question;
  List<String> get tries;
  Duration get duration;

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
  final List<DateTime> timePoints;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ValidationState.wrong(question: $question, tries: $tries, timePoints: $timePoints)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ValidationState.wrong'))
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
      timePoints == freezed ? this.timePoints : timePoints as List<DateTime>,
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
            Question question, List<String> tries, List<DateTime> timePoints),
    @required
        Result neutral(
            Question question, List<String> tries, List<DateTime> timePoints),
    @required Result nothing(),
  }) {
    assert(correct != null);
    assert(wrong != null);
    assert(neutral != null);
    assert(nothing != null);
    return wrong(question, tries, timePoints);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result correct(Question question, List<String> tries, Duration duration),
    Result wrong(
        Question question, List<String> tries, List<DateTime> timePoints),
    Result neutral(
        Question question, List<String> tries, List<DateTime> timePoints),
    Result nothing(),
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
    @required Result nothing(_Nothing value),
  }) {
    assert(correct != null);
    assert(wrong != null);
    assert(neutral != null);
    assert(nothing != null);
    return wrong(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result correct(_Correct value),
    Result wrong(_Wrong value),
    Result neutral(_Neutral value),
    Result nothing(_Nothing value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (wrong != null) {
      return wrong(this);
    }
    return orElse();
  }
}

abstract class _Wrong implements ValidationState {
  const factory _Wrong(
          Question question, List<String> tries, List<DateTime> timePoints) =
      _$_Wrong;

  Question get question;
  List<String> get tries;
  List<DateTime> get timePoints;

  _Wrong copyWith(
      {Question question, List<String> tries, List<DateTime> timePoints});
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
  final List<DateTime> timePoints;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ValidationState.neutral(question: $question, tries: $tries, timePoints: $timePoints)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ValidationState.neutral'))
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
      timePoints == freezed ? this.timePoints : timePoints as List<DateTime>,
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
            Question question, List<String> tries, List<DateTime> timePoints),
    @required
        Result neutral(
            Question question, List<String> tries, List<DateTime> timePoints),
    @required Result nothing(),
  }) {
    assert(correct != null);
    assert(wrong != null);
    assert(neutral != null);
    assert(nothing != null);
    return neutral(question, tries, timePoints);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result correct(Question question, List<String> tries, Duration duration),
    Result wrong(
        Question question, List<String> tries, List<DateTime> timePoints),
    Result neutral(
        Question question, List<String> tries, List<DateTime> timePoints),
    Result nothing(),
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
    @required Result nothing(_Nothing value),
  }) {
    assert(correct != null);
    assert(wrong != null);
    assert(neutral != null);
    assert(nothing != null);
    return neutral(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result correct(_Correct value),
    Result wrong(_Wrong value),
    Result neutral(_Neutral value),
    Result nothing(_Nothing value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (neutral != null) {
      return neutral(this);
    }
    return orElse();
  }
}

abstract class _Neutral implements ValidationState {
  const factory _Neutral(
          Question question, List<String> tries, List<DateTime> timePoints) =
      _$_Neutral;

  Question get question;
  List<String> get tries;
  List<DateTime> get timePoints;

  _Neutral copyWith(
      {Question question, List<String> tries, List<DateTime> timePoints});
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
    @required
        Result correct(
            Question question, List<String> tries, Duration duration),
    @required
        Result wrong(
            Question question, List<String> tries, List<DateTime> timePoints),
    @required
        Result neutral(
            Question question, List<String> tries, List<DateTime> timePoints),
    @required Result nothing(),
  }) {
    assert(correct != null);
    assert(wrong != null);
    assert(neutral != null);
    assert(nothing != null);
    return nothing();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result correct(Question question, List<String> tries, Duration duration),
    Result wrong(
        Question question, List<String> tries, List<DateTime> timePoints),
    Result neutral(
        Question question, List<String> tries, List<DateTime> timePoints),
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
    @required Result correct(_Correct value),
    @required Result wrong(_Wrong value),
    @required Result neutral(_Neutral value),
    @required Result nothing(_Nothing value),
  }) {
    assert(correct != null);
    assert(wrong != null);
    assert(neutral != null);
    assert(nothing != null);
    return nothing(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result correct(_Correct value),
    Result wrong(_Wrong value),
    Result neutral(_Neutral value),
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
