// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$Available _$_$AvailableFromJson(Map<String, dynamic> json) {
  return _$Available(
    json['data'] == null
        ? null
        : Data.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$AvailableToJson(_$Available instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

_$Empty _$_$EmptyFromJson(Map<String, dynamic> json) {
  return _$Empty();
}

Map<String, dynamic> _$_$EmptyToJson(_$Empty instance) => <String, dynamic>{};

_$Ignited _$_$IgnitedFromJson(Map<String, dynamic> json) {
  return _$Ignited(
    json['payload'] == null
        ? null
        : ComputeState.fromJson(json['payload'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$IgnitedToJson(_$Ignited instance) => <String, dynamic>{
      'payload': instance.payload,
    };

_$Pending _$_$PendingFromJson(Map<String, dynamic> json) {
  return _$Pending(
    json['payload'] == null
        ? null
        : ComputeState.fromJson(json['payload'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$PendingToJson(_$Pending instance) => <String, dynamic>{
      'payload': instance.payload,
    };
