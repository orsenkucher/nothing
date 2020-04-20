// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$IdEventTearOff {
  const _$IdEventTearOff();

  _RevokeID revoke() {
    return const _RevokeID();
  }

  _IssueID issue(IdState state) {
    return _IssueID(
      state,
    );
  }
}

// ignore: unused_element
const $IdEvent = _$IdEventTearOff();

mixin _$IdEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result revoke(),
    @required Result issue(IdState state),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result revoke(),
    Result issue(IdState state),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result revoke(_RevokeID value),
    @required Result issue(_IssueID value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result revoke(_RevokeID value),
    Result issue(_IssueID value),
    @required Result orElse(),
  });
}

abstract class $IdEventCopyWith<$Res> {
  factory $IdEventCopyWith(IdEvent value, $Res Function(IdEvent) then) =
      _$IdEventCopyWithImpl<$Res>;
}

class _$IdEventCopyWithImpl<$Res> implements $IdEventCopyWith<$Res> {
  _$IdEventCopyWithImpl(this._value, this._then);

  final IdEvent _value;
  // ignore: unused_field
  final $Res Function(IdEvent) _then;
}

abstract class _$RevokeIDCopyWith<$Res> {
  factory _$RevokeIDCopyWith(_RevokeID value, $Res Function(_RevokeID) then) =
      __$RevokeIDCopyWithImpl<$Res>;
}

class __$RevokeIDCopyWithImpl<$Res> extends _$IdEventCopyWithImpl<$Res>
    implements _$RevokeIDCopyWith<$Res> {
  __$RevokeIDCopyWithImpl(_RevokeID _value, $Res Function(_RevokeID) _then)
      : super(_value, (v) => _then(v as _RevokeID));

  @override
  _RevokeID get _value => super._value as _RevokeID;
}

class _$_RevokeID with DiagnosticableTreeMixin implements _RevokeID {
  const _$_RevokeID();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'IdEvent.revoke()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'IdEvent.revoke'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _RevokeID);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result revoke(),
    @required Result issue(IdState state),
  }) {
    assert(revoke != null);
    assert(issue != null);
    return revoke();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result revoke(),
    Result issue(IdState state),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (revoke != null) {
      return revoke();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result revoke(_RevokeID value),
    @required Result issue(_IssueID value),
  }) {
    assert(revoke != null);
    assert(issue != null);
    return revoke(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result revoke(_RevokeID value),
    Result issue(_IssueID value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (revoke != null) {
      return revoke(this);
    }
    return orElse();
  }
}

abstract class _RevokeID implements IdEvent {
  const factory _RevokeID() = _$_RevokeID;
}

abstract class _$IssueIDCopyWith<$Res> {
  factory _$IssueIDCopyWith(_IssueID value, $Res Function(_IssueID) then) =
      __$IssueIDCopyWithImpl<$Res>;
  $Res call({IdState state});

  $IdStateCopyWith<$Res> get state;
}

class __$IssueIDCopyWithImpl<$Res> extends _$IdEventCopyWithImpl<$Res>
    implements _$IssueIDCopyWith<$Res> {
  __$IssueIDCopyWithImpl(_IssueID _value, $Res Function(_IssueID) _then)
      : super(_value, (v) => _then(v as _IssueID));

  @override
  _IssueID get _value => super._value as _IssueID;

  @override
  $Res call({
    Object state = freezed,
  }) {
    return _then(_IssueID(
      state == freezed ? _value.state : state as IdState,
    ));
  }

  @override
  $IdStateCopyWith<$Res> get state {
    if (_value.state == null) {
      return null;
    }
    return $IdStateCopyWith<$Res>(_value.state, (value) {
      return _then(_value.copyWith(state: value));
    });
  }
}

class _$_IssueID with DiagnosticableTreeMixin implements _IssueID {
  const _$_IssueID(this.state) : assert(state != null);

  @override
  final IdState state;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'IdEvent.issue(state: $state)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'IdEvent.issue'))
      ..add(DiagnosticsProperty('state', state));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _IssueID &&
            (identical(other.state, state) ||
                const DeepCollectionEquality().equals(other.state, state)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(state);

  @override
  _$IssueIDCopyWith<_IssueID> get copyWith =>
      __$IssueIDCopyWithImpl<_IssueID>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result revoke(),
    @required Result issue(IdState state),
  }) {
    assert(revoke != null);
    assert(issue != null);
    return issue(state);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result revoke(),
    Result issue(IdState state),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (issue != null) {
      return issue(state);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result revoke(_RevokeID value),
    @required Result issue(_IssueID value),
  }) {
    assert(revoke != null);
    assert(issue != null);
    return issue(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result revoke(_RevokeID value),
    Result issue(_IssueID value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (issue != null) {
      return issue(this);
    }
    return orElse();
  }
}

abstract class _IssueID implements IdEvent {
  const factory _IssueID(IdState state) = _$_IssueID;

  IdState get state;
  _$IssueIDCopyWith<_IssueID> get copyWith;
}
