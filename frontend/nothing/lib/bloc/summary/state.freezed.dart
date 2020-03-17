// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

SummaryState _$SummaryStateFromJson(Map<String, dynamic> json) {
  return _SummaryState.fromJson(json);
}

mixin _$SummaryState {
  @JsonKey(toJson: _to)
  List<SummaryAnswer> get answers;

  SummaryState copyWith({@JsonKey(toJson: _to) List<SummaryAnswer> answers});

  Map<String, dynamic> toJson();
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

const $SummaryState = _$SummaryStateTearOff();

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
  _$_SummaryState copyWith({
    Object answers = freezed,
  }) {
    return _$_SummaryState(
      answers:
          answers == freezed ? this.answers : answers as List<SummaryAnswer>,
    );
  }

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
  _SummaryState copyWith({@JsonKey(toJson: _to) List<SummaryAnswer> answers});
}

SummaryAnswer _$SummaryAnswerFromJson(Map<String, dynamic> json) {
  return _SummaryAnswer.fromJson(json);
}

mixin _$SummaryAnswer {
  int get qid;
  int get tries;
  int get seconds;
  @JsonKey(toJson: _toS)
  List<String> get answers;

  SummaryAnswer copyWith(
      {int qid,
      int tries,
      int seconds,
      @JsonKey(toJson: _toS) List<String> answers});

  Map<String, dynamic> toJson();
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

const $SummaryAnswer = _$SummaryAnswerTearOff();

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
  _$_SummaryAnswer copyWith({
    Object qid = freezed,
    Object tries = freezed,
    Object seconds = freezed,
    Object answers = freezed,
  }) {
    return _$_SummaryAnswer(
      qid: qid == freezed ? this.qid : qid as int,
      tries: tries == freezed ? this.tries : tries as int,
      seconds: seconds == freezed ? this.seconds : seconds as int,
      answers: answers == freezed ? this.answers : answers as List<String>,
    );
  }

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
  _SummaryAnswer copyWith(
      {int qid,
      int tries,
      int seconds,
      @JsonKey(toJson: _toS) List<String> answers});
}
