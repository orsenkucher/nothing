// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'test.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$TestEventTearOff {
  const _$TestEventTearOff();

  _Name name(String name) {
    return _Name(
      name,
    );
  }
}

// ignore: unused_element
const $TestEvent = _$TestEventTearOff();

mixin _$TestEvent {
  String get name;

  $TestEventCopyWith<TestEvent> get copyWith;
}

abstract class $TestEventCopyWith<$Res> {
  factory $TestEventCopyWith(TestEvent value, $Res Function(TestEvent) then) =
      _$TestEventCopyWithImpl<$Res>;
  $Res call({String name});
}

class _$TestEventCopyWithImpl<$Res> implements $TestEventCopyWith<$Res> {
  _$TestEventCopyWithImpl(this._value, this._then);

  final TestEvent _value;
  // ignore: unused_field
  final $Res Function(TestEvent) _then;

  @override
  $Res call({
    Object name = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed ? _value.name : name as String,
    ));
  }
}

abstract class _$NameCopyWith<$Res> implements $TestEventCopyWith<$Res> {
  factory _$NameCopyWith(_Name value, $Res Function(_Name) then) =
      __$NameCopyWithImpl<$Res>;
  @override
  $Res call({String name});
}

class __$NameCopyWithImpl<$Res> extends _$TestEventCopyWithImpl<$Res>
    implements _$NameCopyWith<$Res> {
  __$NameCopyWithImpl(_Name _value, $Res Function(_Name) _then)
      : super(_value, (v) => _then(v as _Name));

  @override
  _Name get _value => super._value as _Name;

  @override
  $Res call({
    Object name = freezed,
  }) {
    return _then(_Name(
      name == freezed ? _value.name : name as String,
    ));
  }
}

class _$_Name with DiagnosticableTreeMixin implements _Name {
  const _$_Name(this.name) : assert(name != null);

  @override
  final String name;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TestEvent.name(name: $name)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TestEvent.name'))
      ..add(DiagnosticsProperty('name', name));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Name &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(name);

  @override
  _$NameCopyWith<_Name> get copyWith =>
      __$NameCopyWithImpl<_Name>(this, _$identity);
}

abstract class _Name implements TestEvent {
  const factory _Name(String name) = _$_Name;

  @override
  String get name;
  @override
  _$NameCopyWith<_Name> get copyWith;
}

TestState _$TestStateFromJson(Map<String, dynamic> json) {
  return _Data.fromJson(json);
}

class _$TestStateTearOff {
  const _$TestStateTearOff();

  _Data data(List<String> names) {
    return _Data(
      names,
    );
  }
}

// ignore: unused_element
const $TestState = _$TestStateTearOff();

mixin _$TestState {
  List<String> get names;

  Map<String, dynamic> toJson();
  $TestStateCopyWith<TestState> get copyWith;
}

abstract class $TestStateCopyWith<$Res> {
  factory $TestStateCopyWith(TestState value, $Res Function(TestState) then) =
      _$TestStateCopyWithImpl<$Res>;
  $Res call({List<String> names});
}

class _$TestStateCopyWithImpl<$Res> implements $TestStateCopyWith<$Res> {
  _$TestStateCopyWithImpl(this._value, this._then);

  final TestState _value;
  // ignore: unused_field
  final $Res Function(TestState) _then;

  @override
  $Res call({
    Object names = freezed,
  }) {
    return _then(_value.copyWith(
      names: names == freezed ? _value.names : names as List<String>,
    ));
  }
}

abstract class _$DataCopyWith<$Res> implements $TestStateCopyWith<$Res> {
  factory _$DataCopyWith(_Data value, $Res Function(_Data) then) =
      __$DataCopyWithImpl<$Res>;
  @override
  $Res call({List<String> names});
}

class __$DataCopyWithImpl<$Res> extends _$TestStateCopyWithImpl<$Res>
    implements _$DataCopyWith<$Res> {
  __$DataCopyWithImpl(_Data _value, $Res Function(_Data) _then)
      : super(_value, (v) => _then(v as _Data));

  @override
  _Data get _value => super._value as _Data;

  @override
  $Res call({
    Object names = freezed,
  }) {
    return _then(_Data(
      names == freezed ? _value.names : names as List<String>,
    ));
  }
}

@JsonSerializable()
class _$_Data with DiagnosticableTreeMixin implements _Data {
  const _$_Data(this.names) : assert(names != null);

  factory _$_Data.fromJson(Map<String, dynamic> json) =>
      _$_$_DataFromJson(json);

  @override
  final List<String> names;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TestState.data(names: $names)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TestState.data'))
      ..add(DiagnosticsProperty('names', names));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Data &&
            (identical(other.names, names) ||
                const DeepCollectionEquality().equals(other.names, names)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(names);

  @override
  _$DataCopyWith<_Data> get copyWith =>
      __$DataCopyWithImpl<_Data>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_DataToJson(this);
  }
}

abstract class _Data implements TestState {
  const factory _Data(List<String> names) = _$_Data;

  factory _Data.fromJson(Map<String, dynamic> json) = _$_Data.fromJson;

  @override
  List<String> get names;
  @override
  _$DataCopyWith<_Data> get copyWith;
}
