import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:nothing/domain/domain.dart';

part 'state.freezed.dart';
part 'state.g.dart';

@freezed
abstract class FeedState with _$FeedState {
  const factory FeedState.available({
    @required @JsonKey(toJson: _toT) QTree tree,
  }) = _Available;
  const factory FeedState.empty() = _Empty;

  factory FeedState.fromJson(Map<String, dynamic> json) =>
      _$FeedStateFromJson(json);
}

Map<String, dynamic> _toT(QTree t) => t?.toJson();
