// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters

part of 'bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$ValidationEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result check(String answer),
    @required Result purge(),
  });

  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result check(String answer),
    Result purge(),
    @required Result orElse(),
  });

  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result check(_Check value),
    @required Result purge(_Purge value),
  });

  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result check(_Check value),
    Result purge(_Purge value),
    @required Result orElse(),
  });
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
    @required Result check(String answer),
    @required Result purge(),
  }) {
    assert(check != null);
    assert(purge != null);
    return check(answer);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
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
    @required Result check(_Check value),
    @required Result purge(_Purge value),
  }) {
    assert(check != null);
    assert(purge != null);
    return check(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
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
    @required Result check(String answer),
    @required Result purge(),
  }) {
    assert(check != null);
    assert(purge != null);
    return purge();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
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
    @required Result check(_Check value),
    @required Result purge(_Purge value),
  }) {
    assert(check != null);
    assert(purge != null);
    return purge(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
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
  int get qid;
  int get tries;

  ValidationState copyWith({int qid, int tries});

  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result correct(int qid, int tries, Duration duration),
    @required Result neutral(int qid, int tries, DateTime time),
    @required Result wrong(int qid, int tries, DateTime time),
  });

  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result correct(int qid, int tries, Duration duration),
    Result neutral(int qid, int tries, DateTime time),
    Result wrong(int qid, int tries, DateTime time),
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

class _$_Correct with DiagnosticableTreeMixin implements _Correct {
  const _$_Correct(this.qid, this.tries, this.duration)
      : assert(qid != null),
        assert(tries != null),
        assert(duration != null);

  @override
  final int qid;
  @override
  final int tries;
  @override
  final Duration duration;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ValidationState.correct(qid: $qid, tries: $tries, duration: $duration)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ValidationState.correct'))
      ..add(DiagnosticsProperty('qid', qid))
      ..add(DiagnosticsProperty('tries', tries))
      ..add(DiagnosticsProperty('duration', duration));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Correct &&
            (identical(other.qid, qid) ||
                const DeepCollectionEquality().equals(other.qid, qid)) &&
            (identical(other.tries, tries) ||
                const DeepCollectionEquality().equals(other.tries, tries)) &&
            (identical(other.duration, duration) ||
                const DeepCollectionEquality()
                    .equals(other.duration, duration)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(qid) ^
      const DeepCollectionEquality().hash(tries) ^
      const DeepCollectionEquality().hash(duration);

  @override
  _$_Correct copyWith({
    Object qid = freezed,
    Object tries = freezed,
    Object duration = freezed,
  }) {
    return _$_Correct(
      qid == freezed ? this.qid : qid as int,
      tries == freezed ? this.tries : tries as int,
      duration == freezed ? this.duration : duration as Duration,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result correct(int qid, int tries, Duration duration),
    @required Result neutral(int qid, int tries, DateTime time),
    @required Result wrong(int qid, int tries, DateTime time),
  }) {
    assert(correct != null);
    assert(neutral != null);
    assert(wrong != null);
    return correct(qid, tries, duration);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result correct(int qid, int tries, Duration duration),
    Result neutral(int qid, int tries, DateTime time),
    Result wrong(int qid, int tries, DateTime time),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (correct != null) {
      return correct(qid, tries, duration);
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
  const factory _Correct(int qid, int tries, Duration duration) = _$_Correct;

  @override
  int get qid;
  @override
  int get tries;
  Duration get duration;

  @override
  _Correct copyWith({int qid, int tries, Duration duration});
}

class _$_Neutral with DiagnosticableTreeMixin implements _Neutral {
  const _$_Neutral(this.qid, this.tries, this.time)
      : assert(qid != null),
        assert(tries != null),
        assert(time != null);

  @override
  final int qid;
  @override
  final int tries;
  @override
  final DateTime time;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ValidationState.neutral(qid: $qid, tries: $tries, time: $time)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ValidationState.neutral'))
      ..add(DiagnosticsProperty('qid', qid))
      ..add(DiagnosticsProperty('tries', tries))
      ..add(DiagnosticsProperty('time', time));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Neutral &&
            (identical(other.qid, qid) ||
                const DeepCollectionEquality().equals(other.qid, qid)) &&
            (identical(other.tries, tries) ||
                const DeepCollectionEquality().equals(other.tries, tries)) &&
            (identical(other.time, time) ||
                const DeepCollectionEquality().equals(other.time, time)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(qid) ^
      const DeepCollectionEquality().hash(tries) ^
      const DeepCollectionEquality().hash(time);

  @override
  _$_Neutral copyWith({
    Object qid = freezed,
    Object tries = freezed,
    Object time = freezed,
  }) {
    return _$_Neutral(
      qid == freezed ? this.qid : qid as int,
      tries == freezed ? this.tries : tries as int,
      time == freezed ? this.time : time as DateTime,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result correct(int qid, int tries, Duration duration),
    @required Result neutral(int qid, int tries, DateTime time),
    @required Result wrong(int qid, int tries, DateTime time),
  }) {
    assert(correct != null);
    assert(neutral != null);
    assert(wrong != null);
    return neutral(qid, tries, time);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result correct(int qid, int tries, Duration duration),
    Result neutral(int qid, int tries, DateTime time),
    Result wrong(int qid, int tries, DateTime time),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (neutral != null) {
      return neutral(qid, tries, time);
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
  const factory _Neutral(int qid, int tries, DateTime time) = _$_Neutral;

  @override
  int get qid;
  @override
  int get tries;
  DateTime get time;

  @override
  _Neutral copyWith({int qid, int tries, DateTime time});
}

class _$_Wrong with DiagnosticableTreeMixin implements _Wrong {
  const _$_Wrong(this.qid, this.tries, this.time)
      : assert(qid != null),
        assert(tries != null),
        assert(time != null);

  @override
  final int qid;
  @override
  final int tries;
  @override
  final DateTime time;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ValidationState.wrong(qid: $qid, tries: $tries, time: $time)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ValidationState.wrong'))
      ..add(DiagnosticsProperty('qid', qid))
      ..add(DiagnosticsProperty('tries', tries))
      ..add(DiagnosticsProperty('time', time));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Wrong &&
            (identical(other.qid, qid) ||
                const DeepCollectionEquality().equals(other.qid, qid)) &&
            (identical(other.tries, tries) ||
                const DeepCollectionEquality().equals(other.tries, tries)) &&
            (identical(other.time, time) ||
                const DeepCollectionEquality().equals(other.time, time)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(qid) ^
      const DeepCollectionEquality().hash(tries) ^
      const DeepCollectionEquality().hash(time);

  @override
  _$_Wrong copyWith({
    Object qid = freezed,
    Object tries = freezed,
    Object time = freezed,
  }) {
    return _$_Wrong(
      qid == freezed ? this.qid : qid as int,
      tries == freezed ? this.tries : tries as int,
      time == freezed ? this.time : time as DateTime,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result correct(int qid, int tries, Duration duration),
    @required Result neutral(int qid, int tries, DateTime time),
    @required Result wrong(int qid, int tries, DateTime time),
  }) {
    assert(correct != null);
    assert(neutral != null);
    assert(wrong != null);
    return wrong(qid, tries, time);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result correct(int qid, int tries, Duration duration),
    Result neutral(int qid, int tries, DateTime time),
    Result wrong(int qid, int tries, DateTime time),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (wrong != null) {
      return wrong(qid, tries, time);
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
  const factory _Wrong(int qid, int tries, DateTime time) = _$_Wrong;

  @override
  int get qid;
  @override
  int get tries;
  DateTime get time;

  @override
  _Wrong copyWith({int qid, int tries, DateTime time});
}
