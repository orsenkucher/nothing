import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter/foundation.dart';

part 'state.freezed.dart';
part 'state.g.dart';

@freezed
abstract class Summary with _$Summary {
  const factory Summary({
    // @required int currentid,
    // @required String userid,
    @required int salt,
    @required @JsonKey(toJson: _to) List<SummaryAnswer> answers,
  }) = _Summary;

  factory Summary.empty() => Summary(salt: 0, answers: List<SummaryAnswer>());

  factory Summary.fromJson(Map<String, dynamic> json) =>
      _$SummaryFromJson(json);
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
