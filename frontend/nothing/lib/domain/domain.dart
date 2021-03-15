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
class Question with _$Question {
  Question._();

  factory Question({
    required int id,
    required String question,
    required String explanation,
    required String answers,
    required int mmr, // А зочем мне ммр?
  }) = _Question;

  // @late
  // List<String> get splitted => answers.split(r'<$>');

  late final splitted = answers.split(r'<$>');

  factory Question.fromJson(Map<String, dynamic> json) => _$QuestionFromJson(json);
} // our brand new separator: <$>

@freezed
class QTree with _$QTree {
  const factory QTree({Question? question, QTree? left, QTree? right}) = _QTree;
  factory QTree.fromJson(Map<String, dynamic> json) => _$QTreeFromJson(json);
}

enum AdType { interstitial, rewarded }
enum AdMode { one, two, three }
