import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'event.freezed.dart';

@freezed
abstract class QuestionsEvent with _$QuestionsEvent {
  const factory QuestionsEvent.fetch() = Fetch;
  const factory QuestionsEvent.refetch() = Refetch;
}
