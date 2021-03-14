// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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

  _Resume resume(DateTime point) {
    return _Resume(
      point,
    );
  }

  _Suspend suspend(DateTime point) {
    return _Suspend(
      point,
    );
  }

  LifecycleEvent fromJson(Map<String, Object> json) {
    return LifecycleEvent.fromJson(json);
  }
}

/// @nodoc
const $LifecycleEvent = _$LifecycleEventTearOff();

/// @nodoc
mixin _$LifecycleEvent {
  DateTime get point => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime point) resume,
    required TResult Function(DateTime point) suspend,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime point)? resume,
    TResult Function(DateTime point)? suspend,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Resume value) resume,
    required TResult Function(_Suspend value) suspend,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Resume value)? resume,
    TResult Function(_Suspend value)? suspend,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LifecycleEventCopyWith<LifecycleEvent> get copyWith =>
      throw _privateConstructorUsedError;
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
    Object? point = freezed,
  }) {
    return _then(_value.copyWith(
      point: point == freezed
          ? _value.point
          : point // ignore: cast_nullable_to_non_nullable
              as DateTime,
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
    Object? point = freezed,
  }) {
    return _then(_Resume(
      point == freezed
          ? _value.point
          : point // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_Resume with DiagnosticableTreeMixin implements _Resume {
  const _$_Resume(this.point);

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
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime point) resume,
    required TResult Function(DateTime point) suspend,
  }) {
    return resume(point);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime point)? resume,
    TResult Function(DateTime point)? suspend,
    required TResult orElse(),
  }) {
    if (resume != null) {
      return resume(point);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Resume value) resume,
    required TResult Function(_Suspend value) suspend,
  }) {
    return resume(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Resume value)? resume,
    TResult Function(_Suspend value)? suspend,
    required TResult orElse(),
  }) {
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
  DateTime get point => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ResumeCopyWith<_Resume> get copyWith => throw _privateConstructorUsedError;
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
    Object? point = freezed,
  }) {
    return _then(_Suspend(
      point == freezed
          ? _value.point
          : point // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_Suspend with DiagnosticableTreeMixin implements _Suspend {
  const _$_Suspend(this.point);

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
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime point) resume,
    required TResult Function(DateTime point) suspend,
  }) {
    return suspend(point);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime point)? resume,
    TResult Function(DateTime point)? suspend,
    required TResult orElse(),
  }) {
    if (suspend != null) {
      return suspend(point);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Resume value) resume,
    required TResult Function(_Suspend value) suspend,
  }) {
    return suspend(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Resume value)? resume,
    TResult Function(_Suspend value)? suspend,
    required TResult orElse(),
  }) {
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
  DateTime get point => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SuspendCopyWith<_Suspend> get copyWith =>
      throw _privateConstructorUsedError;
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

  _Just just(
      {required List<LifecycleEvent> log, required LifecycleEvent current}) {
    return _Just(
      log: log,
      current: current,
    );
  }

  _Nothing nothing() {
    return const _Nothing();
  }

  LifecycleState fromJson(Map<String, Object> json) {
    return LifecycleState.fromJson(json);
  }
}

/// @nodoc
const $LifecycleState = _$LifecycleStateTearOff();

/// @nodoc
mixin _$LifecycleState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<LifecycleEvent> log, LifecycleEvent current)
        just,
    required TResult Function() nothing,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<LifecycleEvent> log, LifecycleEvent current)? just,
    TResult Function()? nothing,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Just value) just,
    required TResult Function(_Nothing value) nothing,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Just value)? just,
    TResult Function(_Nothing value)? nothing,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
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
    Object? log = freezed,
    Object? current = freezed,
  }) {
    return _then(_Just(
      log: log == freezed
          ? _value.log
          : log // ignore: cast_nullable_to_non_nullable
              as List<LifecycleEvent>,
      current: current == freezed
          ? _value.current
          : current // ignore: cast_nullable_to_non_nullable
              as LifecycleEvent,
    ));
  }

  @override
  $LifecycleEventCopyWith<$Res> get current {
    return $LifecycleEventCopyWith<$Res>(_value.current, (value) {
      return _then(_value.copyWith(current: value));
    });
  }
}

@JsonSerializable()

/// @nodoc
class _$_Just with DiagnosticableTreeMixin implements _Just {
  const _$_Just({required this.log, required this.current});

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
  TResult when<TResult extends Object?>({
    required TResult Function(List<LifecycleEvent> log, LifecycleEvent current)
        just,
    required TResult Function() nothing,
  }) {
    return just(log, current);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<LifecycleEvent> log, LifecycleEvent current)? just,
    TResult Function()? nothing,
    required TResult orElse(),
  }) {
    if (just != null) {
      return just(log, current);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Just value) just,
    required TResult Function(_Nothing value) nothing,
  }) {
    return just(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Just value)? just,
    TResult Function(_Nothing value)? nothing,
    required TResult orElse(),
  }) {
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
      {required List<LifecycleEvent> log,
      required LifecycleEvent current}) = _$_Just;

  factory _Just.fromJson(Map<String, dynamic> json) = _$_Just.fromJson;

  List<LifecycleEvent> get log => throw _privateConstructorUsedError;
  LifecycleEvent get current => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$JustCopyWith<_Just> get copyWith => throw _privateConstructorUsedError;
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
  TResult when<TResult extends Object?>({
    required TResult Function(List<LifecycleEvent> log, LifecycleEvent current)
        just,
    required TResult Function() nothing,
  }) {
    return nothing();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<LifecycleEvent> log, LifecycleEvent current)? just,
    TResult Function()? nothing,
    required TResult orElse(),
  }) {
    if (nothing != null) {
      return nothing();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Just value) just,
    required TResult Function(_Nothing value) nothing,
  }) {
    return nothing(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Just value)? just,
    TResult Function(_Nothing value)? nothing,
    required TResult orElse(),
  }) {
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
