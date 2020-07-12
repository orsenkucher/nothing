// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$RoutingEventTearOff {
  const _$RoutingEventTearOff();

  _Push push({@required Routes from, @required Routes to}) {
    return _Push(
      from: from,
      to: to,
    );
  }

  _Resume resume() {
    return const _Resume();
  }

  _Pop pop({@required Routes from}) {
    return _Pop(
      from: from,
    );
  }
}

// ignore: unused_element
const $RoutingEvent = _$RoutingEventTearOff();

mixin _$RoutingEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result push(Routes from, Routes to),
    @required Result resume(),
    @required Result pop(Routes from),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result push(Routes from, Routes to),
    Result resume(),
    Result pop(Routes from),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result push(_Push value),
    @required Result resume(_Resume value),
    @required Result pop(_Pop value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result push(_Push value),
    Result resume(_Resume value),
    Result pop(_Pop value),
    @required Result orElse(),
  });
}

abstract class $RoutingEventCopyWith<$Res> {
  factory $RoutingEventCopyWith(
          RoutingEvent value, $Res Function(RoutingEvent) then) =
      _$RoutingEventCopyWithImpl<$Res>;
}

class _$RoutingEventCopyWithImpl<$Res> implements $RoutingEventCopyWith<$Res> {
  _$RoutingEventCopyWithImpl(this._value, this._then);

  final RoutingEvent _value;
  // ignore: unused_field
  final $Res Function(RoutingEvent) _then;
}

abstract class _$PushCopyWith<$Res> {
  factory _$PushCopyWith(_Push value, $Res Function(_Push) then) =
      __$PushCopyWithImpl<$Res>;
  $Res call({Routes from, Routes to});

  $RoutesCopyWith<$Res> get from;
  $RoutesCopyWith<$Res> get to;
}

class __$PushCopyWithImpl<$Res> extends _$RoutingEventCopyWithImpl<$Res>
    implements _$PushCopyWith<$Res> {
  __$PushCopyWithImpl(_Push _value, $Res Function(_Push) _then)
      : super(_value, (v) => _then(v as _Push));

  @override
  _Push get _value => super._value as _Push;

  @override
  $Res call({
    Object from = freezed,
    Object to = freezed,
  }) {
    return _then(_Push(
      from: from == freezed ? _value.from : from as Routes,
      to: to == freezed ? _value.to : to as Routes,
    ));
  }

  @override
  $RoutesCopyWith<$Res> get from {
    if (_value.from == null) {
      return null;
    }
    return $RoutesCopyWith<$Res>(_value.from, (value) {
      return _then(_value.copyWith(from: value));
    });
  }

  @override
  $RoutesCopyWith<$Res> get to {
    if (_value.to == null) {
      return null;
    }
    return $RoutesCopyWith<$Res>(_value.to, (value) {
      return _then(_value.copyWith(to: value));
    });
  }
}

class _$_Push with DiagnosticableTreeMixin implements _Push {
  const _$_Push({@required this.from, @required this.to})
      : assert(from != null),
        assert(to != null);

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

  @override
  _$PushCopyWith<_Push> get copyWith =>
      __$PushCopyWithImpl<_Push>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result push(Routes from, Routes to),
    @required Result resume(),
    @required Result pop(Routes from),
  }) {
    assert(push != null);
    assert(resume != null);
    assert(pop != null);
    return push(from, to);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result push(Routes from, Routes to),
    Result resume(),
    Result pop(Routes from),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (push != null) {
      return push(from, to);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result push(_Push value),
    @required Result resume(_Resume value),
    @required Result pop(_Pop value),
  }) {
    assert(push != null);
    assert(resume != null);
    assert(pop != null);
    return push(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result push(_Push value),
    Result resume(_Resume value),
    Result pop(_Pop value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (push != null) {
      return push(this);
    }
    return orElse();
  }
}

abstract class _Push implements RoutingEvent {
  const factory _Push({@required Routes from, @required Routes to}) = _$_Push;

  Routes get from;
  Routes get to;
  _$PushCopyWith<_Push> get copyWith;
}

abstract class _$ResumeCopyWith<$Res> {
  factory _$ResumeCopyWith(_Resume value, $Res Function(_Resume) then) =
      __$ResumeCopyWithImpl<$Res>;
}

class __$ResumeCopyWithImpl<$Res> extends _$RoutingEventCopyWithImpl<$Res>
    implements _$ResumeCopyWith<$Res> {
  __$ResumeCopyWithImpl(_Resume _value, $Res Function(_Resume) _then)
      : super(_value, (v) => _then(v as _Resume));

  @override
  _Resume get _value => super._value as _Resume;
}

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
  Result when<Result extends Object>({
    @required Result push(Routes from, Routes to),
    @required Result resume(),
    @required Result pop(Routes from),
  }) {
    assert(push != null);
    assert(resume != null);
    assert(pop != null);
    return resume();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result push(Routes from, Routes to),
    Result resume(),
    Result pop(Routes from),
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
    @required Result push(_Push value),
    @required Result resume(_Resume value),
    @required Result pop(_Pop value),
  }) {
    assert(push != null);
    assert(resume != null);
    assert(pop != null);
    return resume(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result push(_Push value),
    Result resume(_Resume value),
    Result pop(_Pop value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (resume != null) {
      return resume(this);
    }
    return orElse();
  }
}

abstract class _Resume implements RoutingEvent {
  const factory _Resume() = _$_Resume;
}

abstract class _$PopCopyWith<$Res> {
  factory _$PopCopyWith(_Pop value, $Res Function(_Pop) then) =
      __$PopCopyWithImpl<$Res>;
  $Res call({Routes from});

  $RoutesCopyWith<$Res> get from;
}

class __$PopCopyWithImpl<$Res> extends _$RoutingEventCopyWithImpl<$Res>
    implements _$PopCopyWith<$Res> {
  __$PopCopyWithImpl(_Pop _value, $Res Function(_Pop) _then)
      : super(_value, (v) => _then(v as _Pop));

  @override
  _Pop get _value => super._value as _Pop;

  @override
  $Res call({
    Object from = freezed,
  }) {
    return _then(_Pop(
      from: from == freezed ? _value.from : from as Routes,
    ));
  }

  @override
  $RoutesCopyWith<$Res> get from {
    if (_value.from == null) {
      return null;
    }
    return $RoutesCopyWith<$Res>(_value.from, (value) {
      return _then(_value.copyWith(from: value));
    });
  }
}

class _$_Pop with DiagnosticableTreeMixin implements _Pop {
  const _$_Pop({@required this.from}) : assert(from != null);

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

  @override
  _$PopCopyWith<_Pop> get copyWith =>
      __$PopCopyWithImpl<_Pop>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result push(Routes from, Routes to),
    @required Result resume(),
    @required Result pop(Routes from),
  }) {
    assert(push != null);
    assert(resume != null);
    assert(pop != null);
    return pop(from);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result push(Routes from, Routes to),
    Result resume(),
    Result pop(Routes from),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (pop != null) {
      return pop(from);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result push(_Push value),
    @required Result resume(_Resume value),
    @required Result pop(_Pop value),
  }) {
    assert(push != null);
    assert(resume != null);
    assert(pop != null);
    return pop(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result push(_Push value),
    Result resume(_Resume value),
    Result pop(_Pop value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (pop != null) {
      return pop(this);
    }
    return orElse();
  }
}

abstract class _Pop implements RoutingEvent {
  const factory _Pop({@required Routes from}) = _$_Pop;

  Routes get from;
  _$PopCopyWith<_Pop> get copyWith;
}

class _$RoutingStateTearOff {
  const _$RoutingStateTearOff();

  _RoutingState priv(
      {@required RoutingEvent event,
      @required List<Routes> log,
      @required String salt}) {
    return _RoutingState(
      event: event,
      log: log,
      salt: salt,
    );
  }
}

// ignore: unused_element
const $RoutingState = _$RoutingStateTearOff();

mixin _$RoutingState {
  RoutingEvent get event;
  List<Routes> get log;
  String get salt;

  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result priv(RoutingEvent event, List<Routes> log, String salt),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result priv(RoutingEvent event, List<Routes> log, String salt),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result priv(_RoutingState value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result priv(_RoutingState value),
    @required Result orElse(),
  });

  $RoutingStateCopyWith<RoutingState> get copyWith;
}

abstract class $RoutingStateCopyWith<$Res> {
  factory $RoutingStateCopyWith(
          RoutingState value, $Res Function(RoutingState) then) =
      _$RoutingStateCopyWithImpl<$Res>;
  $Res call({RoutingEvent event, List<Routes> log, String salt});

  $RoutingEventCopyWith<$Res> get event;
}

class _$RoutingStateCopyWithImpl<$Res> implements $RoutingStateCopyWith<$Res> {
  _$RoutingStateCopyWithImpl(this._value, this._then);

  final RoutingState _value;
  // ignore: unused_field
  final $Res Function(RoutingState) _then;

  @override
  $Res call({
    Object event = freezed,
    Object log = freezed,
    Object salt = freezed,
  }) {
    return _then(_value.copyWith(
      event: event == freezed ? _value.event : event as RoutingEvent,
      log: log == freezed ? _value.log : log as List<Routes>,
      salt: salt == freezed ? _value.salt : salt as String,
    ));
  }

  @override
  $RoutingEventCopyWith<$Res> get event {
    if (_value.event == null) {
      return null;
    }
    return $RoutingEventCopyWith<$Res>(_value.event, (value) {
      return _then(_value.copyWith(event: value));
    });
  }
}

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

class __$RoutingStateCopyWithImpl<$Res> extends _$RoutingStateCopyWithImpl<$Res>
    implements _$RoutingStateCopyWith<$Res> {
  __$RoutingStateCopyWithImpl(
      _RoutingState _value, $Res Function(_RoutingState) _then)
      : super(_value, (v) => _then(v as _RoutingState));

  @override
  _RoutingState get _value => super._value as _RoutingState;

  @override
  $Res call({
    Object event = freezed,
    Object log = freezed,
    Object salt = freezed,
  }) {
    return _then(_RoutingState(
      event: event == freezed ? _value.event : event as RoutingEvent,
      log: log == freezed ? _value.log : log as List<Routes>,
      salt: salt == freezed ? _value.salt : salt as String,
    ));
  }
}

class _$_RoutingState with DiagnosticableTreeMixin implements _RoutingState {
  const _$_RoutingState(
      {@required this.event, @required this.log, @required this.salt})
      : assert(event != null),
        assert(log != null),
        assert(salt != null);

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

  @override
  _$RoutingStateCopyWith<_RoutingState> get copyWith =>
      __$RoutingStateCopyWithImpl<_RoutingState>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result priv(RoutingEvent event, List<Routes> log, String salt),
  }) {
    assert(priv != null);
    return priv(event, log, salt);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result priv(RoutingEvent event, List<Routes> log, String salt),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (priv != null) {
      return priv(event, log, salt);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result priv(_RoutingState value),
  }) {
    assert(priv != null);
    return priv(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result priv(_RoutingState value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (priv != null) {
      return priv(this);
    }
    return orElse();
  }
}

abstract class _RoutingState implements RoutingState {
  const factory _RoutingState(
      {@required RoutingEvent event,
      @required List<Routes> log,
      @required String salt}) = _$_RoutingState;

  @override
  RoutingEvent get event;
  @override
  List<Routes> get log;
  @override
  String get salt;
  @override
  _$RoutingStateCopyWith<_RoutingState> get copyWith;
}
