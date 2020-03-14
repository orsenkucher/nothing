// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Resume _$_$_ResumeFromJson(Map<String, dynamic> json) {
  return _$_Resume();
}

Map<String, dynamic> _$_$_ResumeToJson(_$_Resume instance) =>
    <String, dynamic>{};

_$_Suspend _$_$_SuspendFromJson(Map<String, dynamic> json) {
  return _$_Suspend();
}

Map<String, dynamic> _$_$_SuspendToJson(_$_Suspend instance) =>
    <String, dynamic>{};

_$_Just _$_$_JustFromJson(Map<String, dynamic> json) {
  return _$_Just(
    log: (json['log'] as List)
        ?.map((e) => e == null
            ? null
            : TrueLifecycleEvent.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    current: json['current'] == null
        ? null
        : TrueLifecycleEvent.fromJson(json['current'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_JustToJson(_$_Just instance) => <String, dynamic>{
      'log': instance.log,
      'current': instance.current,
    };

_$_Nothing _$_$_NothingFromJson(Map<String, dynamic> json) {
  return _$_Nothing();
}

Map<String, dynamic> _$_$_NothingToJson(_$_Nothing instance) =>
    <String, dynamic>{};
