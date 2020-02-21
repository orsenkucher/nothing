import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'domain.freezed.dart';
part 'domain.g.dart';

@freezed
abstract class Question with _$Question {
  factory Question({
    int id,
    String question,
    String explanation,
    String answers,
    int mmr, // А зочем мне ммр?
  }) = _Question;

  @late
  List<String> get splitted => answers.split(r'<$>');

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);
} // our brand new separator: <$>

// @JsonKey(toJson: _to) List<Question> tree,
// List<dynamic> _to(List<Question> q) => q.map((f) => f.toJson()).toList();

@freezed
abstract class QTree with _$QTree {
  const factory QTree({
    Question question,
    QTree left,
    QTree right,
  }) = _QTree;

  // const factory QTree.nil() = _NilQTree;

  factory QTree.fromJson(Map<String, dynamic> json) => _$QTreeFromJson(json);
}
