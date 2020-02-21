// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package

part of 'state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

IdState _$IdStateFromJson(Map<String, dynamic> json) {
  return _IdState.fromJson(json);
}

mixin _$IdState {
  String get id;
  String get salt;

  IdState copyWith({String id, String salt});

  Map<String, dynamic> toJson();
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
  int get hashCode => runtimeType.hashCode ^ id.hashCode ^ salt.hashCode;

  @override
  _$_IdState copyWith({
    Object id = freezed,
    Object salt = freezed,
  }) {
    assert(id != null);
    assert(salt != null);
    return _$_IdState(
      id == freezed ? this.id : id as String,
      salt == freezed ? this.salt : salt as String,
    );
  }

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
  _IdState copyWith({String id, String salt});
}
