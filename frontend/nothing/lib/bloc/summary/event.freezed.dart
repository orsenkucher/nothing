// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$SummaryEventTearOff {
  const _$SummaryEventTearOff();

  Reset reset() {
    return const Reset();
  }

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

// ignore: unused_element
const $SummaryEvent = _$SummaryEventTearOff();

mixin _$SummaryEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result reset(),
    @required
        Result answer(int qid, int tries, int seconds, List<String> answers),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result reset(),
    Result answer(int qid, int tries, int seconds, List<String> answers),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result reset(Reset value),
    @required Result answer(NewAnswer value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result reset(Reset value),
    Result answer(NewAnswer value),
    @required Result orElse(),
  });
}

abstract class $SummaryEventCopyWith<$Res> {
  factory $SummaryEventCopyWith(
          SummaryEvent value, $Res Function(SummaryEvent) then) =
      _$SummaryEventCopyWithImpl<$Res>;
}

class _$SummaryEventCopyWithImpl<$Res> implements $SummaryEventCopyWith<$Res> {
  _$SummaryEventCopyWithImpl(this._value, this._then);

  final SummaryEvent _value;
  // ignore: unused_field
  final $Res Function(SummaryEvent) _then;
}

abstract class $ResetCopyWith<$Res> {
  factory $ResetCopyWith(Reset value, $Res Function(Reset) then) =
      _$ResetCopyWithImpl<$Res>;
}

class _$ResetCopyWithImpl<$Res> extends _$SummaryEventCopyWithImpl<$Res>
    implements $ResetCopyWith<$Res> {
  _$ResetCopyWithImpl(Reset _value, $Res Function(Reset) _then)
      : super(_value, (v) => _then(v as Reset));

  @override
  Reset get _value => super._value as Reset;
}

class _$Reset with DiagnosticableTreeMixin implements Reset {
  const _$Reset();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SummaryEvent.reset()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'SummaryEvent.reset'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Reset);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result reset(),
    @required
        Result answer(int qid, int tries, int seconds, List<String> answers),
  }) {
    assert(reset != null);
    assert(answer != null);
    return reset();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result reset(),
    Result answer(int qid, int tries, int seconds, List<String> answers),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (reset != null) {
      return reset();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result reset(Reset value),
    @required Result answer(NewAnswer value),
  }) {
    assert(reset != null);
    assert(answer != null);
    return reset(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result reset(Reset value),
    Result answer(NewAnswer value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (reset != null) {
      return reset(this);
    }
    return orElse();
  }
}

abstract class Reset implements SummaryEvent {
  const factory Reset() = _$Reset;
}

abstract class $NewAnswerCopyWith<$Res> {
  factory $NewAnswerCopyWith(NewAnswer value, $Res Function(NewAnswer) then) =
      _$NewAnswerCopyWithImpl<$Res>;
  $Res call({int qid, int tries, int seconds, List<String> answers});
}

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

  @override
  $NewAnswerCopyWith<NewAnswer> get copyWith =>
      _$NewAnswerCopyWithImpl<NewAnswer>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result reset(),
    @required
        Result answer(int qid, int tries, int seconds, List<String> answers),
  }) {
    assert(reset != null);
    assert(answer != null);
    return answer(qid, tries, seconds, answers);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result reset(),
    Result answer(int qid, int tries, int seconds, List<String> answers),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (answer != null) {
      return answer(qid, tries, seconds, answers);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result reset(Reset value),
    @required Result answer(NewAnswer value),
  }) {
    assert(reset != null);
    assert(answer != null);
    return answer(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result reset(Reset value),
    Result answer(NewAnswer value),
    @required Result orElse(),
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
  $NewAnswerCopyWith<NewAnswer> get copyWith;
}
