// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Summary _$_$_SummaryFromJson(Map<String, dynamic> json) {
  return _$_Summary(
    id: json['id'] as int,
    summary: (json['summary'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(int.parse(k), e as bool),
    ),
  );
}

Map<String, dynamic> _$_$_SummaryToJson(_$_Summary instance) =>
    <String, dynamic>{
      'id': instance.id,
      'summary': instance.summary?.map((k, e) => MapEntry(k.toString(), e)),
    };
