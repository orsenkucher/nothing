// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$CoinEventTearOff {
  const _$CoinEventTearOff();

  _Increase inc(int count) {
    return _Increase(
      count,
    );
  }

  _Decrease dec(int count) {
    return _Decrease(
      count,
    );
  }
}

// ignore: unused_element
const $CoinEvent = _$CoinEventTearOff();

mixin _$CoinEvent {
  int get count;

  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result inc(int count),
    @required Result dec(int count),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result inc(int count),
    Result dec(int count),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result inc(_Increase value),
    @required Result dec(_Decrease value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result inc(_Increase value),
    Result dec(_Decrease value),
    @required Result orElse(),
  });

  $CoinEventCopyWith<CoinEvent> get copyWith;
}

abstract class $CoinEventCopyWith<$Res> {
  factory $CoinEventCopyWith(CoinEvent value, $Res Function(CoinEvent) then) =
      _$CoinEventCopyWithImpl<$Res>;
  $Res call({int count});
}

class _$CoinEventCopyWithImpl<$Res> implements $CoinEventCopyWith<$Res> {
  _$CoinEventCopyWithImpl(this._value, this._then);

  final CoinEvent _value;
  // ignore: unused_field
  final $Res Function(CoinEvent) _then;

  @override
  $Res call({
    Object count = freezed,
  }) {
    return _then(_value.copyWith(
      count: count == freezed ? _value.count : count as int,
    ));
  }
}

abstract class _$IncreaseCopyWith<$Res> implements $CoinEventCopyWith<$Res> {
  factory _$IncreaseCopyWith(_Increase value, $Res Function(_Increase) then) =
      __$IncreaseCopyWithImpl<$Res>;
  @override
  $Res call({int count});
}

class __$IncreaseCopyWithImpl<$Res> extends _$CoinEventCopyWithImpl<$Res>
    implements _$IncreaseCopyWith<$Res> {
  __$IncreaseCopyWithImpl(_Increase _value, $Res Function(_Increase) _then)
      : super(_value, (v) => _then(v as _Increase));

  @override
  _Increase get _value => super._value as _Increase;

  @override
  $Res call({
    Object count = freezed,
  }) {
    return _then(_Increase(
      count == freezed ? _value.count : count as int,
    ));
  }
}

class _$_Increase with DiagnosticableTreeMixin implements _Increase {
  const _$_Increase(this.count) : assert(count != null);

  @override
  final int count;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CoinEvent.inc(count: $count)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CoinEvent.inc'))
      ..add(DiagnosticsProperty('count', count));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Increase &&
            (identical(other.count, count) ||
                const DeepCollectionEquality().equals(other.count, count)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(count);

  @override
  _$IncreaseCopyWith<_Increase> get copyWith =>
      __$IncreaseCopyWithImpl<_Increase>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result inc(int count),
    @required Result dec(int count),
  }) {
    assert(inc != null);
    assert(dec != null);
    return inc(count);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result inc(int count),
    Result dec(int count),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (inc != null) {
      return inc(count);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result inc(_Increase value),
    @required Result dec(_Decrease value),
  }) {
    assert(inc != null);
    assert(dec != null);
    return inc(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result inc(_Increase value),
    Result dec(_Decrease value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (inc != null) {
      return inc(this);
    }
    return orElse();
  }
}

abstract class _Increase implements CoinEvent {
  const factory _Increase(int count) = _$_Increase;

  @override
  int get count;
  @override
  _$IncreaseCopyWith<_Increase> get copyWith;
}

abstract class _$DecreaseCopyWith<$Res> implements $CoinEventCopyWith<$Res> {
  factory _$DecreaseCopyWith(_Decrease value, $Res Function(_Decrease) then) =
      __$DecreaseCopyWithImpl<$Res>;
  @override
  $Res call({int count});
}

class __$DecreaseCopyWithImpl<$Res> extends _$CoinEventCopyWithImpl<$Res>
    implements _$DecreaseCopyWith<$Res> {
  __$DecreaseCopyWithImpl(_Decrease _value, $Res Function(_Decrease) _then)
      : super(_value, (v) => _then(v as _Decrease));

  @override
  _Decrease get _value => super._value as _Decrease;

  @override
  $Res call({
    Object count = freezed,
  }) {
    return _then(_Decrease(
      count == freezed ? _value.count : count as int,
    ));
  }
}

class _$_Decrease with DiagnosticableTreeMixin implements _Decrease {
  const _$_Decrease(this.count) : assert(count != null);

  @override
  final int count;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CoinEvent.dec(count: $count)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CoinEvent.dec'))
      ..add(DiagnosticsProperty('count', count));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Decrease &&
            (identical(other.count, count) ||
                const DeepCollectionEquality().equals(other.count, count)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(count);

  @override
  _$DecreaseCopyWith<_Decrease> get copyWith =>
      __$DecreaseCopyWithImpl<_Decrease>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result inc(int count),
    @required Result dec(int count),
  }) {
    assert(inc != null);
    assert(dec != null);
    return dec(count);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result inc(int count),
    Result dec(int count),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (dec != null) {
      return dec(count);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result inc(_Increase value),
    @required Result dec(_Decrease value),
  }) {
    assert(inc != null);
    assert(dec != null);
    return dec(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result inc(_Increase value),
    Result dec(_Decrease value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (dec != null) {
      return dec(this);
    }
    return orElse();
  }
}

abstract class _Decrease implements CoinEvent {
  const factory _Decrease(int count) = _$_Decrease;

  @override
  int get count;
  @override
  _$DecreaseCopyWith<_Decrease> get copyWith;
}

CoinState _$CoinStateFromJson(Map<String, dynamic> json) {
  return _CoinState.fromJson(json);
}

class _$CoinStateTearOff {
  const _$CoinStateTearOff();

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
