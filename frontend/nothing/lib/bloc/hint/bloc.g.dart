// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HintState _$_$_HintStateFromJson(Map<String, dynamic> json) {
  return _$_HintState(
    json['unlocked'] as bool,
    (json['memory'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(int.parse(k), e as bool),
    ),
  );
}

Map<String, dynamic> _$_$_HintStateToJson(_$_HintState instance) =>
    <String, dynamic>{
      'unlocked': instance.unlocked,
      'memory': instance.memory?.map((k, e) => MapEntry(k.toString(), e)),
    };
