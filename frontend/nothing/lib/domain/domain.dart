import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'domain.freezed.dart';
part 'domain.g.dart';

@immutable
abstract class Question with _$Question {
  const factory Question(
    List<String> qs,
    @JsonKey(toJson: _to) List<Question> tree,
  ) = _Question;
  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);
}

List<dynamic> _to(List<Question> q) => q.map((f) => f.toJson()).toList();

// List<Question> _from(Map<String, dynamic> json) => json == null
//     ? null
//     : (json['tree'] as List)
//         ?.map((e) =>
//             e == null ? null : Question.fromJson(e as Map<String, dynamic>))
//         ?.toList();

// (json['tree'] as List)
//   ?.map((e) =>
//       e == null ? null : Question.fromJson(e as Map<String, dynamic>))
//   ?.toList(),
