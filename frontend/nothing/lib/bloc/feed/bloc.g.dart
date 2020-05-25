// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$Available _$_$AvailableFromJson(Map<String, dynamic> json) {
  return _$Available(
    tree: json['tree'] == null
        ? null
        : QTree.fromJson(json['tree'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$AvailableToJson(_$Available instance) =>
    <String, dynamic>{
      'tree': _toT(instance.tree),
    };

_$Pending _$_$PendingFromJson(Map<String, dynamic> json) {
  return _$Pending(
    oldTree: json['oldTree'] == null
        ? null
        : QTree.fromJson(json['oldTree'] as Map<String, dynamic>),
    newTree: json['newTree'] == null
        ? null
        : QTree.fromJson(json['newTree'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$PendingToJson(_$Pending instance) => <String, dynamic>{
      'oldTree': _toT(instance.oldTree),
      'newTree': _toT(instance.newTree),
    };

_$Empty _$_$EmptyFromJson(Map<String, dynamic> json) {
  return _$Empty();
}

Map<String, dynamic> _$_$EmptyToJson(_$Empty instance) => <String, dynamic>{};
