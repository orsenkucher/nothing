// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$RoutingEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result push(@required Routes from, @required Routes to),
    @required Result resume(),
    @required Result pop(@required Routes from),
  });

  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result push(@required Routes from, @required Routes to),
    Result resume(),
    Result pop(@required Routes from),
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

const $RoutingEvent = _$RoutingEventTearOff();

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
  _$_Push copyWith({
    Object from = freezed,
    Object to = freezed,
  }) {
    return _$_Push(
      from: from == freezed ? this.from : from as Routes,
      to: to == freezed ? this.to : to as Routes,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result push(@required Routes from, @required Routes to),
    @required Result resume(),
    @required Result pop(@required Routes from),
  }) {
    assert(push != null);
    assert(resume != null);
    assert(pop != null);
    return push(from, to);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result push(@required Routes from, @required Routes to),
    Result resume(),
    Result pop(@required Routes from),
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

  _Push copyWith({Routes from, Routes to});
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
    @required Result push(@required Routes from, @required Routes to),
    @required Result resume(),
    @required Result pop(@required Routes from),
  }) {
    assert(push != null);
    assert(resume != null);
    assert(pop != null);
    return resume();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result push(@required Routes from, @required Routes to),
    Result resume(),
    Result pop(@required Routes from),
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
  _$_Pop copyWith({
    Object from = freezed,
  }) {
    return _$_Pop(
      from: from == freezed ? this.from : from as Routes,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result push(@required Routes from, @required Routes to),
    @required Result resume(),
    @required Result pop(@required Routes from),
  }) {
    assert(push != null);
    assert(resume != null);
    assert(pop != null);
    return pop(from);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result push(@required Routes from, @required Routes to),
    Result resume(),
    Result pop(@required Routes from),
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

  _Pop copyWith({Routes from});
}

mixin _$RoutingState {
  RoutingEvent get event;
  List<Routes> get log;
  String get salt;

  RoutingState copyWith({RoutingEvent event, List<Routes> log, String salt});
}

class _$RoutingStateTearOff {
  const _$RoutingStateTearOff();

  _RoutingState _(
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

const $RoutingState = _$RoutingStateTearOff();

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
    return 'RoutingState._(event: $event, log: $log, salt: $salt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RoutingState._'))
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
  _$_RoutingState copyWith({
    Object event = freezed,
    Object log = freezed,
    Object salt = freezed,
  }) {
    return _$_RoutingState(
      event: event == freezed ? this.event : event as RoutingEvent,
      log: log == freezed ? this.log : log as List<Routes>,
      salt: salt == freezed ? this.salt : salt as String,
    );
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
  _RoutingState copyWith({RoutingEvent event, List<Routes> log, String salt});
}
