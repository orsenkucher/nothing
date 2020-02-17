import 'package:flutter/foundation.dart';

part 'event.freezed.dart';

@immutable
abstract class SummaryEvent with _$SummaryEvent {
  const factory SummaryEvent.reset() = Reset;
  const factory SummaryEvent.answer({
    @required int id,
    @required bool answer,
  }) = NewAnswer;
}
