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
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result correct(),
    @required Result neutral(),
    @required Result wrong(),
  });

  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result correct(),
    Result neutral(),
    Result wrong(),
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
  const _$_Correct();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ValidationState.correct()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'ValidationState.correct'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Correct);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result correct(),
    @required Result neutral(),
    @required Result wrong(),
  }) {
    assert(correct != null);
    assert(neutral != null);
    assert(wrong != null);
    return correct();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result correct(),
    Result neutral(),
    Result wrong(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (correct != null) {
      return correct();
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
  const factory _Correct() = _$_Correct;
}

class _$_Neutral with DiagnosticableTreeMixin implements _Neutral {
  const _$_Neutral();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ValidationState.neutral()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'ValidationState.neutral'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Neutral);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result correct(),
    @required Result neutral(),
    @required Result wrong(),
  }) {
    assert(correct != null);
    assert(neutral != null);
    assert(wrong != null);
    return neutral();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result correct(),
    Result neutral(),
    Result wrong(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (neutral != null) {
      return neutral();
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
  const factory _Neutral() = _$_Neutral;
}

class _$_Wrong with DiagnosticableTreeMixin implements _Wrong {
  const _$_Wrong();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ValidationState.wrong()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'ValidationState.wrong'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Wrong);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result correct(),
    @required Result neutral(),
    @required Result wrong(),
  }) {
    assert(correct != null);
    assert(neutral != null);
    assert(wrong != null);
    return wrong();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result correct(),
    Result neutral(),
    Result wrong(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (wrong != null) {
      return wrong();
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
  const factory _Wrong() = _$_Wrong;
}
