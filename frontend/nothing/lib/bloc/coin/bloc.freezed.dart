// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
CoinState _$CoinStateFromJson(Map<String, dynamic> json) {
  return _CoinState.fromJson(json);
}

class _$CoinStateTearOff {
  const _$CoinStateTearOff();

// ignore: unused_element
  _CoinState call(int total) {
    return _CoinState(
      total,
    );
  }
}

// ignore: unused_element
const $CoinState = _$CoinStateTearOff();

mixin _$CoinState {
  int get total;

  Map<String, dynamic> toJson();
  $CoinStateCopyWith<CoinState> get copyWith;
}

abstract class $CoinStateCopyWith<$Res> {
  factory $CoinStateCopyWith(CoinState value, $Res Function(CoinState) then) =
      _$CoinStateCopyWithImpl<$Res>;
  $Res call({int total});
}

class _$CoinStateCopyWithImpl<$Res> implements $CoinStateCopyWith<$Res> {
  _$CoinStateCopyWithImpl(this._value, this._then);

  final CoinState _value;
  // ignore: unused_field
  final $Res Function(CoinState) _then;

  @override
  $Res call({
    Object total = freezed,
  }) {
    return _then(_value.copyWith(
      total: total == freezed ? _value.total : total as int,
    ));
  }
}

abstract class _$CoinStateCopyWith<$Res> implements $CoinStateCopyWith<$Res> {
  factory _$CoinStateCopyWith(
          _CoinState value, $Res Function(_CoinState) then) =
      __$CoinStateCopyWithImpl<$Res>;
  @override
  $Res call({int total});
}

class __$CoinStateCopyWithImpl<$Res> extends _$CoinStateCopyWithImpl<$Res>
    implements _$CoinStateCopyWith<$Res> {
  __$CoinStateCopyWithImpl(_CoinState _value, $Res Function(_CoinState) _then)
      : super(_value, (v) => _then(v as _CoinState));

  @override
  _CoinState get _value => super._value as _CoinState;

  @override
  $Res call({
    Object total = freezed,
  }) {
    return _then(_CoinState(
      total == freezed ? _value.total : total as int,
    ));
  }
}

@JsonSerializable()
class _$_CoinState with DiagnosticableTreeMixin implements _CoinState {
  const _$_CoinState(this.total) : assert(total != null);

  factory _$_CoinState.fromJson(Map<String, dynamic> json) =>
      _$_$_CoinStateFromJson(json);

  @override
  final int total;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CoinState(total: $total)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CoinState'))
      ..add(DiagnosticsProperty('total', total));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CoinState &&
            (identical(other.total, total) ||
                const DeepCollectionEquality().equals(other.total, total)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(total);

  @override
  _$CoinStateCopyWith<_CoinState> get copyWith =>
      __$CoinStateCopyWithImpl<_CoinState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_CoinStateToJson(this);
  }
}

abstract class _CoinState implements CoinState {
  const factory _CoinState(int total) = _$_CoinState;

  factory _CoinState.fromJson(Map<String, dynamic> json) =
      _$_CoinState.fromJson;

  @override
  int get total;
  @override
  _$CoinStateCopyWith<_CoinState> get copyWith;
}
