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

  factory FeedState.ignited(QTree tree) => IgnitedAvailable(
        FeedState.available(tree: tree),
      );
}

Map<String, dynamic> _toT(QTree t) => t?.toJson();

abstract class IgnitedState<S> {
  S get retrieve;
}

class IgnitedAvailable extends _$_Available implements IgnitedState {
  final _Available available;
  IgnitedAvailable(this.available) : super(tree: QTree());

// TODO
// Not so fast..
// state == nextState: true
// nextState == state: false
// omg, bad idea bro
  @override
  bool operator ==(dynamic other) => false;
  @override
  int get hashCode => 0;

  @override
  get retrieve => available;
}
