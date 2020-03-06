// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$LifecycleEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result change(@required String screen),
    @required Result resume(),
  });

  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result change(@required String screen),
    Result resume(),
    @required Result orElse(),
  });

  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result change(_Change value),
    @required Result resume(_Resume value),
  });

  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result change(_Change value),
    Result resume(_Resume value),
    @required Result orElse(),
  });
}

class _$LifecycleEventTearOff {
  const _$LifecycleEventTearOff();

  _Change change({@required String screen}) {
    return _Change(
      screen: screen,
    );
  }

  _Resume resume() {
    return const _Resume();
  }
}

const $LifecycleEvent = _$LifecycleEventTearOff();

class _$_Change with DiagnosticableTreeMixin implements _Change {
  const _$_Change({@required this.screen}) : assert(screen != null);

  @override
  final String screen;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LifecycleEvent.change(screen: $screen)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LifecycleEvent.change'))
      ..add(DiagnosticsProperty('screen', screen));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Change &&
            (identical(other.screen, screen) ||
                const DeepCollectionEquality().equals(other.screen, screen)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(screen);

  @override
  _$_Change copyWith({
    Object screen = freezed,
  }) {
    return _$_Change(
      screen: screen == freezed ? this.screen : screen as String,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result change(@required String screen),
    @required Result resume(),
  }) {
    assert(change != null);
    assert(resume != null);
    return change(screen);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result change(@required String screen),
    Result resume(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (change != null) {
      return change(screen);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result change(_Change value),
    @required Result resume(_Resume value),
  }) {
    assert(change != null);
    assert(resume != null);
    return change(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result change(_Change value),
    Result resume(_Resume value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (change != null) {
      return change(this);
    }
    return orElse();
  }
}

abstract class _Change implements LifecycleEvent {
  const factory _Change({@required String screen}) = _$_Change;

  String get screen;

  _Change copyWith({String screen});
}

class _$_Resume with DiagnosticableTreeMixin implements _Resume {
  const _$_Resume();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LifecycleEvent.resume()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'LifecycleEvent.resume'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Resume);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result change(@required String screen),
    @required Result resume(),
  }) {
    assert(change != null);
    assert(resume != null);
    return resume();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result change(@required String screen),
    Result resume(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (resume != null) {
      return resume();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result change(_Change value),
    @required Result resume(_Resume value),
  }) {
    assert(change != null);
    assert(resume != null);
    return resume(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result change(_Change value),
    Result resume(_Resume value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (resume != null) {
      return resume(this);
    }
    return orElse();
  }
}

abstract class _Resume implements LifecycleEvent {
  const factory _Resume() = _$_Resume;
}

mixin _$LifecycleState {
  String get screen;
  String get salt;

  LifecycleState copyWith({String screen, String salt});
}

class _$LifecycleStateTearOff {
  const _$LifecycleStateTearOff();

  _LifecycleState _({@required String screen, @required String salt}) {
    return _LifecycleState(
      screen: screen,
      salt: salt,
    );
  }
}

const $LifecycleState = _$LifecycleStateTearOff();

class _$_LifecycleState
    with DiagnosticableTreeMixin
    implements _LifecycleState {
  const _$_LifecycleState({@required this.screen, @required this.salt})
      : assert(screen != null),
        assert(salt != null);

  @override
  final String screen;
  @override
  final String salt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LifecycleState._(screen: $screen, salt: $salt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LifecycleState._'))
      ..add(DiagnosticsProperty('screen', screen))
      ..add(DiagnosticsProperty('salt', salt));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LifecycleState &&
            (identical(other.screen, screen) ||
                const DeepCollectionEquality().equals(other.screen, screen)) &&
            (identical(other.salt, salt) ||
                const DeepCollectionEquality().equals(other.salt, salt)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(screen) ^
      const DeepCollectionEquality().hash(salt);

  @override
  _$_LifecycleState copyWith({
    Object screen = freezed,
    Object salt = freezed,
  }) {
    return _$_LifecycleState(
      screen: screen == freezed ? this.screen : screen as String,
      salt: salt == freezed ? this.salt : salt as String,
    );
  }
}

abstract class _LifecycleState implements LifecycleState {
  const factory _LifecycleState(
      {@required String screen, @required String salt}) = _$_LifecycleState;

  @override
  String get screen;
  @override
  String get salt;

  @override
  _LifecycleState copyWith({String screen, String salt});
}
