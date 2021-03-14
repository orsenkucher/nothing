// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SummaryEventTearOff {
  const _$SummaryEventTearOff();

  Remove remove(List<SummaryAnswer> answers) {
    return Remove(
      answers,
    );
  }

  NewAnswer answer(
      {required int qid,
      required int tries,
      required int seconds,
      required List<String> answers}) {
    return NewAnswer(
      qid: qid,
      tries: tries,
      seconds: seconds,
      answers: answers,
    );
  }
}

/// @nodoc
const $SummaryEvent = _$SummaryEventTearOff();

/// @nodoc
mixin _$SummaryEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<SummaryAnswer> answers) remove,
    required TResult Function(
            int qid, int tries, int seconds, List<String> answers)
        answer,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<SummaryAnswer> answers)? remove,
    TResult Function(int qid, int tries, int seconds, List<String> answers)?
        answer,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Remove value) remove,
    required TResult Function(NewAnswer value) answer,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Remove value)? remove,
    TResult Function(NewAnswer value)? answer,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SummaryEventCopyWith<$Res> {
  factory $SummaryEventCopyWith(
          SummaryEvent value, $Res Function(SummaryEvent) then) =
      _$SummaryEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$SummaryEventCopyWithImpl<$Res> implements $SummaryEventCopyWith<$Res> {
  _$SummaryEventCopyWithImpl(this._value, this._then);

  final SummaryEvent _value;
  // ignore: unused_field
  final $Res Function(SummaryEvent) _then;
}

/// @nodoc
abstract class $RemoveCopyWith<$Res> {
  factory $RemoveCopyWith(Remove value, $Res Function(Remove) then) =
      _$RemoveCopyWithImpl<$Res>;
  $Res call({List<SummaryAnswer> answers});
}

/// @nodoc
class _$RemoveCopyWithImpl<$Res> extends _$SummaryEventCopyWithImpl<$Res>
    implements $RemoveCopyWith<$Res> {
  _$RemoveCopyWithImpl(Remove _value, $Res Function(Remove) _then)
      : super(_value, (v) => _then(v as Remove));

  @override
  Remove get _value => super._value as Remove;

  @override
  $Res call({
    Object? answers = freezed,
  }) {
    return _then(Remove(
      answers == freezed
          ? _value.answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<SummaryAnswer>,
    ));
  }
}

/// @nodoc
class _$Remove with DiagnosticableTreeMixin implements Remove {
  const _$Remove(this.answers);

  @override
  final List<SummaryAnswer> answers;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SummaryEvent.remove(answers: $answers)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SummaryEvent.remove'))
      ..add(DiagnosticsProperty('answers', answers));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Remove &&
            (identical(other.answers, answers) ||
                const DeepCollectionEquality().equals(other.answers, answers)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(answers);

  @JsonKey(ignore: true)
  @override
  $RemoveCopyWith<Remove> get copyWith =>
      _$RemoveCopyWithImpl<Remove>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<SummaryAnswer> answers) remove,
    required TResult Function(
            int qid, int tries, int seconds, List<String> answers)
        answer,
  }) {
    return remove(answers);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<SummaryAnswer> answers)? remove,
    TResult Function(int qid, int tries, int seconds, List<String> answers)?
        answer,
    required TResult orElse(),
  }) {
    if (remove != null) {
      return remove(answers);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Remove value) remove,
    required TResult Function(NewAnswer value) answer,
  }) {
    return remove(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Remove value)? remove,
    TResult Function(NewAnswer value)? answer,
    required TResult orElse(),
  }) {
    if (remove != null) {
      return remove(this);
    }
    return orElse();
  }
}

abstract class Remove implements SummaryEvent {
  const factory Remove(List<SummaryAnswer> answers) = _$Remove;

  List<SummaryAnswer> get answers => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RemoveCopyWith<Remove> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewAnswerCopyWith<$Res> {
  factory $NewAnswerCopyWith(NewAnswer value, $Res Function(NewAnswer) then) =
      _$NewAnswerCopyWithImpl<$Res>;
  $Res call({int qid, int tries, int seconds, List<String> answers});
}

/// @nodoc
class _$NewAnswerCopyWithImpl<$Res> extends _$SummaryEventCopyWithImpl<$Res>
    implements $NewAnswerCopyWith<$Res> {
  _$NewAnswerCopyWithImpl(NewAnswer _value, $Res Function(NewAnswer) _then)
      : super(_value, (v) => _then(v as NewAnswer));

  @override
  NewAnswer get _value => super._value as NewAnswer;

  @override
  $Res call({
    Object? qid = freezed,
    Object? tries = freezed,
    Object? seconds = freezed,
    Object? answers = freezed,
  }) {
    return _then(NewAnswer(
      qid: qid == freezed
          ? _value.qid
          : qid // ignore: cast_nullable_to_non_nullable
              as int,
      tries: tries == freezed
          ? _value.tries
          : tries // ignore: cast_nullable_to_non_nullable
              as int,
      seconds: seconds == freezed
          ? _value.seconds
          : seconds // ignore: cast_nullable_to_non_nullable
              as int,
      answers: answers == freezed
          ? _value.answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
class _$NewAnswer with DiagnosticableTreeMixin implements NewAnswer {
  const _$NewAnswer(
      {required this.qid,
      required this.tries,
      required this.seconds,
      required this.answers});

  @override
  final int qid;
  @override
  final int tries;
  @override
  final int seconds;
  @override
  final List<String> answers;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SummaryEvent.answer(qid: $qid, tries: $tries, seconds: $seconds, answers: $answers)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SummaryEvent.answer'))
      ..add(DiagnosticsProperty('qid', qid))
      ..add(DiagnosticsProperty('tries', tries))
      ..add(DiagnosticsProperty('seconds', seconds))
      ..add(DiagnosticsProperty('answers', answers));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is NewAnswer &&
            (identical(other.qid, qid) ||
                const DeepCollectionEquality().equals(other.qid, qid)) &&
            (identical(other.tries, tries) ||
                const DeepCollectionEquality().equals(other.tries, tries)) &&
            (identical(other.seconds, seconds) ||
                const DeepCollectionEquality()
                    .equals(other.seconds, seconds)) &&
            (identical(other.answers, answers) ||
                const DeepCollectionEquality().equals(other.answers, answers)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(qid) ^
      const DeepCollectionEquality().hash(tries) ^
      const DeepCollectionEquality().hash(seconds) ^
      const DeepCollectionEquality().hash(answers);

  @JsonKey(ignore: true)
  @override
  $NewAnswerCopyWith<NewAnswer> get copyWith =>
      _$NewAnswerCopyWithImpl<NewAnswer>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<SummaryAnswer> answers) remove,
    required TResult Function(
            int qid, int tries, int seconds, List<String> answers)
        answer,
  }) {
    return answer(qid, tries, seconds, answers);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<SummaryAnswer> answers)? remove,
    TResult Function(int qid, int tries, int seconds, List<String> answers)?
        answer,
    required TResult orElse(),
  }) {
    if (answer != null) {
      return answer(qid, tries, seconds, answers);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Remove value) remove,
    required TResult Function(NewAnswer value) answer,
  }) {
    return answer(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Remove value)? remove,
    TResult Function(NewAnswer value)? answer,
    required TResult orElse(),
  }) {
    if (answer != null) {
      return answer(this);
    }
    return orElse();
  }
}

abstract class NewAnswer implements SummaryEvent {
  const factory NewAnswer(
      {required int qid,
      required int tries,
      required int seconds,
      required List<String> answers}) = _$NewAnswer;

  int get qid => throw _privateConstructorUsedError;
  int get tries => throw _privateConstructorUsedError;
  int get seconds => throw _privateConstructorUsedError;
  List<String> get answers => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NewAnswerCopyWith<NewAnswer> get copyWith =>
      throw _privateConstructorUsedError;
}
