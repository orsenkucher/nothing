// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
IdState _$IdStateFromJson(Map<String, dynamic> json) {
  return _IdState.fromJson(json);
}

class _$IdStateTearOff {
  const _$IdStateTearOff();

  _IdState _(String id, String salt) {
    return _IdState(
      id,
      salt,
    );
  }
}

// ignore: unused_element
const $IdState = _$IdStateTearOff();

mixin _$IdState {
  String get id;
  String get salt;

  Map<String, dynamic> toJson();
  $IdStateCopyWith<IdState> get copyWith;
}

abstract class $IdStateCopyWith<$Res> {
  factory $IdStateCopyWith(IdState value, $Res Function(IdState) then) =
      _$IdStateCopyWithImpl<$Res>;
  $Res call({String id, String salt});
}

class _$IdStateCopyWithImpl<$Res> implements $IdStateCopyWith<$Res> {
  _$IdStateCopyWithImpl(this._value, this._then);

  final IdState _value;
  // ignore: unused_field
  final $Res Function(IdState) _then;

  @override
  $Res call({
    Object id = freezed,
    Object salt = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      salt: salt == freezed ? _value.salt : salt as String,
    ));
  }
}

abstract class _$IdStateCopyWith<$Res> implements $IdStateCopyWith<$Res> {
  factory _$IdStateCopyWith(_IdState value, $Res Function(_IdState) then) =
      __$IdStateCopyWithImpl<$Res>;
  @override
  $Res call({String id, String salt});
}

class __$IdStateCopyWithImpl<$Res> extends _$IdStateCopyWithImpl<$Res>
    implements _$IdStateCopyWith<$Res> {
  __$IdStateCopyWithImpl(_IdState _value, $Res Function(_IdState) _then)
      : super(_value, (v) => _then(v as _IdState));

  @override
  _IdState get _value => super._value as _IdState;

  @override
  $Res call({
    Object id = freezed,
    Object salt = freezed,
  }) {
    return _then(_IdState(
      id == freezed ? _value.id : id as String,
      salt == freezed ? _value.salt : salt as String,
    ));
  }
}

@JsonSerializable()
class _$_IdState with DiagnosticableTreeMixin implements _IdState {
  const _$_IdState(this.id, this.salt)
      : assert(id != null),
        assert(salt != null);

  factory _$_IdState.fromJson(Map<String, dynamic> json) =>
      _$_$_IdStateFromJson(json);

  @override
  final String id;
  @override
  final String salt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'IdState._(id: $id, salt: $salt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'IdState._'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('salt', salt));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _IdState &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.salt, salt) ||
                const DeepCollectionEquality().equals(other.salt, salt)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(salt);

  @override
  _$IdStateCopyWith<_IdState> get copyWith =>
      __$IdStateCopyWithImpl<_IdState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_IdStateToJson(this);
  }
}

abstract class _IdState implements IdState {
  const factory _IdState(String id, String salt) = _$_IdState;

  factory _IdState.fromJson(Map<String, dynamic> json) = _$_IdState.fromJson;

  @override
  String get id;
  @override
  String get salt;
  @override
  _$IdStateCopyWith<_IdState> get copyWith;
}
