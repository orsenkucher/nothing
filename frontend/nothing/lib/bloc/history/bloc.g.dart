// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HistoryItem _$_$_HistoryItemFromJson(Map<String, dynamic> json) {
  return _$_HistoryItem(
    answer: json['answer'] == null
        ? null
        : SummaryAnswer.fromJson(json['answer'] as Map<String, dynamic>),
    question: json['question'] == null
        ? null
        : Question.fromJson(json['question'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_HistoryItemToJson(_$_HistoryItem instance) =>
    <String, dynamic>{
      'answer': instance.answer,
      'question': instance.question,
    };

_$_State _$_$_StateFromJson(Map<String, dynamic> json) {
  return _$_State(
    ids: (json['ids'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(int.parse(k), e as bool),
    ),
    items: (json['items'] as List)
        ?.map((e) =>
            e == null ? null : HistoryItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$_$_StateToJson(_$_State instance) => <String, dynamic>{
      'ids': instance.ids?.map((k, e) => MapEntry(k.toString(), e)),
      'items': instance.items,
    };
