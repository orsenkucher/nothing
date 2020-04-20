// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

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

// ignore: unused_element
const $QuestionsState = _$QuestionsStateTearOff();

mixin _$QuestionsState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result loaded(QTree questions),
    @required Result loading(),
    @required Result reloading(),
    @required Result error(CloudError error),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result loaded(QTree questions),
    Result loading(),
    Result reloading(),
    Result error(CloudError error),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result loaded(Loaded value),
    @required Result loading(Loading value),
    @required Result reloading(Reloading value),
    @required Result error(Error value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result loaded(Loaded value),
    Result loading(Loading value),
    Result reloading(Reloading value),
    Result error(Error value),
    @required Result orElse(),
  });
}

abstract class $QuestionsStateCopyWith<$Res> {
  factory $QuestionsStateCopyWith(
          QuestionsState value, $Res Function(QuestionsState) then) =
      _$QuestionsStateCopyWithImpl<$Res>;
}

class _$QuestionsStateCopyWithImpl<$Res>
    implements $QuestionsStateCopyWith<$Res> {
  _$QuestionsStateCopyWithImpl(this._value, this._then);

  final QuestionsState _value;
  // ignore: unused_field
  final $Res Function(QuestionsState) _then;
}

abstract class $LoadedCopyWith<$Res> {
  factory $LoadedCopyWith(Loaded value, $Res Function(Loaded) then) =
      _$LoadedCopyWithImpl<$Res>;
  $Res call({QTree questions});

  $QTreeCopyWith<$Res> get questions;
}

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
  Result when<Result extends Object>({
    @required Result loaded(QTree questions),
    @required Result loading(),
    @required Result reloading(),
    @required Result error(CloudError error),
  }) {
    assert(loaded != null);
    assert(loading != null);
    assert(reloading != null);
    assert(error != null);
    return loaded(questions);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result loaded(QTree questions),
    Result loading(),
    Result reloading(),
    Result error(CloudError error),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loaded != null) {
      return loaded(questions);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result loaded(Loaded value),
    @required Result loading(Loading value),
    @required Result reloading(Reloading value),
    @required Result error(Error value),
  }) {
    assert(loaded != null);
    assert(loading != null);
    assert(reloading != null);
    assert(error != null);
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result loaded(Loaded value),
    Result loading(Loading value),
    Result reloading(Reloading value),
    Result error(Error value),
    @required Result orElse(),
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

abstract class $LoadingCopyWith<$Res> {
  factory $LoadingCopyWith(Loading value, $Res Function(Loading) then) =
      _$LoadingCopyWithImpl<$Res>;
}

class _$LoadingCopyWithImpl<$Res> extends _$QuestionsStateCopyWithImpl<$Res>
    implements $LoadingCopyWith<$Res> {
  _$LoadingCopyWithImpl(Loading _value, $Res Function(Loading) _then)
      : super(_value, (v) => _then(v as Loading));

  @override
  Loading get _value => super._value as Loading;
}

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
  Result when<Result extends Object>({
    @required Result loaded(QTree questions),
    @required Result loading(),
    @required Result reloading(),
    @required Result error(CloudError error),
  }) {
    assert(loaded != null);
    assert(loading != null);
    assert(reloading != null);
    assert(error != null);
    return loading();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result loaded(QTree questions),
    Result loading(),
    Result reloading(),
    Result error(CloudError error),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result loaded(Loaded value),
    @required Result loading(Loading value),
    @required Result reloading(Reloading value),
    @required Result error(Error value),
  }) {
    assert(loaded != null);
    assert(loading != null);
    assert(reloading != null);
    assert(error != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result loaded(Loaded value),
    Result loading(Loading value),
    Result reloading(Reloading value),
    Result error(Error value),
    @required Result orElse(),
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

abstract class $ReloadingCopyWith<$Res> {
  factory $ReloadingCopyWith(Reloading value, $Res Function(Reloading) then) =
      _$ReloadingCopyWithImpl<$Res>;
}

class _$ReloadingCopyWithImpl<$Res> extends _$QuestionsStateCopyWithImpl<$Res>
    implements $ReloadingCopyWith<$Res> {
  _$ReloadingCopyWithImpl(Reloading _value, $Res Function(Reloading) _then)
      : super(_value, (v) => _then(v as Reloading));

  @override
  Reloading get _value => super._value as Reloading;
}

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
  Result when<Result extends Object>({
    @required Result loaded(QTree questions),
    @required Result loading(),
    @required Result reloading(),
    @required Result error(CloudError error),
  }) {
    assert(loaded != null);
    assert(loading != null);
    assert(reloading != null);
    assert(error != null);
    return reloading();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result loaded(QTree questions),
    Result loading(),
    Result reloading(),
    Result error(CloudError error),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (reloading != null) {
      return reloading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result loaded(Loaded value),
    @required Result loading(Loading value),
    @required Result reloading(Reloading value),
    @required Result error(Error value),
  }) {
    assert(loaded != null);
    assert(loading != null);
    assert(reloading != null);
    assert(error != null);
    return reloading(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result loaded(Loaded value),
    Result loading(Loading value),
    Result reloading(Reloading value),
    Result error(Error value),
    @required Result orElse(),
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

abstract class $ErrorCopyWith<$Res> {
  factory $ErrorCopyWith(Error value, $Res Function(Error) then) =
      _$ErrorCopyWithImpl<$Res>;
  $Res call({CloudError error});
}

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
  Result when<Result extends Object>({
    @required Result loaded(QTree questions),
    @required Result loading(),
    @required Result reloading(),
    @required Result error(CloudError error),
  }) {
    assert(loaded != null);
    assert(loading != null);
    assert(reloading != null);
    assert(error != null);
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result loaded(QTree questions),
    Result loading(),
    Result reloading(),
    Result error(CloudError error),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result loaded(Loaded value),
    @required Result loading(Loading value),
    @required Result reloading(Reloading value),
    @required Result error(Error value),
  }) {
    assert(loaded != null);
    assert(loading != null);
    assert(reloading != null);
    assert(error != null);
    return error(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result loaded(Loaded value),
    Result loading(Loading value),
    Result reloading(Reloading value),
    Result error(Error value),
    @required Result orElse(),
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
