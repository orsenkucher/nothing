// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
SummaryState _$SummaryStateFromJson(Map<String, dynamic> json) {
  return _SummaryState.fromJson(json);
}

class _$SummaryStateTearOff {
  const _$SummaryStateTearOff();

  _SummaryState call(
      {@required @JsonKey(toJson: _to) List<SummaryAnswer> answers}) {
    return _SummaryState(
      answers: answers,
    );
  }
}

// ignore: unused_element
const $SummaryState = _$SummaryStateTearOff();

mixin _$SummaryState {
  @JsonKey(toJson: _to)
  List<SummaryAnswer> get answers;

  Map<String, dynamic> toJson();
  $SummaryStateCopyWith<SummaryState> get copyWith;
}

abstract class $SummaryStateCopyWith<$Res> {
  factory $SummaryStateCopyWith(
          SummaryState value, $Res Function(SummaryState) then) =
      _$SummaryStateCopyWithImpl<$Res>;
  $Res call({@JsonKey(toJson: _to) List<SummaryAnswer> answers});
}

class _$SummaryStateCopyWithImpl<$Res> implements $SummaryStateCopyWith<$Res> {
  _$SummaryStateCopyWithImpl(this._value, this._then);

  final SummaryState _value;
  // ignore: unused_field
  final $Res Function(SummaryState) _then;

  @override
  $Res call({
    Object answers = freezed,
  }) {
    return _then(_value.copyWith(
      answers:
          answers == freezed ? _value.answers : answers as List<SummaryAnswer>,
    ));
  }
}

abstract class _$SummaryStateCopyWith<$Res>
    implements $SummaryStateCopyWith<$Res> {
  factory _$SummaryStateCopyWith(
          _SummaryState value, $Res Function(_SummaryState) then) =
      __$SummaryStateCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(toJson: _to) List<SummaryAnswer> answers});
}

class __$SummaryStateCopyWithImpl<$Res> extends _$SummaryStateCopyWithImpl<$Res>
    implements _$SummaryStateCopyWith<$Res> {
  __$SummaryStateCopyWithImpl(
      _SummaryState _value, $Res Function(_SummaryState) _then)
      : super(_value, (v) => _then(v as _SummaryState));

  @override
  _SummaryState get _value => super._value as _SummaryState;

  @override
  $Res call({
    Object answers = freezed,
  }) {
    return _then(_SummaryState(
      answers:
          answers == freezed ? _value.answers : answers as List<SummaryAnswer>,
    ));
  }
}

@JsonSerializable()
class _$_SummaryState with DiagnosticableTreeMixin implements _SummaryState {
  const _$_SummaryState({@required @JsonKey(toJson: _to) this.answers})
      : assert(answers != null);

  factory _$_SummaryState.fromJson(Map<String, dynamic> json) =>
      _$_$_SummaryStateFromJson(json);

  @override
  @JsonKey(toJson: _to)
  final List<SummaryAnswer> answers;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SummaryState(answers: $answers)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SummaryState'))
      ..add(DiagnosticsProperty('answers', answers));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SummaryState &&
            (identical(other.answers, answers) ||
                const DeepCollectionEquality().equals(other.answers, answers)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(answers);

  @override
  _$SummaryStateCopyWith<_SummaryState> get copyWith =>
      __$SummaryStateCopyWithImpl<_SummaryState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SummaryStateToJson(this);
  }
}

abstract class _SummaryState implements SummaryState {
  const factory _SummaryState(
          {@required @JsonKey(toJson: _to) List<SummaryAnswer> answers}) =
      _$_SummaryState;

  factory _SummaryState.fromJson(Map<String, dynamic> json) =
      _$_SummaryState.fromJson;

  @override
  @JsonKey(toJson: _to)
  List<SummaryAnswer> get answers;
  @override
  _$SummaryStateCopyWith<_SummaryState> get copyWith;
}

SummaryAnswer _$SummaryAnswerFromJson(Map<String, dynamic> json) {
  return _SummaryAnswer.fromJson(json);
}

class _$SummaryAnswerTearOff {
  const _$SummaryAnswerTearOff();

  _SummaryAnswer call(
      {@required int qid,
      @required int tries,
      @required int seconds,
      @required @JsonKey(toJson: _toS) List<String> answers}) {
    return _SummaryAnswer(
      qid: qid,
      tries: tries,
      seconds: seconds,
      answers: answers,
    );
  }
}

// ignore: unused_element
const $SummaryAnswer = _$SummaryAnswerTearOff();

mixin _$SummaryAnswer {
  int get qid;
  int get tries;
  int get seconds;
  @JsonKey(toJson: _toS)
  List<String> get answers;

  Map<String, dynamic> toJson();
  $SummaryAnswerCopyWith<SummaryAnswer> get copyWith;
}

abstract class $SummaryAnswerCopyWith<$Res> {
  factory $SummaryAnswerCopyWith(
          SummaryAnswer value, $Res Function(SummaryAnswer) then) =
      _$SummaryAnswerCopyWithImpl<$Res>;
  $Res call(
      {int qid,
      int tries,
      int seconds,
      @JsonKey(toJson: _toS) List<String> answers});
}

class _$SummaryAnswerCopyWithImpl<$Res>
    implements $SummaryAnswerCopyWith<$Res> {
  _$SummaryAnswerCopyWithImpl(this._value, this._then);

  final SummaryAnswer _value;
  // ignore: unused_field
  final $Res Function(SummaryAnswer) _then;

  @override
  $Res call({
    Object qid = freezed,
    Object tries = freezed,
    Object seconds = freezed,
    Object answers = freezed,
  }) {
    return _then(_value.copyWith(
      qid: qid == freezed ? _value.qid : qid as int,
      tries: tries == freezed ? _value.tries : tries as int,
      seconds: seconds == freezed ? _value.seconds : seconds as int,
      answers: answers == freezed ? _value.answers : answers as List<String>,
    ));
  }
}

abstract class _$SummaryAnswerCopyWith<$Res>
    implements $SummaryAnswerCopyWith<$Res> {
  factory _$SummaryAnswerCopyWith(
          _SummaryAnswer value, $Res Function(_SummaryAnswer) then) =
      __$SummaryAnswerCopyWithImpl<$Res>;
  @override
  $Res call(
      {int qid,
      int tries,
      int seconds,
      @JsonKey(toJson: _toS) List<String> answers});
}

class __$SummaryAnswerCopyWithImpl<$Res>
    extends _$SummaryAnswerCopyWithImpl<$Res>
    implements _$SummaryAnswerCopyWith<$Res> {
  __$SummaryAnswerCopyWithImpl(
      _SummaryAnswer _value, $Res Function(_SummaryAnswer) _then)
      : super(_value, (v) => _then(v as _SummaryAnswer));

  @override
  _SummaryAnswer get _value => super._value as _SummaryAnswer;

  @override
  $Res call({
    Object qid = freezed,
    Object tries = freezed,
    Object seconds = freezed,
    Object answers = freezed,
  }) {
    return _then(_SummaryAnswer(
      qid: qid == freezed ? _value.qid : qid as int,
      tries: tries == freezed ? _value.tries : tries as int,
      seconds: seconds == freezed ? _value.seconds : seconds as int,
      answers: answers == freezed ? _value.answers : answers as List<String>,
    ));
  }
}

@JsonSerializable()
class _$_SummaryAnswer with DiagnosticableTreeMixin implements _SummaryAnswer {
  const _$_SummaryAnswer(
      {@required this.qid,
      @required this.tries,
      @required this.seconds,
      @required @JsonKey(toJson: _toS) this.answers})
      : assert(qid != null),
        assert(tries != null),
        assert(seconds != null),
        assert(answers != null);

  factory _$_SummaryAnswer.fromJson(Map<String, dynamic> json) =>
      _$_$_SummaryAnswerFromJson(json);

  @override
  final int qid;
  @override
  final int tries;
  @override
  final int seconds;
  @override
  @JsonKey(toJson: _toS)
  final List<String> answers;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SummaryAnswer(qid: $qid, tries: $tries, seconds: $seconds, answers: $answers)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SummaryAnswer'))
      ..add(DiagnosticsProperty('qid', qid))
      ..add(DiagnosticsProperty('tries', tries))
      ..add(DiagnosticsProperty('seconds', seconds))
      ..add(DiagnosticsProperty('answers', answers));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SummaryAnswer &&
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
  _$SummaryAnswerCopyWith<_SummaryAnswer> get copyWith =>
      __$SummaryAnswerCopyWithImpl<_SummaryAnswer>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SummaryAnswerToJson(this);
  }
}

abstract class _SummaryAnswer implements SummaryAnswer {
  const factory _SummaryAnswer(
          {@required int qid,
          @required int tries,
          @required int seconds,
          @required @JsonKey(toJson: _toS) List<String> answers}) =
      _$_SummaryAnswer;

  factory _SummaryAnswer.fromJson(Map<String, dynamic> json) =
      _$_SummaryAnswer.fromJson;

  @override
  int get qid;
  @override
  int get tries;
  @override
  int get seconds;
  @override
  @JsonKey(toJson: _toS)
  List<String> get answers;
  @override
  _$SummaryAnswerCopyWith<_SummaryAnswer> get copyWith;
}
