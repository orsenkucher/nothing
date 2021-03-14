// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

XPState _$XPStateFromJson(Map<String, dynamic> json) {
  return _XPState.fromJson(json);
}

/// @nodoc
class _$XPStateTearOff {
  const _$XPStateTearOff();

  _XPState call(
      {required int totalxp,
      required int basexp,
      required int bonusxp,
      required int level}) {
    return _XPState(
      totalxp: totalxp,
      basexp: basexp,
      bonusxp: bonusxp,
      level: level,
    );
  }

  XPState fromJson(Map<String, Object> json) {
    return XPState.fromJson(json);
  }
}

/// @nodoc
const $XPState = _$XPStateTearOff();

/// @nodoc
mixin _$XPState {
  int get totalxp => throw _privateConstructorUsedError;
  int get basexp => throw _privateConstructorUsedError;
  int get bonusxp => throw _privateConstructorUsedError;
  int get level => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $XPStateCopyWith<XPState> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $XPStateCopyWith<$Res> {
  factory $XPStateCopyWith(XPState value, $Res Function(XPState) then) =
      _$XPStateCopyWithImpl<$Res>;
  $Res call({int totalxp, int basexp, int bonusxp, int level});
}

/// @nodoc
class _$XPStateCopyWithImpl<$Res> implements $XPStateCopyWith<$Res> {
  _$XPStateCopyWithImpl(this._value, this._then);

  final XPState _value;
  // ignore: unused_field
  final $Res Function(XPState) _then;

  @override
  $Res call({
    Object? totalxp = freezed,
    Object? basexp = freezed,
    Object? bonusxp = freezed,
    Object? level = freezed,
  }) {
    return _then(_value.copyWith(
      totalxp: totalxp == freezed
          ? _value.totalxp
          : totalxp // ignore: cast_nullable_to_non_nullable
              as int,
      basexp: basexp == freezed
          ? _value.basexp
          : basexp // ignore: cast_nullable_to_non_nullable
              as int,
      bonusxp: bonusxp == freezed
          ? _value.bonusxp
          : bonusxp // ignore: cast_nullable_to_non_nullable
              as int,
      level: level == freezed
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$XPStateCopyWith<$Res> implements $XPStateCopyWith<$Res> {
  factory _$XPStateCopyWith(_XPState value, $Res Function(_XPState) then) =
      __$XPStateCopyWithImpl<$Res>;
  @override
  $Res call({int totalxp, int basexp, int bonusxp, int level});
}

/// @nodoc
class __$XPStateCopyWithImpl<$Res> extends _$XPStateCopyWithImpl<$Res>
    implements _$XPStateCopyWith<$Res> {
  __$XPStateCopyWithImpl(_XPState _value, $Res Function(_XPState) _then)
      : super(_value, (v) => _then(v as _XPState));

  @override
  _XPState get _value => super._value as _XPState;

  @override
  $Res call({
    Object? totalxp = freezed,
    Object? basexp = freezed,
    Object? bonusxp = freezed,
    Object? level = freezed,
  }) {
    return _then(_XPState(
      totalxp: totalxp == freezed
          ? _value.totalxp
          : totalxp // ignore: cast_nullable_to_non_nullable
              as int,
      basexp: basexp == freezed
          ? _value.basexp
          : basexp // ignore: cast_nullable_to_non_nullable
              as int,
      bonusxp: bonusxp == freezed
          ? _value.bonusxp
          : bonusxp // ignore: cast_nullable_to_non_nullable
              as int,
      level: level == freezed
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_XPState extends _XPState with DiagnosticableTreeMixin {
  const _$_XPState(
      {required this.totalxp,
      required this.basexp,
      required this.bonusxp,
      required this.level})
      : super._();

  factory _$_XPState.fromJson(Map<String, dynamic> json) =>
      _$_$_XPStateFromJson(json);

  @override
  final int totalxp;
  @override
  final int basexp;
  @override
  final int bonusxp;
  @override
  final int level;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'XPState(totalxp: $totalxp, basexp: $basexp, bonusxp: $bonusxp, level: $level)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'XPState'))
      ..add(DiagnosticsProperty('totalxp', totalxp))
      ..add(DiagnosticsProperty('basexp', basexp))
      ..add(DiagnosticsProperty('bonusxp', bonusxp))
      ..add(DiagnosticsProperty('level', level));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _XPState &&
            (identical(other.totalxp, totalxp) ||
                const DeepCollectionEquality()
                    .equals(other.totalxp, totalxp)) &&
            (identical(other.basexp, basexp) ||
                const DeepCollectionEquality().equals(other.basexp, basexp)) &&
            (identical(other.bonusxp, bonusxp) ||
                const DeepCollectionEquality()
                    .equals(other.bonusxp, bonusxp)) &&
            (identical(other.level, level) ||
                const DeepCollectionEquality().equals(other.level, level)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(totalxp) ^
      const DeepCollectionEquality().hash(basexp) ^
      const DeepCollectionEquality().hash(bonusxp) ^
      const DeepCollectionEquality().hash(level);

  @JsonKey(ignore: true)
  @override
  _$XPStateCopyWith<_XPState> get copyWith =>
      __$XPStateCopyWithImpl<_XPState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_XPStateToJson(this);
  }
}

abstract class _XPState extends XPState {
  const factory _XPState(
      {required int totalxp,
      required int basexp,
      required int bonusxp,
      required int level}) = _$_XPState;
  const _XPState._() : super._();

  factory _XPState.fromJson(Map<String, dynamic> json) = _$_XPState.fromJson;

  @override
  int get totalxp => throw _privateConstructorUsedError;
  @override
  int get basexp => throw _privateConstructorUsedError;
  @override
  int get bonusxp => throw _privateConstructorUsedError;
  @override
  int get level => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$XPStateCopyWith<_XPState> get copyWith =>
      throw _privateConstructorUsedError;
}
