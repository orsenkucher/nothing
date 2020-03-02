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
    @required Result purge(),
  });

  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result focus(Question question),
    Result check(String answer),
    Result purge(),
    @required Result orElse(),
  });

  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result focus(_Focus value),
    @required Result check(_Check value),
    @required Result purge(_Purge value),
  });

  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result focus(_Focus value),
    Result check(_Check value),
    Result purge(_Purge value),
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

  _Purge purge() {
    return const _Purge();
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
    @required Result purge(),
  }) {
    assert(focus != null);
    assert(check != null);
    assert(purge != null);
    return focus(question);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result focus(Question question),
    Result check(String answer),
    Result purge(),
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
    @required Result purge(_Purge value),
  }) {
    assert(focus != null);
    assert(check != null);
    assert(purge != null);
    return focus(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result focus(_Focus value),
    Result check(_Check value),
    Result purge(_Purge value),
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
    @required Result purge(),
  }) {
    assert(focus != null);
    assert(check != null);
    assert(purge != null);
    return check(answer);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result focus(Question question),
    Result check(String answer),
    Result purge(),
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
    @required Result purge(_Purge value),
  }) {
    assert(focus != null);
    assert(check != null);
    assert(purge != null);
    return check(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result focus(_Focus value),
    Result check(_Check value),
    Result purge(_Purge value),
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

class _$_Purge with DiagnosticableTreeMixin implements _Purge {
  const _$_Purge();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ValidationEvent.purge()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'ValidationEvent.purge'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Purge);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result focus(Question question),
    @required Result check(String answer),
    @required Result purge(),
  }) {
    assert(focus != null);
    assert(check != null);
    assert(purge != null);
    return purge();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result focus(Question question),
    Result check(String answer),
    Result purge(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (purge != null) {
      return purge();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result focus(_Focus value),
    @required Result check(_Check value),
    @required Result purge(_Purge value),
  }) {
    assert(focus != null);
    assert(check != null);
    assert(purge != null);
    return purge(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result focus(_Focus value),
    Result check(_Check value),
    Result purge(_Purge value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (purge != null) {
      return purge(this);
    }
    return orElse();
  }
}

abstract class _Purge implements ValidationEvent {
  const factory _Purge() = _$_Purge;
}

mixin _$ValidationState {
  Question get question;
  int get tries;

  ValidationState copyWith({Question question, int tries});

  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result correct(Question question, int tries, Duration duration),
    @required
        Result neutral(
            @nullable Question question, int tries, DateTime time, bool green),
    @required Result wrong(Question question, int tries, DateTime time),
  });

  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result correct(Question question, int tries, Duration duration),
    Result neutral(
        @nullable Question question, int tries, DateTime time, bool green),
    Result wrong(Question question, int tries, DateTime time),
    @required Result orElse(),
  });

  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result correct(_Correct value),
    @required Result neutral(_Neutral value),
    @required Result wrong(_Wrong value),
  });

  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result correct(_Correct value),
    Result neutral(_Neutral value),
    Result wrong(_Wrong value),
    @required Result orElse(),
  });
}

class _$ValidationStateTearOff {
  const _$ValidationStateTearOff();

  _Correct correct(Question question, int tries, Duration duration) {
    return _Correct(
      question,
      tries,
      duration,
    );
  }

  _Neutral neutral(@nullable Question question, int tries, DateTime time,
      [bool green = false]) {
    return _Neutral(
      question,
      tries,
      time,
      green,
    );
  }

  _Wrong wrong(Question question, int tries, DateTime time) {
    return _Wrong(
      question,
      tries,
      time,
    );
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
  final int tries;
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
      tries == freezed ? this.tries : tries as int,
      duration == freezed ? this.duration : duration as Duration,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result correct(Question question, int tries, Duration duration),
    @required
        Result neutral(
            @nullable Question question, int tries, DateTime time, bool green),
    @required Result wrong(Question question, int tries, DateTime time),
  }) {
    assert(correct != null);
    assert(neutral != null);
    assert(wrong != null);
    return correct(question, tries, duration);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result correct(Question question, int tries, Duration duration),
    Result neutral(
        @nullable Question question, int tries, DateTime time, bool green),
    Result wrong(Question question, int tries, DateTime time),
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
    @required Result neutral(_Neutral value),
    @required Result wrong(_Wrong value),
  }) {
    assert(correct != null);
    assert(neutral != null);
    assert(wrong != null);
    return correct(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result correct(_Correct value),
    Result neutral(_Neutral value),
    Result wrong(_Wrong value),
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
  const factory _Correct(Question question, int tries, Duration duration) =
      _$_Correct;

  @override
  Question get question;
  @override
  int get tries;
  Duration get duration;

  @override
  _Correct copyWith({Question question, int tries, Duration duration});
}

class _$_Neutral with DiagnosticableTreeMixin implements _Neutral {
  const _$_Neutral(@nullable this.question, this.tries, this.time,
      [this.green = false])
      : assert(tries != null),
        assert(time != null);

  @override
  @nullable
  final Question question;
  @override
  final int tries;
  @override
  final DateTime time;
  @JsonKey(defaultValue: false)
  @override
  final bool green;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ValidationState.neutral(question: $question, tries: $tries, time: $time, green: $green)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ValidationState.neutral'))
      ..add(DiagnosticsProperty('question', question))
      ..add(DiagnosticsProperty('tries', tries))
      ..add(DiagnosticsProperty('time', time))
      ..add(DiagnosticsProperty('green', green));
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
            (identical(other.time, time) ||
                const DeepCollectionEquality().equals(other.time, time)) &&
            (identical(other.green, green) ||
                const DeepCollectionEquality().equals(other.green, green)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(question) ^
      const DeepCollectionEquality().hash(tries) ^
      const DeepCollectionEquality().hash(time) ^
      const DeepCollectionEquality().hash(green);

  @override
  _$_Neutral copyWith({
    Object question = freezed,
    Object tries = freezed,
    Object time = freezed,
    Object green = freezed,
  }) {
    return _$_Neutral(
      question == freezed ? this.question : question as Question,
      tries == freezed ? this.tries : tries as int,
      time == freezed ? this.time : time as DateTime,
      green == freezed ? this.green : green as bool,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result correct(Question question, int tries, Duration duration),
    @required
        Result neutral(
            @nullable Question question, int tries, DateTime time, bool green),
    @required Result wrong(Question question, int tries, DateTime time),
  }) {
    assert(correct != null);
    assert(neutral != null);
    assert(wrong != null);
    return neutral(question, tries, time, green);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result correct(Question question, int tries, Duration duration),
    Result neutral(
        @nullable Question question, int tries, DateTime time, bool green),
    Result wrong(Question question, int tries, DateTime time),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (neutral != null) {
      return neutral(question, tries, time, green);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result correct(_Correct value),
    @required Result neutral(_Neutral value),
    @required Result wrong(_Wrong value),
  }) {
    assert(correct != null);
    assert(neutral != null);
    assert(wrong != null);
    return neutral(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result correct(_Correct value),
    Result neutral(_Neutral value),
    Result wrong(_Wrong value),
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
  const factory _Neutral(@nullable Question question, int tries, DateTime time,
      [bool green]) = _$_Neutral;

  @override
  @nullable
  Question get question;
  @override
  int get tries;
  DateTime get time;
  bool get green;

  @override
  _Neutral copyWith(
      {@nullable Question question, int tries, DateTime time, bool green});
}

class _$_Wrong with DiagnosticableTreeMixin implements _Wrong {
  const _$_Wrong(this.question, this.tries, this.time)
      : assert(question != null),
        assert(tries != null),
        assert(time != null);

  @override
  final Question question;
  @override
  final int tries;
  @override
  final DateTime time;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ValidationState.wrong(question: $question, tries: $tries, time: $time)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ValidationState.wrong'))
      ..add(DiagnosticsProperty('question', question))
      ..add(DiagnosticsProperty('tries', tries))
      ..add(DiagnosticsProperty('time', time));
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
            (identical(other.time, time) ||
                const DeepCollectionEquality().equals(other.time, time)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(question) ^
      const DeepCollectionEquality().hash(tries) ^
      const DeepCollectionEquality().hash(time);

  @override
  _$_Wrong copyWith({
    Object question = freezed,
    Object tries = freezed,
    Object time = freezed,
  }) {
    return _$_Wrong(
      question == freezed ? this.question : question as Question,
      tries == freezed ? this.tries : tries as int,
      time == freezed ? this.time : time as DateTime,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result correct(Question question, int tries, Duration duration),
    @required
        Result neutral(
            @nullable Question question, int tries, DateTime time, bool green),
    @required Result wrong(Question question, int tries, DateTime time),
  }) {
    assert(correct != null);
    assert(neutral != null);
    assert(wrong != null);
    return wrong(question, tries, time);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result correct(Question question, int tries, Duration duration),
    Result neutral(
        @nullable Question question, int tries, DateTime time, bool green),
    Result wrong(Question question, int tries, DateTime time),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (wrong != null) {
      return wrong(question, tries, time);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result correct(_Correct value),
    @required Result neutral(_Neutral value),
    @required Result wrong(_Wrong value),
  }) {
    assert(correct != null);
    assert(neutral != null);
    assert(wrong != null);
    return wrong(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result correct(_Correct value),
    Result neutral(_Neutral value),
    Result wrong(_Wrong value),
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
  const factory _Wrong(Question question, int tries, DateTime time) = _$_Wrong;

  @override
  Question get question;
  @override
  int get tries;
  DateTime get time;

  @override
  _Wrong copyWith({Question question, int tries, DateTime time});
}
