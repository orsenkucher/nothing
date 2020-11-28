// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$IdEventTearOff {
  const _$IdEventTearOff();

// ignore: unused_element
  _RevokeID revoke() {
    return const _RevokeID();
  }
}

/// @nodoc
// ignore: unused_element
const $IdEvent = _$IdEventTearOff();

/// @nodoc
mixin _$IdEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult revoke(),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult revoke(),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult revoke(_RevokeID value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult revoke(_RevokeID value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $IdEventCopyWith<$Res> {
  factory $IdEventCopyWith(IdEvent value, $Res Function(IdEvent) then) =
      _$IdEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$IdEventCopyWithImpl<$Res> implements $IdEventCopyWith<$Res> {
  _$IdEventCopyWithImpl(this._value, this._then);

  final IdEvent _value;
  // ignore: unused_field
  final $Res Function(IdEvent) _then;
}

/// @nodoc
abstract class _$RevokeIDCopyWith<$Res> {
  factory _$RevokeIDCopyWith(_RevokeID value, $Res Function(_RevokeID) then) =
      __$RevokeIDCopyWithImpl<$Res>;
}

/// @nodoc
class __$RevokeIDCopyWithImpl<$Res> extends _$IdEventCopyWithImpl<$Res>
    implements _$RevokeIDCopyWith<$Res> {
  __$RevokeIDCopyWithImpl(_RevokeID _value, $Res Function(_RevokeID) _then)
      : super(_value, (v) => _then(v as _RevokeID));

  @override
  _RevokeID get _value => super._value as _RevokeID;
}

/// @nodoc
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
  TResult when<TResult extends Object>({
    @required TResult revoke(),
  }) {
    assert(revoke != null);
    return revoke();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult revoke(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (revoke != null) {
      return revoke();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult revoke(_RevokeID value),
  }) {
    assert(revoke != null);
    return revoke(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult revoke(_RevokeID value),
    @required TResult orElse(),
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

IdState _$IdStateFromJson(Map<String, dynamic> json) {
  return _IdState.fromJson(json);
}

/// @nodoc
class _$IdStateTearOff {
  const _$IdStateTearOff();

// ignore: unused_element
  _IdState call(String id) {
    return _IdState(
      id,
    );
  }

// ignore: unused_element
  IdState fromJson(Map<String, Object> json) {
    return IdState.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $IdState = _$IdStateTearOff();

/// @nodoc
mixin _$IdState {
  String get id;

  Map<String, dynamic> toJson();
  $IdStateCopyWith<IdState> get copyWith;
}

/// @nodoc
abstract class $IdStateCopyWith<$Res> {
  factory $IdStateCopyWith(IdState value, $Res Function(IdState) then) =
      _$IdStateCopyWithImpl<$Res>;
  $Res call({String id});
}

/// @nodoc
class _$IdStateCopyWithImpl<$Res> implements $IdStateCopyWith<$Res> {
  _$IdStateCopyWithImpl(this._value, this._then);

  final IdState _value;
  // ignore: unused_field
  final $Res Function(IdState) _then;

  @override
  $Res call({
    Object id = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
    ));
  }
}

/// @nodoc
abstract class _$IdStateCopyWith<$Res> implements $IdStateCopyWith<$Res> {
  factory _$IdStateCopyWith(_IdState value, $Res Function(_IdState) then) =
      __$IdStateCopyWithImpl<$Res>;
  @override
  $Res call({String id});
}

/// @nodoc
class __$IdStateCopyWithImpl<$Res> extends _$IdStateCopyWithImpl<$Res>
    implements _$IdStateCopyWith<$Res> {
  __$IdStateCopyWithImpl(_IdState _value, $Res Function(_IdState) _then)
      : super(_value, (v) => _then(v as _IdState));

  @override
  _IdState get _value => super._value as _IdState;

  @override
  $Res call({
    Object id = freezed,
  }) {
    return _then(_IdState(
      id == freezed ? _value.id : id as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_IdState with DiagnosticableTreeMixin implements _IdState {
  const _$_IdState(this.id) : assert(id != null);

  factory _$_IdState.fromJson(Map<String, dynamic> json) =>
      _$_$_IdStateFromJson(json);

  @override
  final String id;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'IdState(id: $id)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'IdState'))
      ..add(DiagnosticsProperty('id', id));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _IdState &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(id);

  @override
  _$IdStateCopyWith<_IdState> get copyWith =>
      __$IdStateCopyWithImpl<_IdState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_IdStateToJson(this);
  }
}

abstract class _IdState implements IdState {
  const factory _IdState(String id) = _$_IdState;

  factory _IdState.fromJson(Map<String, dynamic> json) = _$_IdState.fromJson;

  @override
  String get id;
  @override
  _$IdStateCopyWith<_IdState> get copyWith;
}
