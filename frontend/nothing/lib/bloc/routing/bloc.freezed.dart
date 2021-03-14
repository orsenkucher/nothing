// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$RoutingEventTearOff {
  const _$RoutingEventTearOff();

  _Push push({required Routes from, required Routes to}) {
    return _Push(
      from: from,
      to: to,
    );
  }

  _Resume resume() {
    return const _Resume();
  }

  _Pop pop({required Routes from}) {
    return _Pop(
      from: from,
    );
  }
}

/// @nodoc
const $RoutingEvent = _$RoutingEventTearOff();

/// @nodoc
mixin _$RoutingEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Routes from, Routes to) push,
    required TResult Function() resume,
    required TResult Function(Routes from) pop,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Routes from, Routes to)? push,
    TResult Function()? resume,
    TResult Function(Routes from)? pop,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Push value) push,
    required TResult Function(_Resume value) resume,
    required TResult Function(_Pop value) pop,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Push value)? push,
    TResult Function(_Resume value)? resume,
    TResult Function(_Pop value)? pop,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoutingEventCopyWith<$Res> {
  factory $RoutingEventCopyWith(
          RoutingEvent value, $Res Function(RoutingEvent) then) =
      _$RoutingEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$RoutingEventCopyWithImpl<$Res> implements $RoutingEventCopyWith<$Res> {
  _$RoutingEventCopyWithImpl(this._value, this._then);

  final RoutingEvent _value;
  // ignore: unused_field
  final $Res Function(RoutingEvent) _then;
}

/// @nodoc
abstract class _$PushCopyWith<$Res> {
  factory _$PushCopyWith(_Push value, $Res Function(_Push) then) =
      __$PushCopyWithImpl<$Res>;
  $Res call({Routes from, Routes to});

  $RoutesCopyWith<$Res> get from;
  $RoutesCopyWith<$Res> get to;
}

/// @nodoc
class __$PushCopyWithImpl<$Res> extends _$RoutingEventCopyWithImpl<$Res>
    implements _$PushCopyWith<$Res> {
  __$PushCopyWithImpl(_Push _value, $Res Function(_Push) _then)
      : super(_value, (v) => _then(v as _Push));

  @override
  _Push get _value => super._value as _Push;

  @override
  $Res call({
    Object? from = freezed,
    Object? to = freezed,
  }) {
    return _then(_Push(
      from: from == freezed
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as Routes,
      to: to == freezed
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as Routes,
    ));
  }

  @override
  $RoutesCopyWith<$Res> get from {
    return $RoutesCopyWith<$Res>(_value.from, (value) {
      return _then(_value.copyWith(from: value));
    });
  }

  @override
  $RoutesCopyWith<$Res> get to {
    return $RoutesCopyWith<$Res>(_value.to, (value) {
      return _then(_value.copyWith(to: value));
    });
  }
}

/// @nodoc
class _$_Push with DiagnosticableTreeMixin implements _Push {
  const _$_Push({required this.from, required this.to});

  @override
  final Routes from;
  @override
  final Routes to;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RoutingEvent.push(from: $from, to: $to)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RoutingEvent.push'))
      ..add(DiagnosticsProperty('from', from))
      ..add(DiagnosticsProperty('to', to));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Push &&
            (identical(other.from, from) ||
                const DeepCollectionEquality().equals(other.from, from)) &&
            (identical(other.to, to) ||
                const DeepCollectionEquality().equals(other.to, to)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(from) ^
      const DeepCollectionEquality().hash(to);

  @JsonKey(ignore: true)
  @override
  _$PushCopyWith<_Push> get copyWith =>
      __$PushCopyWithImpl<_Push>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Routes from, Routes to) push,
    required TResult Function() resume,
    required TResult Function(Routes from) pop,
  }) {
    return push(from, to);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Routes from, Routes to)? push,
    TResult Function()? resume,
    TResult Function(Routes from)? pop,
    required TResult orElse(),
  }) {
    if (push != null) {
      return push(from, to);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Push value) push,
    required TResult Function(_Resume value) resume,
    required TResult Function(_Pop value) pop,
  }) {
    return push(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Push value)? push,
    TResult Function(_Resume value)? resume,
    TResult Function(_Pop value)? pop,
    required TResult orElse(),
  }) {
    if (push != null) {
      return push(this);
    }
    return orElse();
  }
}

abstract class _Push implements RoutingEvent {
  const factory _Push({required Routes from, required Routes to}) = _$_Push;

  Routes get from => throw _privateConstructorUsedError;
  Routes get to => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$PushCopyWith<_Push> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$ResumeCopyWith<$Res> {
  factory _$ResumeCopyWith(_Resume value, $Res Function(_Resume) then) =
      __$ResumeCopyWithImpl<$Res>;
}

/// @nodoc
class __$ResumeCopyWithImpl<$Res> extends _$RoutingEventCopyWithImpl<$Res>
    implements _$ResumeCopyWith<$Res> {
  __$ResumeCopyWithImpl(_Resume _value, $Res Function(_Resume) _then)
      : super(_value, (v) => _then(v as _Resume));

  @override
  _Resume get _value => super._value as _Resume;
}

/// @nodoc
class _$_Resume with DiagnosticableTreeMixin implements _Resume {
  const _$_Resume();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RoutingEvent.resume()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'RoutingEvent.resume'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Resume);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Routes from, Routes to) push,
    required TResult Function() resume,
    required TResult Function(Routes from) pop,
  }) {
    return resume();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Routes from, Routes to)? push,
    TResult Function()? resume,
    TResult Function(Routes from)? pop,
    required TResult orElse(),
  }) {
    if (resume != null) {
      return resume();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Push value) push,
    required TResult Function(_Resume value) resume,
    required TResult Function(_Pop value) pop,
  }) {
    return resume(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Push value)? push,
    TResult Function(_Resume value)? resume,
    TResult Function(_Pop value)? pop,
    required TResult orElse(),
  }) {
    if (resume != null) {
      return resume(this);
    }
    return orElse();
  }
}

abstract class _Resume implements RoutingEvent {
  const factory _Resume() = _$_Resume;
}

/// @nodoc
abstract class _$PopCopyWith<$Res> {
  factory _$PopCopyWith(_Pop value, $Res Function(_Pop) then) =
      __$PopCopyWithImpl<$Res>;
  $Res call({Routes from});

  $RoutesCopyWith<$Res> get from;
}

/// @nodoc
class __$PopCopyWithImpl<$Res> extends _$RoutingEventCopyWithImpl<$Res>
    implements _$PopCopyWith<$Res> {
  __$PopCopyWithImpl(_Pop _value, $Res Function(_Pop) _then)
      : super(_value, (v) => _then(v as _Pop));

  @override
  _Pop get _value => super._value as _Pop;

  @override
  $Res call({
    Object? from = freezed,
  }) {
    return _then(_Pop(
      from: from == freezed
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as Routes,
    ));
  }

  @override
  $RoutesCopyWith<$Res> get from {
    return $RoutesCopyWith<$Res>(_value.from, (value) {
      return _then(_value.copyWith(from: value));
    });
  }
}

/// @nodoc
class _$_Pop with DiagnosticableTreeMixin implements _Pop {
  const _$_Pop({required this.from});

  @override
  final Routes from;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RoutingEvent.pop(from: $from)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RoutingEvent.pop'))
      ..add(DiagnosticsProperty('from', from));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Pop &&
            (identical(other.from, from) ||
                const DeepCollectionEquality().equals(other.from, from)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(from);

  @JsonKey(ignore: true)
  @override
  _$PopCopyWith<_Pop> get copyWith =>
      __$PopCopyWithImpl<_Pop>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Routes from, Routes to) push,
    required TResult Function() resume,
    required TResult Function(Routes from) pop,
  }) {
    return pop(from);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Routes from, Routes to)? push,
    TResult Function()? resume,
    TResult Function(Routes from)? pop,
    required TResult orElse(),
  }) {
    if (pop != null) {
      return pop(from);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Push value) push,
    required TResult Function(_Resume value) resume,
    required TResult Function(_Pop value) pop,
  }) {
    return pop(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Push value)? push,
    TResult Function(_Resume value)? resume,
    TResult Function(_Pop value)? pop,
    required TResult orElse(),
  }) {
    if (pop != null) {
      return pop(this);
    }
    return orElse();
  }
}

abstract class _Pop implements RoutingEvent {
  const factory _Pop({required Routes from}) = _$_Pop;

  Routes get from => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$PopCopyWith<_Pop> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
class _$RoutingStateTearOff {
  const _$RoutingStateTearOff();

  _RoutingState priv(
      {required RoutingEvent event,
      required List<Routes> log,
      required String salt}) {
    return _RoutingState(
      event: event,
      log: log,
      salt: salt,
    );
  }
}

/// @nodoc
const $RoutingState = _$RoutingStateTearOff();

/// @nodoc
mixin _$RoutingState {
  RoutingEvent get event => throw _privateConstructorUsedError;
  List<Routes> get log => throw _privateConstructorUsedError;
  String get salt => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(RoutingEvent event, List<Routes> log, String salt)
        priv,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(RoutingEvent event, List<Routes> log, String salt)? priv,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RoutingState value) priv,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RoutingState value)? priv,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RoutingStateCopyWith<RoutingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoutingStateCopyWith<$Res> {
  factory $RoutingStateCopyWith(
          RoutingState value, $Res Function(RoutingState) then) =
      _$RoutingStateCopyWithImpl<$Res>;
  $Res call({RoutingEvent event, List<Routes> log, String salt});

  $RoutingEventCopyWith<$Res> get event;
}

/// @nodoc
class _$RoutingStateCopyWithImpl<$Res> implements $RoutingStateCopyWith<$Res> {
  _$RoutingStateCopyWithImpl(this._value, this._then);

  final RoutingState _value;
  // ignore: unused_field
  final $Res Function(RoutingState) _then;

  @override
  $Res call({
    Object? event = freezed,
    Object? log = freezed,
    Object? salt = freezed,
  }) {
    return _then(_value.copyWith(
      event: event == freezed
          ? _value.event
          : event // ignore: cast_nullable_to_non_nullable
              as RoutingEvent,
      log: log == freezed
          ? _value.log
          : log // ignore: cast_nullable_to_non_nullable
              as List<Routes>,
      salt: salt == freezed
          ? _value.salt
          : salt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  @override
  $RoutingEventCopyWith<$Res> get event {
    return $RoutingEventCopyWith<$Res>(_value.event, (value) {
      return _then(_value.copyWith(event: value));
    });
  }
}

/// @nodoc
abstract class _$RoutingStateCopyWith<$Res>
    implements $RoutingStateCopyWith<$Res> {
  factory _$RoutingStateCopyWith(
          _RoutingState value, $Res Function(_RoutingState) then) =
      __$RoutingStateCopyWithImpl<$Res>;
  @override
  $Res call({RoutingEvent event, List<Routes> log, String salt});

  @override
  $RoutingEventCopyWith<$Res> get event;
}

/// @nodoc
class __$RoutingStateCopyWithImpl<$Res> extends _$RoutingStateCopyWithImpl<$Res>
    implements _$RoutingStateCopyWith<$Res> {
  __$RoutingStateCopyWithImpl(
      _RoutingState _value, $Res Function(_RoutingState) _then)
      : super(_value, (v) => _then(v as _RoutingState));

  @override
  _RoutingState get _value => super._value as _RoutingState;

  @override
  $Res call({
    Object? event = freezed,
    Object? log = freezed,
    Object? salt = freezed,
  }) {
    return _then(_RoutingState(
      event: event == freezed
          ? _value.event
          : event // ignore: cast_nullable_to_non_nullable
              as RoutingEvent,
      log: log == freezed
          ? _value.log
          : log // ignore: cast_nullable_to_non_nullable
              as List<Routes>,
      salt: salt == freezed
          ? _value.salt
          : salt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
class _$_RoutingState with DiagnosticableTreeMixin implements _RoutingState {
  const _$_RoutingState(
      {required this.event, required this.log, required this.salt});

  @override
  final RoutingEvent event;
  @override
  final List<Routes> log;
  @override
  final String salt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RoutingState.priv(event: $event, log: $log, salt: $salt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RoutingState.priv'))
      ..add(DiagnosticsProperty('event', event))
      ..add(DiagnosticsProperty('log', log))
      ..add(DiagnosticsProperty('salt', salt));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RoutingState &&
            (identical(other.event, event) ||
                const DeepCollectionEquality().equals(other.event, event)) &&
            (identical(other.log, log) ||
                const DeepCollectionEquality().equals(other.log, log)) &&
            (identical(other.salt, salt) ||
                const DeepCollectionEquality().equals(other.salt, salt)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(event) ^
      const DeepCollectionEquality().hash(log) ^
      const DeepCollectionEquality().hash(salt);

  @JsonKey(ignore: true)
  @override
  _$RoutingStateCopyWith<_RoutingState> get copyWith =>
      __$RoutingStateCopyWithImpl<_RoutingState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(RoutingEvent event, List<Routes> log, String salt)
        priv,
  }) {
    return priv(event, log, salt);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(RoutingEvent event, List<Routes> log, String salt)? priv,
    required TResult orElse(),
  }) {
    if (priv != null) {
      return priv(event, log, salt);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RoutingState value) priv,
  }) {
    return priv(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RoutingState value)? priv,
    required TResult orElse(),
  }) {
    if (priv != null) {
      return priv(this);
    }
    return orElse();
  }
}

abstract class _RoutingState implements RoutingState {
  const factory _RoutingState(
      {required RoutingEvent event,
      required List<Routes> log,
      required String salt}) = _$_RoutingState;

  @override
  RoutingEvent get event => throw _privateConstructorUsedError;
  @override
  List<Routes> get log => throw _privateConstructorUsedError;
  @override
  String get salt => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$RoutingStateCopyWith<_RoutingState> get copyWith =>
      throw _privateConstructorUsedError;
}
