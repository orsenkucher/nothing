import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

part 'state.freezed.dart';
part 'state.g.dart';

@freezed
abstract class IdState with _$IdState {
  const factory IdState._(String id, String salt) = _IdState;
  factory IdState.salted(String id) => IdState._(id, Uuid().v4());
  factory IdState.unique() => IdState.salted(Uuid().v4());
  factory IdState.fromJson(Map<String, dynamic> json) =>
      _$IdStateFromJson(json);
}
