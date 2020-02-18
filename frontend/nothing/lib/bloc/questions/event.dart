import 'package:flutter/foundation.dart';

part 'event.freezed.dart';

@immutable
abstract class QuestionsEvent with _$QuestionsEvent {
  const factory QuestionsEvent.fetch() = Fetch;
  const factory QuestionsEvent.refetch() = Refetch;
}
