// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OnboardState _$OnboardStateFromJson(Map<String, dynamic> json) {
  return _OnboardState.fromJson(json);
}

/// @nodoc
class _$OnboardStateTearOff {
  const _$OnboardStateTearOff();

  _OnboardState call(bool done) {
    return _OnboardState(
      done,
    );
  }

  OnboardState fromJson(Map<String, Object> json) {
    return OnboardState.fromJson(json);
  }
}

/// @nodoc
const $OnboardState = _$OnboardStateTearOff();

/// @nodoc
mixin _$OnboardState {
  bool get done => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OnboardStateCopyWith<OnboardState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OnboardStateCopyWith<$Res> {
  factory $OnboardStateCopyWith(
          OnboardState value, $Res Function(OnboardState) then) =
      _$OnboardStateCopyWithImpl<$Res>;
  $Res call({bool done});
}

/// @nodoc
class _$OnboardStateCopyWithImpl<$Res> implements $OnboardStateCopyWith<$Res> {
  _$OnboardStateCopyWithImpl(this._value, this._then);

  final OnboardState _value;
  // ignore: unused_field
  final $Res Function(OnboardState) _then;

  @override
  $Res call({
    Object? done = freezed,
  }) {
    return _then(_value.copyWith(
      done: done == freezed
          ? _value.done
          : done // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$OnboardStateCopyWith<$Res>
    implements $OnboardStateCopyWith<$Res> {
  factory _$OnboardStateCopyWith(
          _OnboardState value, $Res Function(_OnboardState) then) =
      __$OnboardStateCopyWithImpl<$Res>;
  @override
  $Res call({bool done});
}

/// @nodoc
class __$OnboardStateCopyWithImpl<$Res> extends _$OnboardStateCopyWithImpl<$Res>
    implements _$OnboardStateCopyWith<$Res> {
  __$OnboardStateCopyWithImpl(
      _OnboardState _value, $Res Function(_OnboardState) _then)
      : super(_value, (v) => _then(v as _OnboardState));

  @override
  _OnboardState get _value => super._value as _OnboardState;

  @override
  $Res call({
    Object? done = freezed,
  }) {
    return _then(_OnboardState(
      done == freezed
          ? _value.done
          : done // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_OnboardState with DiagnosticableTreeMixin implements _OnboardState {
  const _$_OnboardState(this.done);

  factory _$_OnboardState.fromJson(Map<String, dynamic> json) =>
      _$_$_OnboardStateFromJson(json);

  @override
  final bool done;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'OnboardState(done: $done)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'OnboardState'))
      ..add(DiagnosticsProperty('done', done));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _OnboardState &&
            (identical(other.done, done) ||
                const DeepCollectionEquality().equals(other.done, done)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(done);

  @JsonKey(ignore: true)
  @override
  _$OnboardStateCopyWith<_OnboardState> get copyWith =>
      __$OnboardStateCopyWithImpl<_OnboardState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_OnboardStateToJson(this);
  }
}

abstract class _OnboardState implements OnboardState {
  const factory _OnboardState(bool done) = _$_OnboardState;

  factory _OnboardState.fromJson(Map<String, dynamic> json) =
      _$_OnboardState.fromJson;

  @override
  bool get done => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$OnboardStateCopyWith<_OnboardState> get copyWith =>
      throw _privateConstructorUsedError;
}
