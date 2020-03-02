// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'test.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$TestEvent {
  String get name;

  TestEvent copyWith({String name});
}

class _$TestEventTearOff {
  const _$TestEventTearOff();

  _Name name(String name) {
    return _Name(
      name,
    );
  }
}

const $TestEvent = _$TestEventTearOff();

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
  _$_Name copyWith({
    Object name = freezed,
  }) {
    return _$_Name(
      name == freezed ? this.name : name as String,
    );
  }
}

abstract class _Name implements TestEvent {
  const factory _Name(String name) = _$_Name;

  @override
  String get name;

  @override
  _Name copyWith({String name});
}

TestState _$TestStateFromJson(Map<String, dynamic> json) {
  return _Data.fromJson(json);
}

mixin _$TestState {
  List<String> get names;

  TestState copyWith({List<String> names});

  Map<String, dynamic> toJson();
}

class _$TestStateTearOff {
  const _$TestStateTearOff();

  _Data data(List<String> names) {
    return _Data(
      names,
    );
  }
}

const $TestState = _$TestStateTearOff();

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
  _$_Data copyWith({
    Object names = freezed,
  }) {
    return _$_Data(
      names == freezed ? this.names : names as List<String>,
    );
  }

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
  _Data copyWith({List<String> names});
}
