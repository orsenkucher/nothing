import 'dart:convert';

import 'package:http/http.dart';
import 'package:nothing/data/model/problem.dart';
import 'package:nothing/error/cloud_error.dart';

import 'model/question.dart';

abstract class QuestionsRepo {
  Future<List<Question>> fetchQuestions(int count);
  Future<void> sendSummary(Map<int, bool> summary);
}

// class CloudQuestionsRepo extends QuestionsRepo {}

class LocalQuestionsRepo extends QuestionsRepo {
  List<Question> _local = [
    Question(
      id: 10,
      question: "Have you achieved any of your recent goals?",
      left: "No",
      right: "Yes!",
    ),
    Question(
      id: 15,
      question: "Marvel vs DC",
      left: "Marvel",
      right: "DC",
    ),
    Question(
      id: 47,
      question: "Have you ever been drunk AF?",
      left: "Nope🙅🏿‍♂️",
      right: "Yep🕶))0)",
    ),
    Question(
      id: 133,
      question: "Any kids?",
      left: "My sin",
      right: "I'm clean",
    ),
    Question(
      id: 97825,
      question: "Want more?)",
      left: "Никак нет",
      right: "Sure",
    ),
    Question(
      id: 107825,
      question: "More for ad?",
      left: "YES",
      right: "YES",
    ),
  ];

  @override
  Future<List<Question>> fetchQuestions(int count) {
    return Future.delayed(
      Duration(milliseconds: 1500),
      () => _local,
    );
  }

  Future<void> sendSummary(Map<int, bool> summary) async {}
}
