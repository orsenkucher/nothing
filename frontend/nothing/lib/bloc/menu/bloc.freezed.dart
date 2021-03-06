// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
MenuState _$MenuStateFromJson(Map<String, dynamic> json) {
  return _MenuState.fromJson(json);
}

/// @nodoc
class _$MenuStateTearOff {
  const _$MenuStateTearOff();

// ignore: unused_element
  _MenuState call(bool vibration) {
    return _MenuState(
      vibration,
    );
  }

// ignore: unused_element
  MenuState fromJson(Map<String, Object> json) {
    return MenuState.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $MenuState = _$MenuStateTearOff();

/// @nodoc
mixin _$MenuState {
  bool get vibration;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $MenuStateCopyWith<MenuState> get copyWith;
}

/// @nodoc
abstract class $MenuStateCopyWith<$Res> {
  factory $MenuStateCopyWith(MenuState value, $Res Function(MenuState) then) =
      _$MenuStateCopyWithImpl<$Res>;
  $Res call({bool vibration});
}

/// @nodoc
class _$MenuStateCopyWithImpl<$Res> implements $MenuStateCopyWith<$Res> {
  _$MenuStateCopyWithImpl(this._value, this._then);

  final MenuState _value;
  // ignore: unused_field
  final $Res Function(MenuState) _then;

  @override
  $Res call({
    Object vibration = freezed,
  }) {
    return _then(_value.copyWith(
      vibration: vibration == freezed ? _value.vibration : vibration as bool,
    ));
  }
}

/// @nodoc
abstract class _$MenuStateCopyWith<$Res> implements $MenuStateCopyWith<$Res> {
  factory _$MenuStateCopyWith(
          _MenuState value, $Res Function(_MenuState) then) =
      __$MenuStateCopyWithImpl<$Res>;
  @override
  $Res call({bool vibration});
}

/// @nodoc
class __$MenuStateCopyWithImpl<$Res> extends _$MenuStateCopyWithImpl<$Res>
    implements _$MenuStateCopyWith<$Res> {
  __$MenuStateCopyWithImpl(_MenuState _value, $Res Function(_MenuState) _then)
      : super(_value, (v) => _then(v as _MenuState));

  @override
  _MenuState get _value => super._value as _MenuState;

  @override
  $Res call({
    Object vibration = freezed,
  }) {
    return _then(_MenuState(
      vibration == freezed ? _value.vibration : vibration as bool,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_MenuState with DiagnosticableTreeMixin implements _MenuState {
  const _$_MenuState(this.vibration) : assert(vibration != null);

  factory _$_MenuState.fromJson(Map<String, dynamic> json) =>
      _$_$_MenuStateFromJson(json);

  @override
  final bool vibration;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MenuState(vibration: $vibration)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MenuState'))
      ..add(DiagnosticsProperty('vibration', vibration));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _MenuState &&
            (identical(other.vibration, vibration) ||
                const DeepCollectionEquality()
                    .equals(other.vibration, vibration)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(vibration);

  @JsonKey(ignore: true)
  @override
  _$MenuStateCopyWith<_MenuState> get copyWith =>
      __$MenuStateCopyWithImpl<_MenuState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_MenuStateToJson(this);
  }
}

abstract class _MenuState implements MenuState {
  const factory _MenuState(bool vibration) = _$_MenuState;

  factory _MenuState.fromJson(Map<String, dynamic> json) =
      _$_MenuState.fromJson;

  @override
  bool get vibration;
  @override
  @JsonKey(ignore: true)
  _$MenuStateCopyWith<_MenuState> get copyWith;
}
