// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$AdEventTearOff {
  const _$AdEventTearOff();

// ignore: unused_element
  _Register register(String userid) {
    return _Register(
      userid,
    );
  }

// ignore: unused_element
  _Report report(AdType type) {
    return _Report(
      type,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $AdEvent = _$AdEventTearOff();

/// @nodoc
mixin _$AdEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult register(String userid),
    @required TResult report(AdType type),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult register(String userid),
    TResult report(AdType type),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult register(_Register value),
    @required TResult report(_Report value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult register(_Register value),
    TResult report(_Report value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $AdEventCopyWith<$Res> {
  factory $AdEventCopyWith(AdEvent value, $Res Function(AdEvent) then) =
      _$AdEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$AdEventCopyWithImpl<$Res> implements $AdEventCopyWith<$Res> {
  _$AdEventCopyWithImpl(this._value, this._then);

  final AdEvent _value;
  // ignore: unused_field
  final $Res Function(AdEvent) _then;
}

/// @nodoc
abstract class _$RegisterCopyWith<$Res> {
  factory _$RegisterCopyWith(_Register value, $Res Function(_Register) then) =
      __$RegisterCopyWithImpl<$Res>;
  $Res call({String userid});
}

/// @nodoc
class __$RegisterCopyWithImpl<$Res> extends _$AdEventCopyWithImpl<$Res>
    implements _$RegisterCopyWith<$Res> {
  __$RegisterCopyWithImpl(_Register _value, $Res Function(_Register) _then)
      : super(_value, (v) => _then(v as _Register));

  @override
  _Register get _value => super._value as _Register;

  @override
  $Res call({
    Object userid = freezed,
  }) {
    return _then(_Register(
      userid == freezed ? _value.userid : userid as String,
    ));
  }
}

/// @nodoc
class _$_Register with DiagnosticableTreeMixin implements _Register {
  const _$_Register(this.userid) : assert(userid != null);

  @override
  final String userid;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AdEvent.register(userid: $userid)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AdEvent.register'))
      ..add(DiagnosticsProperty('userid', userid));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Register &&
            (identical(other.userid, userid) ||
                const DeepCollectionEquality().equals(other.userid, userid)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(userid);

  @JsonKey(ignore: true)
  @override
  _$RegisterCopyWith<_Register> get copyWith =>
      __$RegisterCopyWithImpl<_Register>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult register(String userid),
    @required TResult report(AdType type),
  }) {
    assert(register != null);
    assert(report != null);
    return register(userid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult register(String userid),
    TResult report(AdType type),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (register != null) {
      return register(userid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult register(_Register value),
    @required TResult report(_Report value),
  }) {
    assert(register != null);
    assert(report != null);
    return register(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult register(_Register value),
    TResult report(_Report value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (register != null) {
      return register(this);
    }
    return orElse();
  }
}

abstract class _Register implements AdEvent {
  const factory _Register(String userid) = _$_Register;

  String get userid;
  @JsonKey(ignore: true)
  _$RegisterCopyWith<_Register> get copyWith;
}

/// @nodoc
abstract class _$ReportCopyWith<$Res> {
  factory _$ReportCopyWith(_Report value, $Res Function(_Report) then) =
      __$ReportCopyWithImpl<$Res>;
  $Res call({AdType type});
}

/// @nodoc
class __$ReportCopyWithImpl<$Res> extends _$AdEventCopyWithImpl<$Res>
    implements _$ReportCopyWith<$Res> {
  __$ReportCopyWithImpl(_Report _value, $Res Function(_Report) _then)
      : super(_value, (v) => _then(v as _Report));

  @override
  _Report get _value => super._value as _Report;

  @override
  $Res call({
    Object type = freezed,
  }) {
    return _then(_Report(
      type == freezed ? _value.type : type as AdType,
    ));
  }
}

/// @nodoc
class _$_Report with DiagnosticableTreeMixin implements _Report {
  const _$_Report(this.type) : assert(type != null);

  @override
  final AdType type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AdEvent.report(type: $type)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AdEvent.report'))
      ..add(DiagnosticsProperty('type', type));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Report &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(type);

  @JsonKey(ignore: true)
  @override
  _$ReportCopyWith<_Report> get copyWith =>
      __$ReportCopyWithImpl<_Report>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult register(String userid),
    @required TResult report(AdType type),
  }) {
    assert(register != null);
    assert(report != null);
    return report(type);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult register(String userid),
    TResult report(AdType type),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (report != null) {
      return report(type);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult register(_Register value),
    @required TResult report(_Report value),
  }) {
    assert(register != null);
    assert(report != null);
    return report(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult register(_Register value),
    TResult report(_Report value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (report != null) {
      return report(this);
    }
    return orElse();
  }
}

abstract class _Report implements AdEvent {
  const factory _Report(AdType type) = _$_Report;

  AdType get type;
  @JsonKey(ignore: true)
  _$ReportCopyWith<_Report> get copyWith;
}

/// @nodoc
class _$AdStateTearOff {
  const _$AdStateTearOff();

// ignore: unused_element
  _AdState call(String userid, AdMode type) {
    return _AdState(
      userid,
      type,
    );
  }

// ignore: unused_element
  _Empty empty() {
    return const _Empty();
  }
}

/// @nodoc
// ignore: unused_element
const $AdState = _$AdStateTearOff();

/// @nodoc
mixin _$AdState {
  @optionalTypeArgs
  TResult when<TResult extends Object>(
    TResult $default(String userid, AdMode type), {
    @required TResult empty(),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>(
    TResult $default(String userid, AdMode type), {
    TResult empty(),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>(
    TResult $default(_AdState value), {
    @required TResult empty(_Empty value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>(
    TResult $default(_AdState value), {
    TResult empty(_Empty value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $AdStateCopyWith<$Res> {
  factory $AdStateCopyWith(AdState value, $Res Function(AdState) then) =
      _$AdStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$AdStateCopyWithImpl<$Res> implements $AdStateCopyWith<$Res> {
  _$AdStateCopyWithImpl(this._value, this._then);

  final AdState _value;
  // ignore: unused_field
  final $Res Function(AdState) _then;
}

/// @nodoc
abstract class _$AdStateCopyWith<$Res> {
  factory _$AdStateCopyWith(_AdState value, $Res Function(_AdState) then) =
      __$AdStateCopyWithImpl<$Res>;
  $Res call({String userid, AdMode type});
}

/// @nodoc
class __$AdStateCopyWithImpl<$Res> extends _$AdStateCopyWithImpl<$Res>
    implements _$AdStateCopyWith<$Res> {
  __$AdStateCopyWithImpl(_AdState _value, $Res Function(_AdState) _then)
      : super(_value, (v) => _then(v as _AdState));

  @override
  _AdState get _value => super._value as _AdState;

  @override
  $Res call({
    Object userid = freezed,
    Object type = freezed,
  }) {
    return _then(_AdState(
      userid == freezed ? _value.userid : userid as String,
      type == freezed ? _value.type : type as AdMode,
    ));
  }
}

/// @nodoc
class _$_AdState with DiagnosticableTreeMixin implements _AdState {
  const _$_AdState(this.userid, this.type)
      : assert(userid != null),
        assert(type != null);

  @override
  final String userid;
  @override
  final AdMode type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AdState(userid: $userid, type: $type)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AdState'))
      ..add(DiagnosticsProperty('userid', userid))
      ..add(DiagnosticsProperty('type', type));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AdState &&
            (identical(other.userid, userid) ||
                const DeepCollectionEquality().equals(other.userid, userid)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(userid) ^
      const DeepCollectionEquality().hash(type);

  @JsonKey(ignore: true)
  @override
  _$AdStateCopyWith<_AdState> get copyWith =>
      __$AdStateCopyWithImpl<_AdState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>(
    TResult $default(String userid, AdMode type), {
    @required TResult empty(),
  }) {
    assert($default != null);
    assert(empty != null);
    return $default(userid, type);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>(
    TResult $default(String userid, AdMode type), {
    TResult empty(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default(userid, type);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>(
    TResult $default(_AdState value), {
    @required TResult empty(_Empty value),
  }) {
    assert($default != null);
    assert(empty != null);
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>(
    TResult $default(_AdState value), {
    TResult empty(_Empty value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _AdState implements AdState {
  const factory _AdState(String userid, AdMode type) = _$_AdState;

  String get userid;
  AdMode get type;
  @JsonKey(ignore: true)
  _$AdStateCopyWith<_AdState> get copyWith;
}

/// @nodoc
abstract class _$EmptyCopyWith<$Res> {
  factory _$EmptyCopyWith(_Empty value, $Res Function(_Empty) then) =
      __$EmptyCopyWithImpl<$Res>;
}

/// @nodoc
class __$EmptyCopyWithImpl<$Res> extends _$AdStateCopyWithImpl<$Res>
    implements _$EmptyCopyWith<$Res> {
  __$EmptyCopyWithImpl(_Empty _value, $Res Function(_Empty) _then)
      : super(_value, (v) => _then(v as _Empty));

  @override
  _Empty get _value => super._value as _Empty;
}

/// @nodoc
class _$_Empty with DiagnosticableTreeMixin implements _Empty {
  const _$_Empty();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AdState.empty()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'AdState.empty'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Empty);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>(
    TResult $default(String userid, AdMode type), {
    @required TResult empty(),
  }) {
    assert($default != null);
    assert(empty != null);
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>(
    TResult $default(String userid, AdMode type), {
    TResult empty(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (empty != null) {
      return empty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>(
    TResult $default(_AdState value), {
    @required TResult empty(_Empty value),
  }) {
    assert($default != null);
    assert(empty != null);
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>(
    TResult $default(_AdState value), {
    TResult empty(_Empty value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class _Empty implements AdState {
  const factory _Empty() = _$_Empty;
}
