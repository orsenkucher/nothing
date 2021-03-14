// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$QuestionsEventTearOff {
  const _$QuestionsEventTearOff();

  Fetch fetch([int? currentid, bool isRefetch = false]) {
    return Fetch(
      currentid,
      isRefetch,
    );
  }

  Refetch refetch(int currentid) {
    return Refetch(
      currentid,
    );
  }
}

/// @nodoc
const $QuestionsEvent = _$QuestionsEventTearOff();

/// @nodoc
mixin _$QuestionsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int? currentid, bool isRefetch) fetch,
    required TResult Function(int currentid) refetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int? currentid, bool isRefetch)? fetch,
    TResult Function(int currentid)? refetch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Fetch value) fetch,
    required TResult Function(Refetch value) refetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Fetch value)? fetch,
    TResult Function(Refetch value)? refetch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionsEventCopyWith<$Res> {
  factory $QuestionsEventCopyWith(
          QuestionsEvent value, $Res Function(QuestionsEvent) then) =
      _$QuestionsEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$QuestionsEventCopyWithImpl<$Res>
    implements $QuestionsEventCopyWith<$Res> {
  _$QuestionsEventCopyWithImpl(this._value, this._then);

  final QuestionsEvent _value;
  // ignore: unused_field
  final $Res Function(QuestionsEvent) _then;
}

/// @nodoc
abstract class $FetchCopyWith<$Res> {
  factory $FetchCopyWith(Fetch value, $Res Function(Fetch) then) =
      _$FetchCopyWithImpl<$Res>;
  $Res call({int? currentid, bool isRefetch});
}

/// @nodoc
class _$FetchCopyWithImpl<$Res> extends _$QuestionsEventCopyWithImpl<$Res>
    implements $FetchCopyWith<$Res> {
  _$FetchCopyWithImpl(Fetch _value, $Res Function(Fetch) _then)
      : super(_value, (v) => _then(v as Fetch));

  @override
  Fetch get _value => super._value as Fetch;

  @override
  $Res call({
    Object? currentid = freezed,
    Object? isRefetch = freezed,
  }) {
    return _then(Fetch(
      currentid == freezed
          ? _value.currentid
          : currentid // ignore: cast_nullable_to_non_nullable
              as int?,
      isRefetch == freezed
          ? _value.isRefetch
          : isRefetch // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
class _$Fetch with DiagnosticableTreeMixin implements Fetch {
  const _$Fetch([this.currentid, this.isRefetch = false]);

  @override
  final int? currentid;
  @JsonKey(defaultValue: false)
  @override
  final bool isRefetch;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'QuestionsEvent.fetch(currentid: $currentid, isRefetch: $isRefetch)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'QuestionsEvent.fetch'))
      ..add(DiagnosticsProperty('currentid', currentid))
      ..add(DiagnosticsProperty('isRefetch', isRefetch));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Fetch &&
            (identical(other.currentid, currentid) ||
                const DeepCollectionEquality()
                    .equals(other.currentid, currentid)) &&
            (identical(other.isRefetch, isRefetch) ||
                const DeepCollectionEquality()
                    .equals(other.isRefetch, isRefetch)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(currentid) ^
      const DeepCollectionEquality().hash(isRefetch);

  @JsonKey(ignore: true)
  @override
  $FetchCopyWith<Fetch> get copyWith =>
      _$FetchCopyWithImpl<Fetch>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int? currentid, bool isRefetch) fetch,
    required TResult Function(int currentid) refetch,
  }) {
    return fetch(currentid, isRefetch);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int? currentid, bool isRefetch)? fetch,
    TResult Function(int currentid)? refetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(currentid, isRefetch);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Fetch value) fetch,
    required TResult Function(Refetch value) refetch,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Fetch value)? fetch,
    TResult Function(Refetch value)? refetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class Fetch implements QuestionsEvent {
  const factory Fetch([int? currentid, bool isRefetch]) = _$Fetch;

  int? get currentid => throw _privateConstructorUsedError;
  bool get isRefetch => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FetchCopyWith<Fetch> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RefetchCopyWith<$Res> {
  factory $RefetchCopyWith(Refetch value, $Res Function(Refetch) then) =
      _$RefetchCopyWithImpl<$Res>;
  $Res call({int currentid});
}

/// @nodoc
class _$RefetchCopyWithImpl<$Res> extends _$QuestionsEventCopyWithImpl<$Res>
    implements $RefetchCopyWith<$Res> {
  _$RefetchCopyWithImpl(Refetch _value, $Res Function(Refetch) _then)
      : super(_value, (v) => _then(v as Refetch));

  @override
  Refetch get _value => super._value as Refetch;

  @override
  $Res call({
    Object? currentid = freezed,
  }) {
    return _then(Refetch(
      currentid == freezed
          ? _value.currentid
          : currentid // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
class _$Refetch with DiagnosticableTreeMixin implements Refetch {
  const _$Refetch(this.currentid);

  @override
  final int currentid;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'QuestionsEvent.refetch(currentid: $currentid)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'QuestionsEvent.refetch'))
      ..add(DiagnosticsProperty('currentid', currentid));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Refetch &&
            (identical(other.currentid, currentid) ||
                const DeepCollectionEquality()
                    .equals(other.currentid, currentid)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(currentid);

  @JsonKey(ignore: true)
  @override
  $RefetchCopyWith<Refetch> get copyWith =>
      _$RefetchCopyWithImpl<Refetch>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int? currentid, bool isRefetch) fetch,
    required TResult Function(int currentid) refetch,
  }) {
    return refetch(currentid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int? currentid, bool isRefetch)? fetch,
    TResult Function(int currentid)? refetch,
    required TResult orElse(),
  }) {
    if (refetch != null) {
      return refetch(currentid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Fetch value) fetch,
    required TResult Function(Refetch value) refetch,
  }) {
    return refetch(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Fetch value)? fetch,
    TResult Function(Refetch value)? refetch,
    required TResult orElse(),
  }) {
    if (refetch != null) {
      return refetch(this);
    }
    return orElse();
  }
}

abstract class Refetch implements QuestionsEvent {
  const factory Refetch(int currentid) = _$Refetch;

  int get currentid => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RefetchCopyWith<Refetch> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
class _$QuestionsStateTearOff {
  const _$QuestionsStateTearOff();

  Loaded loaded(QTree questions) {
    return Loaded(
      questions,
    );
  }

  Loading loading() {
    return const Loading();
  }

  Reloading reloading() {
    return const Reloading();
  }

  Error error(CloudError error) {
    return Error(
      error,
    );
  }
}

/// @nodoc
const $QuestionsState = _$QuestionsStateTearOff();

/// @nodoc
mixin _$QuestionsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(QTree questions) loaded,
    required TResult Function() loading,
    required TResult Function() reloading,
    required TResult Function(CloudError error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(QTree questions)? loaded,
    TResult Function()? loading,
    TResult Function()? reloading,
    TResult Function(CloudError error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Loaded value) loaded,
    required TResult Function(Loading value) loading,
    required TResult Function(Reloading value) reloading,
    required TResult Function(Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Loaded value)? loaded,
    TResult Function(Loading value)? loading,
    TResult Function(Reloading value)? reloading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionsStateCopyWith<$Res> {
  factory $QuestionsStateCopyWith(
          QuestionsState value, $Res Function(QuestionsState) then) =
      _$QuestionsStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$QuestionsStateCopyWithImpl<$Res>
    implements $QuestionsStateCopyWith<$Res> {
  _$QuestionsStateCopyWithImpl(this._value, this._then);

  final QuestionsState _value;
  // ignore: unused_field
  final $Res Function(QuestionsState) _then;
}

/// @nodoc
abstract class $LoadedCopyWith<$Res> {
  factory $LoadedCopyWith(Loaded value, $Res Function(Loaded) then) =
      _$LoadedCopyWithImpl<$Res>;
  $Res call({QTree questions});

  $QTreeCopyWith<$Res> get questions;
}

/// @nodoc
class _$LoadedCopyWithImpl<$Res> extends _$QuestionsStateCopyWithImpl<$Res>
    implements $LoadedCopyWith<$Res> {
  _$LoadedCopyWithImpl(Loaded _value, $Res Function(Loaded) _then)
      : super(_value, (v) => _then(v as Loaded));

  @override
  Loaded get _value => super._value as Loaded;

  @override
  $Res call({
    Object? questions = freezed,
  }) {
    return _then(Loaded(
      questions == freezed
          ? _value.questions
          : questions // ignore: cast_nullable_to_non_nullable
              as QTree,
    ));
  }

  @override
  $QTreeCopyWith<$Res> get questions {
    return $QTreeCopyWith<$Res>(_value.questions, (value) {
      return _then(_value.copyWith(questions: value));
    });
  }
}

/// @nodoc
class _$Loaded with DiagnosticableTreeMixin implements Loaded {
  const _$Loaded(this.questions);

  @override
  final QTree questions;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'QuestionsState.loaded(questions: $questions)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'QuestionsState.loaded'))
      ..add(DiagnosticsProperty('questions', questions));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Loaded &&
            (identical(other.questions, questions) ||
                const DeepCollectionEquality()
                    .equals(other.questions, questions)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(questions);

  @JsonKey(ignore: true)
  @override
  $LoadedCopyWith<Loaded> get copyWith =>
      _$LoadedCopyWithImpl<Loaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(QTree questions) loaded,
    required TResult Function() loading,
    required TResult Function() reloading,
    required TResult Function(CloudError error) error,
  }) {
    return loaded(questions);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(QTree questions)? loaded,
    TResult Function()? loading,
    TResult Function()? reloading,
    TResult Function(CloudError error)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(questions);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Loaded value) loaded,
    required TResult Function(Loading value) loading,
    required TResult Function(Reloading value) reloading,
    required TResult Function(Error value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Loaded value)? loaded,
    TResult Function(Loading value)? loading,
    TResult Function(Reloading value)? reloading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class Loaded implements QuestionsState {
  const factory Loaded(QTree questions) = _$Loaded;

  QTree get questions => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoadedCopyWith<Loaded> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoadingCopyWith<$Res> {
  factory $LoadingCopyWith(Loading value, $Res Function(Loading) then) =
      _$LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$LoadingCopyWithImpl<$Res> extends _$QuestionsStateCopyWithImpl<$Res>
    implements $LoadingCopyWith<$Res> {
  _$LoadingCopyWithImpl(Loading _value, $Res Function(Loading) _then)
      : super(_value, (v) => _then(v as Loading));

  @override
  Loading get _value => super._value as Loading;
}

/// @nodoc
class _$Loading with DiagnosticableTreeMixin implements Loading {
  const _$Loading();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'QuestionsState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'QuestionsState.loading'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(QTree questions) loaded,
    required TResult Function() loading,
    required TResult Function() reloading,
    required TResult Function(CloudError error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(QTree questions)? loaded,
    TResult Function()? loading,
    TResult Function()? reloading,
    TResult Function(CloudError error)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Loaded value) loaded,
    required TResult Function(Loading value) loading,
    required TResult Function(Reloading value) reloading,
    required TResult Function(Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Loaded value)? loaded,
    TResult Function(Loading value)? loading,
    TResult Function(Reloading value)? reloading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements QuestionsState {
  const factory Loading() = _$Loading;
}

/// @nodoc
abstract class $ReloadingCopyWith<$Res> {
  factory $ReloadingCopyWith(Reloading value, $Res Function(Reloading) then) =
      _$ReloadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$ReloadingCopyWithImpl<$Res> extends _$QuestionsStateCopyWithImpl<$Res>
    implements $ReloadingCopyWith<$Res> {
  _$ReloadingCopyWithImpl(Reloading _value, $Res Function(Reloading) _then)
      : super(_value, (v) => _then(v as Reloading));

  @override
  Reloading get _value => super._value as Reloading;
}

/// @nodoc
class _$Reloading with DiagnosticableTreeMixin implements Reloading {
  const _$Reloading();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'QuestionsState.reloading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'QuestionsState.reloading'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Reloading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(QTree questions) loaded,
    required TResult Function() loading,
    required TResult Function() reloading,
    required TResult Function(CloudError error) error,
  }) {
    return reloading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(QTree questions)? loaded,
    TResult Function()? loading,
    TResult Function()? reloading,
    TResult Function(CloudError error)? error,
    required TResult orElse(),
  }) {
    if (reloading != null) {
      return reloading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Loaded value) loaded,
    required TResult Function(Loading value) loading,
    required TResult Function(Reloading value) reloading,
    required TResult Function(Error value) error,
  }) {
    return reloading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Loaded value)? loaded,
    TResult Function(Loading value)? loading,
    TResult Function(Reloading value)? reloading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (reloading != null) {
      return reloading(this);
    }
    return orElse();
  }
}

abstract class Reloading implements QuestionsState {
  const factory Reloading() = _$Reloading;
}

/// @nodoc
abstract class $ErrorCopyWith<$Res> {
  factory $ErrorCopyWith(Error value, $Res Function(Error) then) =
      _$ErrorCopyWithImpl<$Res>;
  $Res call({CloudError error});
}

/// @nodoc
class _$ErrorCopyWithImpl<$Res> extends _$QuestionsStateCopyWithImpl<$Res>
    implements $ErrorCopyWith<$Res> {
  _$ErrorCopyWithImpl(Error _value, $Res Function(Error) _then)
      : super(_value, (v) => _then(v as Error));

  @override
  Error get _value => super._value as Error;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(Error(
      error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as CloudError,
    ));
  }
}

/// @nodoc
class _$Error with DiagnosticableTreeMixin implements Error {
  const _$Error(this.error);

  @override
  final CloudError error;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'QuestionsState.error(error: $error)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'QuestionsState.error'))
      ..add(DiagnosticsProperty('error', error));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Error &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(error);

  @JsonKey(ignore: true)
  @override
  $ErrorCopyWith<Error> get copyWith =>
      _$ErrorCopyWithImpl<Error>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(QTree questions) loaded,
    required TResult Function() loading,
    required TResult Function() reloading,
    required TResult Function(CloudError error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(QTree questions)? loaded,
    TResult Function()? loading,
    TResult Function()? reloading,
    TResult Function(CloudError error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Loaded value) loaded,
    required TResult Function(Loading value) loading,
    required TResult Function(Reloading value) reloading,
    required TResult Function(Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Loaded value)? loaded,
    TResult Function(Loading value)? loading,
    TResult Function(Reloading value)? reloading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error implements QuestionsState {
  const factory Error(CloudError error) = _$Error;

  CloudError get error => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ErrorCopyWith<Error> get copyWith => throw _privateConstructorUsedError;
}
