import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'domain.freezed.dart';
part 'domain.g.dart';

void void$() {}

class DomainException implements Exception {
  final message;
  DomainException([this.message]);

  String toString() {
    if (message == null) return "DomainException";
    return "DomainException: $message";
  }
}

error$() {
  assert(() {
    try {
      throw DomainException();
    } on DomainException catch (error, stack) {
      throw DomainException(stack);
    }
  }());
}

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

  factory Question.fromJson(Map<String, dynamic> json) => _$QuestionFromJson(json);
} // our brand new separator: <$>

@freezed
abstract class QTree with _$QTree {
  const factory QTree({Question question, QTree left, QTree right}) = _QTree;
  factory QTree.fromJson(Map<String, dynamic> json) => _$QTreeFromJson(json);
}

enum AdType { interstitial, rewarded }
enum AdMode { one, two, three }
