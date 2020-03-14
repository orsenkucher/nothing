// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$RoutingEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result push(@required String from, @required String to),
    @required Result resume(),
    @required Result pop(@required String from),
  });

  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result push(@required String from, @required String to),
    Result resume(),
    Result pop(@required String from),
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

  _Push push({@required String from, @required String to}) {
    return _Push(
      from: from,
      to: to,
    );
  }

  _Resume resume() {
    return const _Resume();
  }

  _Pop pop({@required String from}) {
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
  final String from;
  @override
  final String to;

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
      from: from == freezed ? this.from : from as String,
      to: to == freezed ? this.to : to as String,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result push(@required String from, @required String to),
    @required Result resume(),
    @required Result pop(@required String from),
  }) {
    assert(push != null);
    assert(resume != null);
    assert(pop != null);
    return push(from, to);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result push(@required String from, @required String to),
    Result resume(),
    Result pop(@required String from),
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
  const factory _Push({@required String from, @required String to}) = _$_Push;

  String get from;
  String get to;

  _Push copyWith({String from, String to});
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
    @required Result push(@required String from, @required String to),
    @required Result resume(),
    @required Result pop(@required String from),
  }) {
    assert(push != null);
    assert(resume != null);
    assert(pop != null);
    return resume();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result push(@required String from, @required String to),
    Result resume(),
    Result pop(@required String from),
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
  final String from;

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
      from: from == freezed ? this.from : from as String,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result push(@required String from, @required String to),
    @required Result resume(),
    @required Result pop(@required String from),
  }) {
    assert(push != null);
    assert(resume != null);
    assert(pop != null);
    return pop(from);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result push(@required String from, @required String to),
    Result resume(),
    Result pop(@required String from),
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
  const factory _Pop({@required String from}) = _$_Pop;

  String get from;

  _Pop copyWith({String from});
}

mixin _$RoutingState {
  List<String> get log;

  RoutingState copyWith({List<String> log});

  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result push(@required List<String> log),
    @required Result pop(@required List<String> log),
    @required Result resume(@required List<String> log, @required String salt),
  });

  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result push(@required List<String> log),
    Result pop(@required List<String> log),
    Result resume(@required List<String> log, @required String salt),
    @required Result orElse(),
  });

  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result push(_PushState value),
    @required Result pop(_PopState value),
    @required Result resume(_ResumeState value),
  });

  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result push(_PushState value),
    Result pop(_PopState value),
    Result resume(_ResumeState value),
    @required Result orElse(),
  });
}

class _$RoutingStateTearOff {
  const _$RoutingStateTearOff();

  _PushState push({@required List<String> log}) {
    return _PushState(
      log: log,
    );
  }

  _PopState pop({@required List<String> log}) {
    return _PopState(
      log: log,
    );
  }

  _ResumeState resume({@required List<String> log, @required String salt}) {
    return _ResumeState(
      log: log,
      salt: salt,
    );
  }
}

const $RoutingState = _$RoutingStateTearOff();

class _$_PushState with DiagnosticableTreeMixin implements _PushState {
  const _$_PushState({@required this.log}) : assert(log != null);

  @override
  final List<String> log;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RoutingState.push(log: $log)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RoutingState.push'))
      ..add(DiagnosticsProperty('log', log));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PushState &&
            (identical(other.log, log) ||
                const DeepCollectionEquality().equals(other.log, log)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(log);

  @override
  _$_PushState copyWith({
    Object log = freezed,
  }) {
    return _$_PushState(
      log: log == freezed ? this.log : log as List<String>,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result push(@required List<String> log),
    @required Result pop(@required List<String> log),
    @required Result resume(@required List<String> log, @required String salt),
  }) {
    assert(push != null);
    assert(pop != null);
    assert(resume != null);
    return push(log);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result push(@required List<String> log),
    Result pop(@required List<String> log),
    Result resume(@required List<String> log, @required String salt),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (push != null) {
      return push(log);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result push(_PushState value),
    @required Result pop(_PopState value),
    @required Result resume(_ResumeState value),
  }) {
    assert(push != null);
    assert(pop != null);
    assert(resume != null);
    return push(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result push(_PushState value),
    Result pop(_PopState value),
    Result resume(_ResumeState value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (push != null) {
      return push(this);
    }
    return orElse();
  }
}

abstract class _PushState implements RoutingState {
  const factory _PushState({@required List<String> log}) = _$_PushState;

  @override
  List<String> get log;

  @override
  _PushState copyWith({List<String> log});
}

class _$_PopState with DiagnosticableTreeMixin implements _PopState {
  const _$_PopState({@required this.log}) : assert(log != null);

  @override
  final List<String> log;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RoutingState.pop(log: $log)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RoutingState.pop'))
      ..add(DiagnosticsProperty('log', log));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PopState &&
            (identical(other.log, log) ||
                const DeepCollectionEquality().equals(other.log, log)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(log);

  @override
  _$_PopState copyWith({
    Object log = freezed,
  }) {
    return _$_PopState(
      log: log == freezed ? this.log : log as List<String>,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result push(@required List<String> log),
    @required Result pop(@required List<String> log),
    @required Result resume(@required List<String> log, @required String salt),
  }) {
    assert(push != null);
    assert(pop != null);
    assert(resume != null);
    return pop(log);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result push(@required List<String> log),
    Result pop(@required List<String> log),
    Result resume(@required List<String> log, @required String salt),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (pop != null) {
      return pop(log);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result push(_PushState value),
    @required Result pop(_PopState value),
    @required Result resume(_ResumeState value),
  }) {
    assert(push != null);
    assert(pop != null);
    assert(resume != null);
    return pop(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result push(_PushState value),
    Result pop(_PopState value),
    Result resume(_ResumeState value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (pop != null) {
      return pop(this);
    }
    return orElse();
  }
}

abstract class _PopState implements RoutingState {
  const factory _PopState({@required List<String> log}) = _$_PopState;

  @override
  List<String> get log;

  @override
  _PopState copyWith({List<String> log});
}

class _$_ResumeState with DiagnosticableTreeMixin implements _ResumeState {
  const _$_ResumeState({@required this.log, @required this.salt})
      : assert(log != null),
        assert(salt != null);

  @override
  final List<String> log;
  @override
  final String salt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RoutingState.resume(log: $log, salt: $salt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RoutingState.resume'))
      ..add(DiagnosticsProperty('log', log))
      ..add(DiagnosticsProperty('salt', salt));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ResumeState &&
            (identical(other.log, log) ||
                const DeepCollectionEquality().equals(other.log, log)) &&
            (identical(other.salt, salt) ||
                const DeepCollectionEquality().equals(other.salt, salt)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(log) ^
      const DeepCollectionEquality().hash(salt);

  @override
  _$_ResumeState copyWith({
    Object log = freezed,
    Object salt = freezed,
  }) {
    return _$_ResumeState(
      log: log == freezed ? this.log : log as List<String>,
      salt: salt == freezed ? this.salt : salt as String,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result push(@required List<String> log),
    @required Result pop(@required List<String> log),
    @required Result resume(@required List<String> log, @required String salt),
  }) {
    assert(push != null);
    assert(pop != null);
    assert(resume != null);
    return resume(log, salt);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result push(@required List<String> log),
    Result pop(@required List<String> log),
    Result resume(@required List<String> log, @required String salt),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (resume != null) {
      return resume(log, salt);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result push(_PushState value),
    @required Result pop(_PopState value),
    @required Result resume(_ResumeState value),
  }) {
    assert(push != null);
    assert(pop != null);
    assert(resume != null);
    return resume(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result push(_PushState value),
    Result pop(_PopState value),
    Result resume(_ResumeState value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (resume != null) {
      return resume(this);
    }
    return orElse();
  }
}

abstract class _ResumeState implements RoutingState {
  const factory _ResumeState(
      {@required List<String> log, @required String salt}) = _$_ResumeState;

  @override
  List<String> get log;
  String get salt;

  @override
  _ResumeState copyWith({List<String> log, String salt});
}
