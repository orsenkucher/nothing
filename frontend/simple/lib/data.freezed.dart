// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Data _$DataFromJson(Map<String, dynamic> json) {
  return _Data.fromJson(json);
}

class _$DataTearOff {
  const _$DataTearOff();

  _Data call(String b64) {
    return _Data(
      b64,
    );
  }
}

// ignore: unused_element
const $Data = _$DataTearOff();

mixin _$Data {
  String get b64;

  Map<String, dynamic> toJson();
  $DataCopyWith<Data> get copyWith;
}

abstract class $DataCopyWith<$Res> {
  factory $DataCopyWith(Data value, $Res Function(Data) then) =
      _$DataCopyWithImpl<$Res>;
  $Res call({String b64});
}

class _$DataCopyWithImpl<$Res> implements $DataCopyWith<$Res> {
  _$DataCopyWithImpl(this._value, this._then);

  final Data _value;
  // ignore: unused_field
  final $Res Function(Data) _then;

  @override
  $Res call({
    Object b64 = freezed,
  }) {
    return _then(_value.copyWith(
      b64: b64 == freezed ? _value.b64 : b64 as String,
    ));
  }
}

abstract class _$DataCopyWith<$Res> implements $DataCopyWith<$Res> {
  factory _$DataCopyWith(_Data value, $Res Function(_Data) then) =
      __$DataCopyWithImpl<$Res>;
  @override
  $Res call({String b64});
}

class __$DataCopyWithImpl<$Res> extends _$DataCopyWithImpl<$Res>
    implements _$DataCopyWith<$Res> {
  __$DataCopyWithImpl(_Data _value, $Res Function(_Data) _then)
      : super(_value, (v) => _then(v as _Data));

  @override
  _Data get _value => super._value as _Data;

  @override
  $Res call({
    Object b64 = freezed,
  }) {
    return _then(_Data(
      b64 == freezed ? _value.b64 : b64 as String,
    ));
  }
}

@JsonSerializable()
class _$_Data with DiagnosticableTreeMixin implements _Data {
  _$_Data(this.b64) : assert(b64 != null);

  factory _$_Data.fromJson(Map<String, dynamic> json) =>
      _$_$_DataFromJson(json);

  @override
  final String b64;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Data(b64: $b64)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Data'))
      ..add(DiagnosticsProperty('b64', b64));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Data &&
            (identical(other.b64, b64) ||
                const DeepCollectionEquality().equals(other.b64, b64)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(b64);

  @override
  _$DataCopyWith<_Data> get copyWith =>
      __$DataCopyWithImpl<_Data>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_DataToJson(this);
  }
}

abstract class _Data implements Data {
  factory _Data(String b64) = _$_Data;

  factory _Data.fromJson(Map<String, dynamic> json) = _$_Data.fromJson;

  @override
  String get b64;
  @override
  _$DataCopyWith<_Data> get copyWith;
}

class _$DataEventTearOff {
  const _$DataEventTearOff();

  _DataEvent newDataPlease() {
    return _DataEvent();
  }
}

// ignore: unused_element
const $DataEvent = _$DataEventTearOff();

mixin _$DataEvent {}

abstract class $DataEventCopyWith<$Res> {
  factory $DataEventCopyWith(DataEvent value, $Res Function(DataEvent) then) =
      _$DataEventCopyWithImpl<$Res>;
}

class _$DataEventCopyWithImpl<$Res> implements $DataEventCopyWith<$Res> {
  _$DataEventCopyWithImpl(this._value, this._then);

  final DataEvent _value;
  // ignore: unused_field
  final $Res Function(DataEvent) _then;
}

abstract class _$DataEventCopyWith<$Res> {
  factory _$DataEventCopyWith(
          _DataEvent value, $Res Function(_DataEvent) then) =
      __$DataEventCopyWithImpl<$Res>;
}

class __$DataEventCopyWithImpl<$Res> extends _$DataEventCopyWithImpl<$Res>
    implements _$DataEventCopyWith<$Res> {
  __$DataEventCopyWithImpl(_DataEvent _value, $Res Function(_DataEvent) _then)
      : super(_value, (v) => _then(v as _DataEvent));

  @override
  _DataEvent get _value => super._value as _DataEvent;
}

class _$_DataEvent with DiagnosticableTreeMixin implements _DataEvent {
  _$_DataEvent();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DataEvent.newDataPlease()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'DataEvent.newDataPlease'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _DataEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class _DataEvent implements DataEvent {
  factory _DataEvent() = _$_DataEvent;
}

class _$LogEventTearOff {
  const _$LogEventTearOff();

  _LogData logData(Data data) {
    return _LogData(
      data,
    );
  }

  _LogBlank logBlank() {
    return _LogBlank();
  }
}

// ignore: unused_element
const $LogEvent = _$LogEventTearOff();

mixin _$LogEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result logData(Data data),
    @required Result logBlank(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result logData(Data data),
    Result logBlank(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result logData(_LogData value),
    @required Result logBlank(_LogBlank value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result logData(_LogData value),
    Result logBlank(_LogBlank value),
    @required Result orElse(),
  });
}

abstract class $LogEventCopyWith<$Res> {
  factory $LogEventCopyWith(LogEvent value, $Res Function(LogEvent) then) =
      _$LogEventCopyWithImpl<$Res>;
}

class _$LogEventCopyWithImpl<$Res> implements $LogEventCopyWith<$Res> {
  _$LogEventCopyWithImpl(this._value, this._then);

  final LogEvent _value;
  // ignore: unused_field
  final $Res Function(LogEvent) _then;
}

abstract class _$LogDataCopyWith<$Res> {
  factory _$LogDataCopyWith(_LogData value, $Res Function(_LogData) then) =
      __$LogDataCopyWithImpl<$Res>;
  $Res call({Data data});

  $DataCopyWith<$Res> get data;
}

class __$LogDataCopyWithImpl<$Res> extends _$LogEventCopyWithImpl<$Res>
    implements _$LogDataCopyWith<$Res> {
  __$LogDataCopyWithImpl(_LogData _value, $Res Function(_LogData) _then)
      : super(_value, (v) => _then(v as _LogData));

  @override
  _LogData get _value => super._value as _LogData;

  @override
  $Res call({
    Object data = freezed,
  }) {
    return _then(_LogData(
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

class _$_LogData with DiagnosticableTreeMixin implements _LogData {
  _$_LogData(this.data) : assert(data != null);

  @override
  final Data data;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LogEvent.logData(data: $data)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LogEvent.logData'))
      ..add(DiagnosticsProperty('data', data));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LogData &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(data);

  @override
  _$LogDataCopyWith<_LogData> get copyWith =>
      __$LogDataCopyWithImpl<_LogData>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result logData(Data data),
    @required Result logBlank(),
  }) {
    assert(logData != null);
    assert(logBlank != null);
    return logData(data);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result logData(Data data),
    Result logBlank(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (logData != null) {
      return logData(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result logData(_LogData value),
    @required Result logBlank(_LogBlank value),
  }) {
    assert(logData != null);
    assert(logBlank != null);
    return logData(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result logData(_LogData value),
    Result logBlank(_LogBlank value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (logData != null) {
      return logData(this);
    }
    return orElse();
  }
}

abstract class _LogData implements LogEvent {
  factory _LogData(Data data) = _$_LogData;

  Data get data;
  _$LogDataCopyWith<_LogData> get copyWith;
}

abstract class _$LogBlankCopyWith<$Res> {
  factory _$LogBlankCopyWith(_LogBlank value, $Res Function(_LogBlank) then) =
      __$LogBlankCopyWithImpl<$Res>;
}

class __$LogBlankCopyWithImpl<$Res> extends _$LogEventCopyWithImpl<$Res>
    implements _$LogBlankCopyWith<$Res> {
  __$LogBlankCopyWithImpl(_LogBlank _value, $Res Function(_LogBlank) _then)
      : super(_value, (v) => _then(v as _LogBlank));

  @override
  _LogBlank get _value => super._value as _LogBlank;
}

class _$_LogBlank with DiagnosticableTreeMixin implements _LogBlank {
  _$_LogBlank();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LogEvent.logBlank()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'LogEvent.logBlank'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _LogBlank);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result logData(Data data),
    @required Result logBlank(),
  }) {
    assert(logData != null);
    assert(logBlank != null);
    return logBlank();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result logData(Data data),
    Result logBlank(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (logBlank != null) {
      return logBlank();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result logData(_LogData value),
    @required Result logBlank(_LogBlank value),
  }) {
    assert(logData != null);
    assert(logBlank != null);
    return logBlank(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result logData(_LogData value),
    Result logBlank(_LogBlank value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (logBlank != null) {
      return logBlank(this);
    }
    return orElse();
  }
}

abstract class _LogBlank implements LogEvent {
  factory _LogBlank() = _$_LogBlank;
}
