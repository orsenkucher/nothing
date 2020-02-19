import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter/foundation.dart';

part 'state.freezed.dart';
part 'state.g.dart';

@freezed
abstract class Summary with _$Summary {
  const factory Summary({
    @required int id,
    @required Map<int, bool> summary,
  }) = _Summary;

  factory Summary.empty() => _Summary(summary: Map<int, bool>(), id: 0);

  factory Summary.fromJson(Map<String, dynamic> json) =>
      _$SummaryFromJson(json);
}
