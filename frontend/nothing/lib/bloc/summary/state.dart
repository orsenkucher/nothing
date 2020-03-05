import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter/foundation.dart';

part 'state.freezed.dart';
part 'state.g.dart';

@freezed
abstract class SummaryState with _$SummaryState {
  const factory SummaryState({
    @required @JsonKey(toJson: _to) List<SummaryAnswer> answers,
  }) = _SummaryState;

  factory SummaryState.empty() => SummaryState(answers: List<SummaryAnswer>());

  factory SummaryState.fromJson(Map<String, dynamic> json) =>
      _$SummaryStateFromJson(json);
}

List<dynamic> _to(List<SummaryAnswer> ss) =>
    ss?.map((s) => s.toJson())?.toList();

@freezed
abstract class SummaryAnswer with _$SummaryAnswer {
  const factory SummaryAnswer({
    int qid,
    int tries,
    int seconds,
  }) = _SummaryAnswer;

  factory SummaryAnswer.fromJson(Map<String, dynamic> json) =>
      _$SummaryAnswerFromJson(json);
}
