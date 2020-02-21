// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Summary _$_$_SummaryFromJson(Map<String, dynamic> json) {
  return _$_Summary(
    salt: json['salt'] as int,
    answers: (json['answers'] as List)
        ?.map((e) => e == null
            ? null
            : SummaryAnswer.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$_$_SummaryToJson(_$_Summary instance) =>
    <String, dynamic>{
      'salt': instance.salt,
      'answers': _to(instance.answers),
    };

_$_SummaryAnswer _$_$_SummaryAnswerFromJson(Map<String, dynamic> json) {
  return _$_SummaryAnswer(
    qid: json['qid'] as int,
    tries: json['tries'] as int,
    seconds: json['seconds'] as int,
  );
}

Map<String, dynamic> _$_$_SummaryAnswerToJson(_$_SummaryAnswer instance) =>
    <String, dynamic>{
      'qid': instance.qid,
      'tries': instance.tries,
      'seconds': instance.seconds,
    };
