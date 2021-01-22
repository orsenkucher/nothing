// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
XPIDs _$XPIDsFromJson(Map<String, dynamic> json) {
  return _XPIDs.fromJson(json);
}

/// @nodoc
class _$XPIDsTearOff {
  const _$XPIDsTearOff();

// ignore: unused_element
  _XPIDs call(List<int> ids) {
    return _XPIDs(
      ids,
    );
  }

// ignore: unused_element
  XPIDs fromJson(Map<String, Object> json) {
    return XPIDs.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $XPIDs = _$XPIDsTearOff();

/// @nodoc
mixin _$XPIDs {
  List<int> get ids;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $XPIDsCopyWith<XPIDs> get copyWith;
}

/// @nodoc
abstract class $XPIDsCopyWith<$Res> {
  factory $XPIDsCopyWith(XPIDs value, $Res Function(XPIDs) then) =
      _$XPIDsCopyWithImpl<$Res>;
  $Res call({List<int> ids});
}

/// @nodoc
class _$XPIDsCopyWithImpl<$Res> implements $XPIDsCopyWith<$Res> {
  _$XPIDsCopyWithImpl(this._value, this._then);

  final XPIDs _value;
  // ignore: unused_field
  final $Res Function(XPIDs) _then;

  @override
  $Res call({
    Object ids = freezed,
  }) {
    return _then(_value.copyWith(
      ids: ids == freezed ? _value.ids : ids as List<int>,
    ));
  }
}

/// @nodoc
abstract class _$XPIDsCopyWith<$Res> implements $XPIDsCopyWith<$Res> {
  factory _$XPIDsCopyWith(_XPIDs value, $Res Function(_XPIDs) then) =
      __$XPIDsCopyWithImpl<$Res>;
  @override
  $Res call({List<int> ids});
}

/// @nodoc
class __$XPIDsCopyWithImpl<$Res> extends _$XPIDsCopyWithImpl<$Res>
    implements _$XPIDsCopyWith<$Res> {
  __$XPIDsCopyWithImpl(_XPIDs _value, $Res Function(_XPIDs) _then)
      : super(_value, (v) => _then(v as _XPIDs));

  @override
  _XPIDs get _value => super._value as _XPIDs;

  @override
  $Res call({
    Object ids = freezed,
  }) {
    return _then(_XPIDs(
      ids == freezed ? _value.ids : ids as List<int>,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_XPIDs with DiagnosticableTreeMixin implements _XPIDs {
  const _$_XPIDs(this.ids) : assert(ids != null);

  factory _$_XPIDs.fromJson(Map<String, dynamic> json) =>
      _$_$_XPIDsFromJson(json);

  @override
  final List<int> ids;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'XPIDs(ids: $ids)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'XPIDs'))
      ..add(DiagnosticsProperty('ids', ids));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _XPIDs &&
            (identical(other.ids, ids) ||
                const DeepCollectionEquality().equals(other.ids, ids)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(ids);

  @JsonKey(ignore: true)
  @override
  _$XPIDsCopyWith<_XPIDs> get copyWith =>
      __$XPIDsCopyWithImpl<_XPIDs>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_XPIDsToJson(this);
  }
}

abstract class _XPIDs implements XPIDs {
  const factory _XPIDs(List<int> ids) = _$_XPIDs;

  factory _XPIDs.fromJson(Map<String, dynamic> json) = _$_XPIDs.fromJson;

  @override
  List<int> get ids;
  @override
  @JsonKey(ignore: true)
  _$XPIDsCopyWith<_XPIDs> get copyWith;
}
