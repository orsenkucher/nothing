// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SummaryState _$_$_SummaryStateFromJson(Map<String, dynamic> json) {
  return _$_SummaryState(
    answers: (json['answers'] as List)
        ?.map((e) => e == null
            ? null
            : SummaryAnswer.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$_$_SummaryStateToJson(_$_SummaryState instance) =>
    <String, dynamic>{
      'answers': instance.answers,
    };

_$_SummaryAnswer _$_$_SummaryAnswerFromJson(Map<String, dynamic> json) {
  return _$_SummaryAnswer(
    qid: json['qid'] as int,
    tries: json['tries'] as int,
    seconds: json['seconds'] as int,
    answers: _fromJson(json['answers'] as String),
  );
}

Map<String, dynamic> _$_$_SummaryAnswerToJson(_$_SummaryAnswer instance) =>
    <String, dynamic>{
      'qid': instance.qid,
      'tries': instance.tries,
      'seconds': instance.seconds,
      'answers': _toJson(instance.answers),
    };
