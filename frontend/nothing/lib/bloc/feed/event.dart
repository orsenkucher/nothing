import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:nothing/domain/domain.dart';

part 'event.freezed.dart';

@freezed
abstract class FeedEvent with _$FeedEvent {
  const factory FeedEvent.newArrived(QTree tree) = NewArrived;
  const factory FeedEvent.moveNext(MoveDir dir) = MoveNext;
}

@freezed
abstract class MoveDir with _$MoveDir {
  const factory MoveDir.left() = _Left;
  const factory MoveDir.right() = _Right;
}
