// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$ComputeEventTearOff {
  const _$ComputeEventTearOff();

  OnNew onNew(Data data) {
    return OnNew(
      data,
    );
  }
}

// ignore: unused_element
const $ComputeEvent = _$ComputeEventTearOff();

mixin _$ComputeEvent {
  Data get data;

  $ComputeEventCopyWith<ComputeEvent> get copyWith;
}

abstract class $ComputeEventCopyWith<$Res> {
  factory $ComputeEventCopyWith(
          ComputeEvent value, $Res Function(ComputeEvent) then) =
      _$ComputeEventCopyWithImpl<$Res>;
  $Res call({Data data});

  $DataCopyWith<$Res> get data;
}

class _$ComputeEventCopyWithImpl<$Res> implements $ComputeEventCopyWith<$Res> {
  _$ComputeEventCopyWithImpl(this._value, this._then);

  final ComputeEvent _value;
  // ignore: unused_field
  final $Res Function(ComputeEvent) _then;

  @override
  $Res call({
    Object data = freezed,
  }) {
    return _then(_value.copyWith(
      data: data == freezed ? _value.data : data as Data,
    ));
  }

  @override
  $DataCopyWith<$Res> get data {
    if (_value.data == null) {
      return null;
    }
    return $DataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value));
    });
  }
}

abstract class $OnNewCopyWith<$Res> implements $ComputeEventCopyWith<$Res> {
  factory $OnNewCopyWith(OnNew value, $Res Function(OnNew) then) =
      _$OnNewCopyWithImpl<$Res>;
  @override
  $Res call({Data data});

  @override
  $DataCopyWith<$Res> get data;
}

class _$OnNewCopyWithImpl<$Res> extends _$ComputeEventCopyWithImpl<$Res>
    implements $OnNewCopyWith<$Res> {
  _$OnNewCopyWithImpl(OnNew _value, $Res Function(OnNew) _then)
      : super(_value, (v) => _then(v as OnNew));

  @override
  OnNew get _value => super._value as OnNew;

  @override
  $Res call({
    Object data = freezed,
  }) {
    return _then(OnNew(
      data == freezed ? _value.data : data as Data,
    ));
  }
}

class _$OnNew with DiagnosticableTreeMixin implements OnNew {
  _$OnNew(this.data) : assert(data != null);

  @override
  final Data data;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ComputeEvent.onNew(data: $data)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ComputeEvent.onNew'))
      ..add(DiagnosticsProperty('data', data));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is OnNew &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(data);

  @override
  $OnNewCopyWith<OnNew> get copyWith =>
      _$OnNewCopyWithImpl<OnNew>(this, _$identity);
}

abstract class OnNew implements ComputeEvent {
  factory OnNew(Data data) = _$OnNew;

  @override
  Data get data;
  @override
  $OnNewCopyWith<OnNew> get copyWith;
}

ComputeState _$ComputeStateFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType'] as String) {
    case 'available':
      return Available.fromJson(json);
    case 'empty':
      return Empty.fromJson(json);

    default:
      throw FallThroughError();
  }
}

class _$ComputeStateTearOff {
  const _$ComputeStateTearOff();

  Available available(Data data) {
    return Available(
      data,
    );
  }

  Empty empty() {
    return Empty();
  }
}

// ignore: unused_element
const $ComputeState = _$ComputeStateTearOff();

mixin _$ComputeState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result available(Data data),
    @required Result empty(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result available(Data data),
    Result empty(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result available(Available value),
    @required Result empty(Empty value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result available(Available value),
    Result empty(Empty value),
    @required Result orElse(),
  });
  Map<String, dynamic> toJson();
}

abstract class $ComputeStateCopyWith<$Res> {
  factory $ComputeStateCopyWith(
          ComputeState value, $Res Function(ComputeState) then) =
      _$ComputeStateCopyWithImpl<$Res>;
}

class _$ComputeStateCopyWithImpl<$Res> implements $ComputeStateCopyWith<$Res> {
  _$ComputeStateCopyWithImpl(this._value, this._then);

  final ComputeState _value;
  // ignore: unused_field
  final $Res Function(ComputeState) _then;
}

abstract class $AvailableCopyWith<$Res> {
  factory $AvailableCopyWith(Available value, $Res Function(Available) then) =
      _$AvailableCopyWithImpl<$Res>;
  $Res call({Data data});

  $DataCopyWith<$Res> get data;
}

class _$AvailableCopyWithImpl<$Res> extends _$ComputeStateCopyWithImpl<$Res>
    implements $AvailableCopyWith<$Res> {
  _$AvailableCopyWithImpl(Available _value, $Res Function(Available) _then)
      : super(_value, (v) => _then(v as Available));

  @override
  Available get _value => super._value as Available;

  @override
  $Res call({
    Object data = freezed,
  }) {
    return _then(Available(
      data == freezed ? _value.data : data as Data,
    ));
  }

  @override
  $DataCopyWith<$Res> get data {
    if (_value.data == null) {
      return null;
    }
    return $DataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value));
    });
  }
}

@JsonSerializable()
class _$Available with DiagnosticableTreeMixin implements Available {
  _$Available(this.data) : assert(data != null);

  factory _$Available.fromJson(Map<String, dynamic> json) =>
      _$_$AvailableFromJson(json);

  @override
  final Data data;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ComputeState.available(data: $data)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ComputeState.available'))
      ..add(DiagnosticsProperty('data', data));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Available &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(data);

  @override
  $AvailableCopyWith<Available> get copyWith =>
      _$AvailableCopyWithImpl<Available>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result available(Data data),
    @required Result empty(),
  }) {
    assert(available != null);
    assert(empty != null);
    return available(data);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result available(Data data),
    Result empty(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (available != null) {
      return available(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result available(Available value),
    @required Result empty(Empty value),
  }) {
    assert(available != null);
    assert(empty != null);
    return available(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result available(Available value),
    Result empty(Empty value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (available != null) {
      return available(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$AvailableToJson(this)..['runtimeType'] = 'available';
  }
}

abstract class Available implements ComputeState {
  factory Available(Data data) = _$Available;

  factory Available.fromJson(Map<String, dynamic> json) = _$Available.fromJson;

  Data get data;
  $AvailableCopyWith<Available> get copyWith;
}

abstract class $EmptyCopyWith<$Res> {
  factory $EmptyCopyWith(Empty value, $Res Function(Empty) then) =
      _$EmptyCopyWithImpl<$Res>;
}

class _$EmptyCopyWithImpl<$Res> extends _$ComputeStateCopyWithImpl<$Res>
    implements $EmptyCopyWith<$Res> {
  _$EmptyCopyWithImpl(Empty _value, $Res Function(Empty) _then)
      : super(_value, (v) => _then(v as Empty));

  @override
  Empty get _value => super._value as Empty;
}

@JsonSerializable()
class _$Empty with DiagnosticableTreeMixin implements Empty {
  _$Empty();

  factory _$Empty.fromJson(Map<String, dynamic> json) =>
      _$_$EmptyFromJson(json);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ComputeState.empty()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'ComputeState.empty'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Empty);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result available(Data data),
    @required Result empty(),
  }) {
    assert(available != null);
    assert(empty != null);
    return empty();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result available(Data data),
    Result empty(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (empty != null) {
      return empty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result available(Available value),
    @required Result empty(Empty value),
  }) {
    assert(available != null);
    assert(empty != null);
    return empty(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result available(Available value),
    Result empty(Empty value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$EmptyToJson(this)..['runtimeType'] = 'empty';
  }
}

abstract class Empty implements ComputeState {
  factory Empty() = _$Empty;

  factory Empty.fromJson(Map<String, dynamic> json) = _$Empty.fromJson;
}
