import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:nothing/domain/domain.dart';

part 'state.freezed.dart';
part 'state.g.dart';

@freezed
abstract class Feed with _$Feed {
  const factory Feed({QTree tree, int current}) = _Feed;
  static Feed get empty => Feed(current: 0, tree: QTree());
  factory Feed.fromJson(Map<String, dynamic> json) => _$FeedFromJson(json);
}
