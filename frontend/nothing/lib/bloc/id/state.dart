import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'state.freezed.dart';
part 'state.g.dart';

@freezed
abstract class IdState with _$IdState {
  const factory IdState(String id, String salt) = _IdState;

  factory IdState.fromJson(Map<String, dynamic> json) =>
      _$IdStateFromJson(json);
}
