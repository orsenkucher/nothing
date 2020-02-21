// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FeedState _$_$_FeedStateFromJson(Map<String, dynamic> json) {
  return _$_FeedState(
    tree: json['tree'] == null
        ? null
        : QTree.fromJson(json['tree'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_FeedStateToJson(_$_FeedState instance) =>
    <String, dynamic>{
      'tree': instance.tree,
    };
