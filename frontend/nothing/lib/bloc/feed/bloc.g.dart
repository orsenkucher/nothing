// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$Available _$_$AvailableFromJson(Map<String, dynamic> json) {
  return _$Available(
    tree: QTree.fromJson(json['tree'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$AvailableToJson(_$Available instance) =>
    <String, dynamic>{
      'tree': instance.tree,
    };

_$Pending _$_$PendingFromJson(Map<String, dynamic> json) {
  return _$Pending(
    oldTree: QTree.fromJson(json['oldTree'] as Map<String, dynamic>),
    newTree: QTree.fromJson(json['newTree'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$PendingToJson(_$Pending instance) => <String, dynamic>{
      'oldTree': instance.oldTree,
      'newTree': instance.newTree,
    };

_$Empty _$_$EmptyFromJson(Map<String, dynamic> json) {
  return _$Empty(
    json['oldTree'] == null
        ? null
        : QTree.fromJson(json['oldTree'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$EmptyToJson(_$Empty instance) => <String, dynamic>{
      'oldTree': instance.oldTree,
    };
