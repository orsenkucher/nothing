// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

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

const $QuestionsState = _$QuestionsStateTearOff();

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
  _$Loaded copyWith({
    Object questions = freezed,
  }) {
    return _$Loaded(
      questions == freezed ? this.questions : questions as QTree,
    );
  }

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

  Loaded copyWith({QTree questions});
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
  _$Error copyWith({
    Object error = freezed,
  }) {
    return _$Error(
      error == freezed ? this.error : error as CloudError,
    );
  }

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

  Error copyWith({CloudError error});
}
