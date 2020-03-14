// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

LifecycleEvent _$LifecycleEventFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType'] as String) {
    case 'resume':
      return _Resume.fromJson(json);
    case 'suspend':
      return _Suspend.fromJson(json);

    default:
      throw FallThroughError();
  }
}

mixin _$LifecycleEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result resume(),
    @required Result suspend(),
  });

  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result resume(),
    Result suspend(),
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

  Map<String, dynamic> toJson();
}

class _$LifecycleEventTearOff {
  const _$LifecycleEventTearOff();

  _Resume resume() {
    return const _Resume();
  }

  _Suspend suspend() {
    return const _Suspend();
  }
}

const $LifecycleEvent = _$LifecycleEventTearOff();

@JsonSerializable()
class _$_Resume with DiagnosticableTreeMixin implements _Resume {
  const _$_Resume();

  factory _$_Resume.fromJson(Map<String, dynamic> json) =>
      _$_$_ResumeFromJson(json);

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
    @required Result resume(),
    @required Result suspend(),
  }) {
    assert(resume != null);
    assert(suspend != null);
    return resume();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result resume(),
    Result suspend(),
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

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ResumeToJson(this)..['runtimeType'] = 'resume';
  }
}

abstract class _Resume implements LifecycleEvent {
  const factory _Resume() = _$_Resume;

  factory _Resume.fromJson(Map<String, dynamic> json) = _$_Resume.fromJson;
}

@JsonSerializable()
class _$_Suspend with DiagnosticableTreeMixin implements _Suspend {
  const _$_Suspend();

  factory _$_Suspend.fromJson(Map<String, dynamic> json) =>
      _$_$_SuspendFromJson(json);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LifecycleEvent.suspend()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'LifecycleEvent.suspend'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Suspend);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result resume(),
    @required Result suspend(),
  }) {
    assert(resume != null);
    assert(suspend != null);
    return suspend();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result resume(),
    Result suspend(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (suspend != null) {
      return suspend();
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

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SuspendToJson(this)..['runtimeType'] = 'suspend';
  }
}

abstract class _Suspend implements LifecycleEvent {
  const factory _Suspend() = _$_Suspend;

  factory _Suspend.fromJson(Map<String, dynamic> json) = _$_Suspend.fromJson;
}

LifecycleState _$LifecycleStateFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType'] as String) {
    case 'just':
      return _Just.fromJson(json);
    case 'nothing':
      return _Nothing.fromJson(json);

    default:
      throw FallThroughError();
  }
}

mixin _$LifecycleState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result just(@required List<LifecycleEvent> log,
            @required LifecycleEvent current),
    @required Result nothing(),
  });

  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result just(
        @required List<LifecycleEvent> log, @required LifecycleEvent current),
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

  Map<String, dynamic> toJson();
}

class _$LifecycleStateTearOff {
  const _$LifecycleStateTearOff();

  _Just just(
      {@required List<LifecycleEvent> log, @required LifecycleEvent current}) {
    return _Just(
      log: log,
      current: current,
    );
  }

  _Nothing nothing() {
    return const _Nothing();
  }
}

const $LifecycleState = _$LifecycleStateTearOff();

@JsonSerializable()
class _$_Just with DiagnosticableTreeMixin implements _Just {
  const _$_Just({@required this.log, @required this.current})
      : assert(log != null),
        assert(current != null);

  factory _$_Just.fromJson(Map<String, dynamic> json) =>
      _$_$_JustFromJson(json);

  @override
  final List<LifecycleEvent> log;
  @override
  final LifecycleEvent current;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LifecycleState.just(log: $log, current: $current)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LifecycleState.just'))
      ..add(DiagnosticsProperty('log', log))
      ..add(DiagnosticsProperty('current', current));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Just &&
            (identical(other.log, log) ||
                const DeepCollectionEquality().equals(other.log, log)) &&
            (identical(other.current, current) ||
                const DeepCollectionEquality().equals(other.current, current)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(log) ^
      const DeepCollectionEquality().hash(current);

  @override
  _$_Just copyWith({
    Object log = freezed,
    Object current = freezed,
  }) {
    return _$_Just(
      log: log == freezed ? this.log : log as List<LifecycleEvent>,
      current: current == freezed ? this.current : current as LifecycleEvent,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result just(@required List<LifecycleEvent> log,
            @required LifecycleEvent current),
    @required Result nothing(),
  }) {
    assert(just != null);
    assert(nothing != null);
    return just(log, current);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result just(
        @required List<LifecycleEvent> log, @required LifecycleEvent current),
    Result nothing(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (just != null) {
      return just(log, current);
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

  @override
  Map<String, dynamic> toJson() {
    return _$_$_JustToJson(this)..['runtimeType'] = 'just';
  }
}

abstract class _Just implements LifecycleState {
  const factory _Just(
      {@required List<LifecycleEvent> log,
      @required LifecycleEvent current}) = _$_Just;

  factory _Just.fromJson(Map<String, dynamic> json) = _$_Just.fromJson;

  List<LifecycleEvent> get log;
  LifecycleEvent get current;

  _Just copyWith({List<LifecycleEvent> log, LifecycleEvent current});
}

@JsonSerializable()
class _$_Nothing with DiagnosticableTreeMixin implements _Nothing {
  const _$_Nothing();

  factory _$_Nothing.fromJson(Map<String, dynamic> json) =>
      _$_$_NothingFromJson(json);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LifecycleState.nothing()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'LifecycleState.nothing'));
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
        Result just(@required List<LifecycleEvent> log,
            @required LifecycleEvent current),
    @required Result nothing(),
  }) {
    assert(just != null);
    assert(nothing != null);
    return nothing();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result just(
        @required List<LifecycleEvent> log, @required LifecycleEvent current),
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

  @override
  Map<String, dynamic> toJson() {
    return _$_$_NothingToJson(this)..['runtimeType'] = 'nothing';
  }
}

abstract class _Nothing implements LifecycleState {
  const factory _Nothing() = _$_Nothing;

  factory _Nothing.fromJson(Map<String, dynamic> json) = _$_Nothing.fromJson;
}
