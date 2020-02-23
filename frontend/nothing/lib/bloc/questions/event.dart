import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'event.freezed.dart';

@freezed
abstract class QuestionsEvent with _$QuestionsEvent {
  const factory QuestionsEvent.fetch([int currentid]) = Fetch;
  const factory QuestionsEvent.refetch(int currentid) = Refetch;
}
