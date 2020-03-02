// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

Summary _$SummaryFromJson(Map<String, dynamic> json) {
  return _Summary.fromJson(json);
}

mixin _$Summary {
  int get salt;
  @JsonKey(toJson: _to)
  List<SummaryAnswer> get answers;

  Summary copyWith(
      {int salt, @JsonKey(toJson: _to) List<SummaryAnswer> answers});

  Map<String, dynamic> toJson();
}

class _$SummaryTearOff {
  const _$SummaryTearOff();

  _Summary call(
      {@required int salt,
      @required @JsonKey(toJson: _to) List<SummaryAnswer> answers}) {
    return _Summary(
      salt: salt,
      answers: answers,
    );
  }
}

const $Summary = _$SummaryTearOff();

@JsonSerializable()
class _$_Summary with DiagnosticableTreeMixin implements _Summary {
  const _$_Summary(
      {@required this.salt, @required @JsonKey(toJson: _to) this.answers})
      : assert(salt != null),
        assert(answers != null);

  factory _$_Summary.fromJson(Map<String, dynamic> json) =>
      _$_$_SummaryFromJson(json);

  @override
  final int salt;
  @override
  @JsonKey(toJson: _to)
  final List<SummaryAnswer> answers;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Summary(salt: $salt, answers: $answers)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Summary'))
      ..add(DiagnosticsProperty('salt', salt))
      ..add(DiagnosticsProperty('answers', answers));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Summary &&
            (identical(other.salt, salt) ||
                const DeepCollectionEquality().equals(other.salt, salt)) &&
            (identical(other.answers, answers) ||
                const DeepCollectionEquality().equals(other.answers, answers)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(salt) ^
      const DeepCollectionEquality().hash(answers);

  @override
  _$_Summary copyWith({
    Object salt = freezed,
    Object answers = freezed,
  }) {
    return _$_Summary(
      salt: salt == freezed ? this.salt : salt as int,
      answers:
          answers == freezed ? this.answers : answers as List<SummaryAnswer>,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SummaryToJson(this);
  }
}

abstract class _Summary implements Summary {
  const factory _Summary(
          {@required int salt,
          @required @JsonKey(toJson: _to) List<SummaryAnswer> answers}) =
      _$_Summary;

  factory _Summary.fromJson(Map<String, dynamic> json) = _$_Summary.fromJson;

  @override
  int get salt;
  @override
  @JsonKey(toJson: _to)
  List<SummaryAnswer> get answers;

  @override
  _Summary copyWith(
      {int salt, @JsonKey(toJson: _to) List<SummaryAnswer> answers});
}

SummaryAnswer _$SummaryAnswerFromJson(Map<String, dynamic> json) {
  return _SummaryAnswer.fromJson(json);
}

mixin _$SummaryAnswer {
  int get qid;
  int get tries;
  int get seconds;

  SummaryAnswer copyWith({int qid, int tries, int seconds});

  Map<String, dynamic> toJson();
}

class _$SummaryAnswerTearOff {
  const _$SummaryAnswerTearOff();

  _SummaryAnswer call({int qid, int tries, int seconds}) {
    return _SummaryAnswer(
      qid: qid,
      tries: tries,
      seconds: seconds,
    );
  }
}

const $SummaryAnswer = _$SummaryAnswerTearOff();

@JsonSerializable()
class _$_SummaryAnswer with DiagnosticableTreeMixin implements _SummaryAnswer {
  const _$_SummaryAnswer({this.qid, this.tries, this.seconds});

  factory _$_SummaryAnswer.fromJson(Map<String, dynamic> json) =>
      _$_$_SummaryAnswerFromJson(json);

  @override
  final int qid;
  @override
  final int tries;
  @override
  final int seconds;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SummaryAnswer(qid: $qid, tries: $tries, seconds: $seconds)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SummaryAnswer'))
      ..add(DiagnosticsProperty('qid', qid))
      ..add(DiagnosticsProperty('tries', tries))
      ..add(DiagnosticsProperty('seconds', seconds));
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
                const DeepCollectionEquality().equals(other.seconds, seconds)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(qid) ^
      const DeepCollectionEquality().hash(tries) ^
      const DeepCollectionEquality().hash(seconds);

  @override
  _$_SummaryAnswer copyWith({
    Object qid = freezed,
    Object tries = freezed,
    Object seconds = freezed,
  }) {
    return _$_SummaryAnswer(
      qid: qid == freezed ? this.qid : qid as int,
      tries: tries == freezed ? this.tries : tries as int,
      seconds: seconds == freezed ? this.seconds : seconds as int,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SummaryAnswerToJson(this);
  }
}

abstract class _SummaryAnswer implements SummaryAnswer {
  const factory _SummaryAnswer({int qid, int tries, int seconds}) =
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
  _SummaryAnswer copyWith({int qid, int tries, int seconds});
}
