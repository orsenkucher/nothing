import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:nothing/domain/domain.dart';

part 'state.freezed.dart';
part 'state.g.dart';

@immutable
abstract class Feed with _$Feed {
  const factory Feed({QTree tree, int current}) = _Feed;
  factory Feed.empty() => _Feed(current: 0, tree: QTree());
  factory Feed.fromJson(Map<String, dynamic> json) => _$FeedFromJson(json);
}
