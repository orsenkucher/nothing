// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$QuestionsEventTearOff {
  const _$QuestionsEventTearOff();

// ignore: unused_element
  Fetch fetch([int currentid]) {
    return Fetch(
      currentid,
    );
  }

// ignore: unused_element
  Refetch refetch(int currentid) {
    return Refetch(
      currentid,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $QuestionsEvent = _$QuestionsEventTearOff();

/// @nodoc
mixin _$QuestionsEvent {
  int get currentid;

  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult fetch(int currentid),
    @required TResult refetch(int currentid),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult fetch(int currentid),
    TResult refetch(int currentid),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult fetch(Fetch value),
    @required TResult refetch(Refetch value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult fetch(Fetch value),
    TResult refetch(Refetch value),
    @required TResult orElse(),
  });

  $QuestionsEventCopyWith<QuestionsEvent> get copyWith;
}

/// @nodoc
abstract class $QuestionsEventCopyWith<$Res> {
  factory $QuestionsEventCopyWith(
          QuestionsEvent value, $Res Function(QuestionsEvent) then) =
      _$QuestionsEventCopyWithImpl<$Res>;
  $Res call({int currentid});
}

/// @nodoc
class _$QuestionsEventCopyWithImpl<$Res>
    implements $QuestionsEventCopyWith<$Res> {
  _$QuestionsEventCopyWithImpl(this._value, this._then);

  final QuestionsEvent _value;
  // ignore: unused_field
  final $Res Function(QuestionsEvent) _then;

  @override
  $Res call({
    Object currentid = freezed,
  }) {
    return _then(_value.copyWith(
      currentid: currentid == freezed ? _value.currentid : currentid as int,
    ));
  }
}

/// @nodoc
abstract class $FetchCopyWith<$Res> implements $QuestionsEventCopyWith<$Res> {
  factory $FetchCopyWith(Fetch value, $Res Function(Fetch) then) =
      _$FetchCopyWithImpl<$Res>;
  @override
  $Res call({int currentid});
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
    Object currentid = freezed,
  }) {
    return _then(Fetch(
      currentid == freezed ? _value.currentid : currentid as int,
    ));
  }
}

/// @nodoc
class _$Fetch with DiagnosticableTreeMixin implements Fetch {
  const _$Fetch([this.currentid]);

  @override
  final int currentid;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'QuestionsEvent.fetch(currentid: $currentid)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'QuestionsEvent.fetch'))
      ..add(DiagnosticsProperty('currentid', currentid));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Fetch &&
            (identical(other.currentid, currentid) ||
                const DeepCollectionEquality()
                    .equals(other.currentid, currentid)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(currentid);

  @override
  $FetchCopyWith<Fetch> get copyWith =>
      _$FetchCopyWithImpl<Fetch>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult fetch(int currentid),
    @required TResult refetch(int currentid),
  }) {
    assert(fetch != null);
    assert(refetch != null);
    return fetch(currentid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult fetch(int currentid),
    TResult refetch(int currentid),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (fetch != null) {
      return fetch(currentid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult fetch(Fetch value),
    @required TResult refetch(Refetch value),
  }) {
    assert(fetch != null);
    assert(refetch != null);
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult fetch(Fetch value),
    TResult refetch(Refetch value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class Fetch implements QuestionsEvent {
  const factory Fetch([int currentid]) = _$Fetch;

  @override
  int get currentid;
  @override
  $FetchCopyWith<Fetch> get copyWith;
}

/// @nodoc
abstract class $RefetchCopyWith<$Res> implements $QuestionsEventCopyWith<$Res> {
  factory $RefetchCopyWith(Refetch value, $Res Function(Refetch) then) =
      _$RefetchCopyWithImpl<$Res>;
  @override
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
    Object currentid = freezed,
  }) {
    return _then(Refetch(
      currentid == freezed ? _value.currentid : currentid as int,
    ));
  }
}

/// @nodoc
class _$Refetch with DiagnosticableTreeMixin implements Refetch {
  const _$Refetch(this.currentid) : assert(currentid != null);

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

  @override
  $RefetchCopyWith<Refetch> get copyWith =>
      _$RefetchCopyWithImpl<Refetch>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult fetch(int currentid),
    @required TResult refetch(int currentid),
  }) {
    assert(fetch != null);
    assert(refetch != null);
    return refetch(currentid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult fetch(int currentid),
    TResult refetch(int currentid),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (refetch != null) {
      return refetch(currentid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult fetch(Fetch value),
    @required TResult refetch(Refetch value),
  }) {
    assert(fetch != null);
    assert(refetch != null);
    return refetch(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult fetch(Fetch value),
    TResult refetch(Refetch value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (refetch != null) {
      return refetch(this);
    }
    return orElse();
  }
}

abstract class Refetch implements QuestionsEvent {
  const factory Refetch(int currentid) = _$Refetch;

  @override
  int get currentid;
  @override
  $RefetchCopyWith<Refetch> get copyWith;
}

/// @nodoc
class _$QuestionsStateTearOff {
  const _$QuestionsStateTearOff();

// ignore: unused_element
  Loaded loaded(QTree questions) {
    return Loaded(
      questions,
    );
  }

// ignore: unused_element
  Loading loading() {
    return const Loading();
  }

// ignore: unused_element
  Reloading reloading() {
    return const Reloading();
  }

// ignore: unused_element
  Error error(CloudError error) {
    return Error(
      error,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $QuestionsState = _$QuestionsStateTearOff();

/// @nodoc
mixin _$QuestionsState {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult loaded(QTree questions),
    @required TResult loading(),
    @required TResult reloading(),
    @required TResult error(CloudError error),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult loaded(QTree questions),
    TResult loading(),
    TResult reloading(),
    TResult error(CloudError error),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult loaded(Loaded value),
    @required TResult loading(Loading value),
    @required TResult reloading(Reloading value),
    @required TResult error(Error value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult loaded(Loaded value),
    TResult loading(Loading value),
    TResult reloading(Reloading value),
    TResult error(Error value),
    @required TResult orElse(),
  });
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
    Object questions = freezed,
  }) {
    return _then(Loaded(
      questions == freezed ? _value.questions : questions as QTree,
    ));
  }

  @override
  $QTreeCopyWith<$Res> get questions {
    if (_value.questions == null) {
      return null;
    }
    return $QTreeCopyWith<$Res>(_value.questions, (value) {
      return _then(_value.copyWith(questions: value));
    });
  }
}

/// @nodoc
class _$Loaded with DiagnosticableTreeMixin implements Loaded {
  const _$Loaded(this.questions) : assert(questions != null);

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

  @override
  $LoadedCopyWith<Loaded> get copyWith =>
      _$LoadedCopyWithImpl<Loaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult loaded(QTree questions),
    @required TResult loading(),
    @required TResult reloading(),
    @required TResult error(CloudError error),
  }) {
    assert(loaded != null);
    assert(loading != null);
    assert(reloading != null);
    assert(error != null);
    return loaded(questions);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult loaded(QTree questions),
    TResult loading(),
    TResult reloading(),
    TResult error(CloudError error),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loaded != null) {
      return loaded(questions);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult loaded(Loaded value),
    @required TResult loading(Loading value),
    @required TResult reloading(Reloading value),
    @required TResult error(Error value),
  }) {
    assert(loaded != null);
    assert(loading != null);
    assert(reloading != null);
    assert(error != null);
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult loaded(Loaded value),
    TResult loading(Loading value),
    TResult reloading(Reloading value),
    TResult error(Error value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class Loaded implements QuestionsState {
  const factory Loaded(QTree questions) = _$Loaded;

  QTree get questions;
  $LoadedCopyWith<Loaded> get copyWith;
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
  TResult when<TResult extends Object>({
    @required TResult loaded(QTree questions),
    @required TResult loading(),
    @required TResult reloading(),
    @required TResult error(CloudError error),
  }) {
    assert(loaded != null);
    assert(loading != null);
    assert(reloading != null);
    assert(error != null);
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult loaded(QTree questions),
    TResult loading(),
    TResult reloading(),
    TResult error(CloudError error),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult loaded(Loaded value),
    @required TResult loading(Loading value),
    @required TResult reloading(Reloading value),
    @required TResult error(Error value),
  }) {
    assert(loaded != null);
    assert(loading != null);
    assert(reloading != null);
    assert(error != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult loaded(Loaded value),
    TResult loading(Loading value),
    TResult reloading(Reloading value),
    TResult error(Error value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
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
  TResult when<TResult extends Object>({
    @required TResult loaded(QTree questions),
    @required TResult loading(),
    @required TResult reloading(),
    @required TResult error(CloudError error),
  }) {
    assert(loaded != null);
    assert(loading != null);
    assert(reloading != null);
    assert(error != null);
    return reloading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult loaded(QTree questions),
    TResult loading(),
    TResult reloading(),
    TResult error(CloudError error),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (reloading != null) {
      return reloading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult loaded(Loaded value),
    @required TResult loading(Loading value),
    @required TResult reloading(Reloading value),
    @required TResult error(Error value),
  }) {
    assert(loaded != null);
    assert(loading != null);
    assert(reloading != null);
    assert(error != null);
    return reloading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult loaded(Loaded value),
    TResult loading(Loading value),
    TResult reloading(Reloading value),
    TResult error(Error value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
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
    Object error = freezed,
  }) {
    return _then(Error(
      error == freezed ? _value.error : error as CloudError,
    ));
  }
}

/// @nodoc
class _$Error with DiagnosticableTreeMixin implements Error {
  const _$Error(this.error) : assert(error != null);

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

  @override
  $ErrorCopyWith<Error> get copyWith =>
      _$ErrorCopyWithImpl<Error>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult loaded(QTree questions),
    @required TResult loading(),
    @required TResult reloading(),
    @required TResult error(CloudError error),
  }) {
    assert(loaded != null);
    assert(loading != null);
    assert(reloading != null);
    assert(error != null);
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult loaded(QTree questions),
    TResult loading(),
    TResult reloading(),
    TResult error(CloudError error),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult loaded(Loaded value),
    @required TResult loading(Loading value),
    @required TResult reloading(Reloading value),
    @required TResult error(Error value),
  }) {
    assert(loaded != null);
    assert(loading != null);
    assert(reloading != null);
    assert(error != null);
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult loaded(Loaded value),
    TResult loading(Loading value),
    TResult reloading(Reloading value),
    TResult error(Error value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error implements QuestionsState {
  const factory Error(CloudError error) = _$Error;

  CloudError get error;
  $ErrorCopyWith<Error> get copyWith;
}
