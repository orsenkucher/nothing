// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
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

/// @nodoc
class _$LifecycleEventTearOff {
  const _$LifecycleEventTearOff();

// ignore: unused_element
  _Resume resume(DateTime point) {
    return _Resume(
      point,
    );
  }

// ignore: unused_element
  _Suspend suspend(DateTime point) {
    return _Suspend(
      point,
    );
  }

// ignore: unused_element
  LifecycleEvent fromJson(Map<String, Object> json) {
    return LifecycleEvent.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $LifecycleEvent = _$LifecycleEventTearOff();

/// @nodoc
mixin _$LifecycleEvent {
  DateTime get point;

  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult resume(DateTime point),
    @required TResult suspend(DateTime point),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult resume(DateTime point),
    TResult suspend(DateTime point),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult resume(_Resume value),
    @required TResult suspend(_Suspend value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult resume(_Resume value),
    TResult suspend(_Suspend value),
    @required TResult orElse(),
  });
  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $LifecycleEventCopyWith<LifecycleEvent> get copyWith;
}

/// @nodoc
abstract class $LifecycleEventCopyWith<$Res> {
  factory $LifecycleEventCopyWith(
          LifecycleEvent value, $Res Function(LifecycleEvent) then) =
      _$LifecycleEventCopyWithImpl<$Res>;
  $Res call({DateTime point});
}

/// @nodoc
class _$LifecycleEventCopyWithImpl<$Res>
    implements $LifecycleEventCopyWith<$Res> {
  _$LifecycleEventCopyWithImpl(this._value, this._then);

  final LifecycleEvent _value;
  // ignore: unused_field
  final $Res Function(LifecycleEvent) _then;

  @override
  $Res call({
    Object point = freezed,
  }) {
    return _then(_value.copyWith(
      point: point == freezed ? _value.point : point as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$ResumeCopyWith<$Res> implements $LifecycleEventCopyWith<$Res> {
  factory _$ResumeCopyWith(_Resume value, $Res Function(_Resume) then) =
      __$ResumeCopyWithImpl<$Res>;
  @override
  $Res call({DateTime point});
}

/// @nodoc
class __$ResumeCopyWithImpl<$Res> extends _$LifecycleEventCopyWithImpl<$Res>
    implements _$ResumeCopyWith<$Res> {
  __$ResumeCopyWithImpl(_Resume _value, $Res Function(_Resume) _then)
      : super(_value, (v) => _then(v as _Resume));

  @override
  _Resume get _value => super._value as _Resume;

  @override
  $Res call({
    Object point = freezed,
  }) {
    return _then(_Resume(
      point == freezed ? _value.point : point as DateTime,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_Resume with DiagnosticableTreeMixin implements _Resume {
  const _$_Resume(this.point) : assert(point != null);

  factory _$_Resume.fromJson(Map<String, dynamic> json) =>
      _$_$_ResumeFromJson(json);

  @override
  final DateTime point;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LifecycleEvent.resume(point: $point)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LifecycleEvent.resume'))
      ..add(DiagnosticsProperty('point', point));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Resume &&
            (identical(other.point, point) ||
                const DeepCollectionEquality().equals(other.point, point)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(point);

  @JsonKey(ignore: true)
  @override
  _$ResumeCopyWith<_Resume> get copyWith =>
      __$ResumeCopyWithImpl<_Resume>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult resume(DateTime point),
    @required TResult suspend(DateTime point),
  }) {
    assert(resume != null);
    assert(suspend != null);
    return resume(point);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult resume(DateTime point),
    TResult suspend(DateTime point),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (resume != null) {
      return resume(point);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult resume(_Resume value),
    @required TResult suspend(_Suspend value),
  }) {
    assert(resume != null);
    assert(suspend != null);
    return resume(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult resume(_Resume value),
    TResult suspend(_Suspend value),
    @required TResult orElse(),
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
  const factory _Resume(DateTime point) = _$_Resume;

  factory _Resume.fromJson(Map<String, dynamic> json) = _$_Resume.fromJson;

  @override
  DateTime get point;
  @override
  @JsonKey(ignore: true)
  _$ResumeCopyWith<_Resume> get copyWith;
}

/// @nodoc
abstract class _$SuspendCopyWith<$Res>
    implements $LifecycleEventCopyWith<$Res> {
  factory _$SuspendCopyWith(_Suspend value, $Res Function(_Suspend) then) =
      __$SuspendCopyWithImpl<$Res>;
  @override
  $Res call({DateTime point});
}

/// @nodoc
class __$SuspendCopyWithImpl<$Res> extends _$LifecycleEventCopyWithImpl<$Res>
    implements _$SuspendCopyWith<$Res> {
  __$SuspendCopyWithImpl(_Suspend _value, $Res Function(_Suspend) _then)
      : super(_value, (v) => _then(v as _Suspend));

  @override
  _Suspend get _value => super._value as _Suspend;

  @override
  $Res call({
    Object point = freezed,
  }) {
    return _then(_Suspend(
      point == freezed ? _value.point : point as DateTime,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_Suspend with DiagnosticableTreeMixin implements _Suspend {
  const _$_Suspend(this.point) : assert(point != null);

  factory _$_Suspend.fromJson(Map<String, dynamic> json) =>
      _$_$_SuspendFromJson(json);

  @override
  final DateTime point;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LifecycleEvent.suspend(point: $point)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LifecycleEvent.suspend'))
      ..add(DiagnosticsProperty('point', point));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Suspend &&
            (identical(other.point, point) ||
                const DeepCollectionEquality().equals(other.point, point)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(point);

  @JsonKey(ignore: true)
  @override
  _$SuspendCopyWith<_Suspend> get copyWith =>
      __$SuspendCopyWithImpl<_Suspend>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult resume(DateTime point),
    @required TResult suspend(DateTime point),
  }) {
    assert(resume != null);
    assert(suspend != null);
    return suspend(point);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult resume(DateTime point),
    TResult suspend(DateTime point),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (suspend != null) {
      return suspend(point);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult resume(_Resume value),
    @required TResult suspend(_Suspend value),
  }) {
    assert(resume != null);
    assert(suspend != null);
    return suspend(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult resume(_Resume value),
    TResult suspend(_Suspend value),
    @required TResult orElse(),
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
  const factory _Suspend(DateTime point) = _$_Suspend;

  factory _Suspend.fromJson(Map<String, dynamic> json) = _$_Suspend.fromJson;

  @override
  DateTime get point;
  @override
  @JsonKey(ignore: true)
  _$SuspendCopyWith<_Suspend> get copyWith;
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

/// @nodoc
class _$LifecycleStateTearOff {
  const _$LifecycleStateTearOff();

// ignore: unused_element
  _Just just(
      {@required List<LifecycleEvent> log, @required LifecycleEvent current}) {
    return _Just(
      log: log,
      current: current,
    );
  }

// ignore: unused_element
  _Nothing nothing() {
    return const _Nothing();
  }

// ignore: unused_element
  LifecycleState fromJson(Map<String, Object> json) {
    return LifecycleState.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $LifecycleState = _$LifecycleStateTearOff();

/// @nodoc
mixin _$LifecycleState {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult just(List<LifecycleEvent> log, LifecycleEvent current),
    @required TResult nothing(),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult just(List<LifecycleEvent> log, LifecycleEvent current),
    TResult nothing(),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult just(_Just value),
    @required TResult nothing(_Nothing value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult just(_Just value),
    TResult nothing(_Nothing value),
    @required TResult orElse(),
  });
  Map<String, dynamic> toJson();
}

/// @nodoc
abstract class $LifecycleStateCopyWith<$Res> {
  factory $LifecycleStateCopyWith(
          LifecycleState value, $Res Function(LifecycleState) then) =
      _$LifecycleStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$LifecycleStateCopyWithImpl<$Res>
    implements $LifecycleStateCopyWith<$Res> {
  _$LifecycleStateCopyWithImpl(this._value, this._then);

  final LifecycleState _value;
  // ignore: unused_field
  final $Res Function(LifecycleState) _then;
}

/// @nodoc
abstract class _$JustCopyWith<$Res> {
  factory _$JustCopyWith(_Just value, $Res Function(_Just) then) =
      __$JustCopyWithImpl<$Res>;
  $Res call({List<LifecycleEvent> log, LifecycleEvent current});

  $LifecycleEventCopyWith<$Res> get current;
}

/// @nodoc
class __$JustCopyWithImpl<$Res> extends _$LifecycleStateCopyWithImpl<$Res>
    implements _$JustCopyWith<$Res> {
  __$JustCopyWithImpl(_Just _value, $Res Function(_Just) _then)
      : super(_value, (v) => _then(v as _Just));

  @override
  _Just get _value => super._value as _Just;

  @override
  $Res call({
    Object log = freezed,
    Object current = freezed,
  }) {
    return _then(_Just(
      log: log == freezed ? _value.log : log as List<LifecycleEvent>,
      current: current == freezed ? _value.current : current as LifecycleEvent,
    ));
  }

  @override
  $LifecycleEventCopyWith<$Res> get current {
    if (_value.current == null) {
      return null;
    }
    return $LifecycleEventCopyWith<$Res>(_value.current, (value) {
      return _then(_value.copyWith(current: value));
    });
  }
}

@JsonSerializable()

/// @nodoc
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

  @JsonKey(ignore: true)
  @override
  _$JustCopyWith<_Just> get copyWith =>
      __$JustCopyWithImpl<_Just>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult just(List<LifecycleEvent> log, LifecycleEvent current),
    @required TResult nothing(),
  }) {
    assert(just != null);
    assert(nothing != null);
    return just(log, current);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult just(List<LifecycleEvent> log, LifecycleEvent current),
    TResult nothing(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (just != null) {
      return just(log, current);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult just(_Just value),
    @required TResult nothing(_Nothing value),
  }) {
    assert(just != null);
    assert(nothing != null);
    return just(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult just(_Just value),
    TResult nothing(_Nothing value),
    @required TResult orElse(),
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
  @JsonKey(ignore: true)
  _$JustCopyWith<_Just> get copyWith;
}

/// @nodoc
abstract class _$NothingCopyWith<$Res> {
  factory _$NothingCopyWith(_Nothing value, $Res Function(_Nothing) then) =
      __$NothingCopyWithImpl<$Res>;
}

/// @nodoc
class __$NothingCopyWithImpl<$Res> extends _$LifecycleStateCopyWithImpl<$Res>
    implements _$NothingCopyWith<$Res> {
  __$NothingCopyWithImpl(_Nothing _value, $Res Function(_Nothing) _then)
      : super(_value, (v) => _then(v as _Nothing));

  @override
  _Nothing get _value => super._value as _Nothing;
}

@JsonSerializable()

/// @nodoc
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
  TResult when<TResult extends Object>({
    @required TResult just(List<LifecycleEvent> log, LifecycleEvent current),
    @required TResult nothing(),
  }) {
    assert(just != null);
    assert(nothing != null);
    return nothing();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult just(List<LifecycleEvent> log, LifecycleEvent current),
    TResult nothing(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (nothing != null) {
      return nothing();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult just(_Just value),
    @required TResult nothing(_Nothing value),
  }) {
    assert(just != null);
    assert(nothing != null);
    return nothing(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult just(_Just value),
    TResult nothing(_Nothing value),
    @required TResult orElse(),
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
