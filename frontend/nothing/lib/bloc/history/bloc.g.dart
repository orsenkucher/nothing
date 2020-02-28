// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_State _$_$_StateFromJson(Map<String, dynamic> json) {
  return _$_State(
    ids: (json['ids'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(int.parse(k), e as bool),
    ),
    answers: (json['answers'] as List)
        ?.map((e) => e == null
            ? null
            : SummaryAnswer.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$_$_StateToJson(_$_State instance) => <String, dynamic>{
      'ids': instance.ids?.map((k, e) => MapEntry(k.toString(), e)),
      'answers': _to(instance.answers),
    };
