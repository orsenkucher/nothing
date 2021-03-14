import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nothing/bloc/summary/bloc.dart';

part 'event.freezed.dart';

@freezed
class SummaryEvent with _$SummaryEvent {
  const factory SummaryEvent.remove(List<SummaryAnswer> answers) = Remove;
  const factory SummaryEvent.answer({
    required int qid,
    required int tries,
    required int seconds,
    required List<String> answers,
  }) = NewAnswer;
}
