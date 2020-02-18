// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Feed _$_$_FeedFromJson(Map<String, dynamic> json) {
  return _$_Feed(
    tree: json['tree'] == null
        ? null
        : QTree.fromJson(json['tree'] as Map<String, dynamic>),
    current: json['current'] as int,
  );
}

Map<String, dynamic> _$_$_FeedToJson(_$_Feed instance) => <String, dynamic>{
      'tree': instance.tree,
      'current': instance.current,
    };
