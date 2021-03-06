// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$SummaryEventTearOff {
  const _$SummaryEventTearOff();

// ignore: unused_element
  Remove remove(List<SummaryAnswer> answers) {
    return Remove(
      answers,
    );
  }

// ignore: unused_element
  NewAnswer answer(
      {@required int qid,
      @required int tries,
      @required int seconds,
      @required List<String> answers}) {
    return NewAnswer(
      qid: qid,
      tries: tries,
      seconds: seconds,
      answers: answers,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $SummaryEvent = _$SummaryEventTearOff();

/// @nodoc
mixin _$SummaryEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult remove(List<SummaryAnswer> answers),
    @required
        TResult answer(int qid, int tries, int seconds, List<String> answers),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult remove(List<SummaryAnswer> answers),
    TResult answer(int qid, int tries, int seconds, List<String> answers),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult remove(Remove value),
    @required TResult answer(NewAnswer value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult remove(Remove value),
    TResult answer(NewAnswer value),
    @required TResult orElse(),
  });
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
    Object answers = freezed,
  }) {
    return _then(Remove(
      answers == freezed ? _value.answers : answers as List<SummaryAnswer>,
    ));
  }
}

/// @nodoc
class _$Remove with DiagnosticableTreeMixin implements Remove {
  const _$Remove(this.answers) : assert(answers != null);

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
  TResult when<TResult extends Object>({
    @required TResult remove(List<SummaryAnswer> answers),
    @required
        TResult answer(int qid, int tries, int seconds, List<String> answers),
  }) {
    assert(remove != null);
    assert(answer != null);
    return remove(answers);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult remove(List<SummaryAnswer> answers),
    TResult answer(int qid, int tries, int seconds, List<String> answers),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (remove != null) {
      return remove(answers);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult remove(Remove value),
    @required TResult answer(NewAnswer value),
  }) {
    assert(remove != null);
    assert(answer != null);
    return remove(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult remove(Remove value),
    TResult answer(NewAnswer value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (remove != null) {
      return remove(this);
    }
    return orElse();
  }
}

abstract class Remove implements SummaryEvent {
  const factory Remove(List<SummaryAnswer> answers) = _$Remove;

  List<SummaryAnswer> get answers;
  @JsonKey(ignore: true)
  $RemoveCopyWith<Remove> get copyWith;
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
    Object qid = freezed,
    Object tries = freezed,
    Object seconds = freezed,
    Object answers = freezed,
  }) {
    return _then(NewAnswer(
      qid: qid == freezed ? _value.qid : qid as int,
      tries: tries == freezed ? _value.tries : tries as int,
      seconds: seconds == freezed ? _value.seconds : seconds as int,
      answers: answers == freezed ? _value.answers : answers as List<String>,
    ));
  }
}

/// @nodoc
class _$NewAnswer with DiagnosticableTreeMixin implements NewAnswer {
  const _$NewAnswer(
      {@required this.qid,
      @required this.tries,
      @required this.seconds,
      @required this.answers})
      : assert(qid != null),
        assert(tries != null),
        assert(seconds != null),
        assert(answers != null);

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
  TResult when<TResult extends Object>({
    @required TResult remove(List<SummaryAnswer> answers),
    @required
        TResult answer(int qid, int tries, int seconds, List<String> answers),
  }) {
    assert(remove != null);
    assert(answer != null);
    return answer(qid, tries, seconds, answers);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult remove(List<SummaryAnswer> answers),
    TResult answer(int qid, int tries, int seconds, List<String> answers),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (answer != null) {
      return answer(qid, tries, seconds, answers);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult remove(Remove value),
    @required TResult answer(NewAnswer value),
  }) {
    assert(remove != null);
    assert(answer != null);
    return answer(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult remove(Remove value),
    TResult answer(NewAnswer value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (answer != null) {
      return answer(this);
    }
    return orElse();
  }
}

abstract class NewAnswer implements SummaryEvent {
  const factory NewAnswer(
      {@required int qid,
      @required int tries,
      @required int seconds,
      @required List<String> answers}) = _$NewAnswer;

  int get qid;
  int get tries;
  int get seconds;
  List<String> get answers;
  @JsonKey(ignore: true)
  $NewAnswerCopyWith<NewAnswer> get copyWith;
}
