import 'dart:convert';
import 'package:meta/meta.dart';

import 'package:http/http.dart';
import 'package:nothing/error/cloud_error.dart';

import 'model/question.dart';

abstract class QuestionsRepo {
  Future<List<Question>> fetchQuestions({
    @required int count,
    Map<int, bool> summary,
  });
  // Future<void> sendSummary(Map<int, bool> summary);
}

class CloudQuestionsRepo extends QuestionsRepo {
  var fetchProblemsUrl = 'http://34.89.201.1:9090/';

  @override
  Future<List<Question>> fetchQuestions({
    int count,
    Map<int, bool> summary,
  }) async {
    try {
      var body = json.encode({
        "n": count,
        "userId": "007",
        "answers": summary.map((k, v) => MapEntry(k.toString(), v)),
      });
      print("**********");
      print(body);
      var resp = await post(
        fetchProblemsUrl,
        body: body,
      );
      print(resp.body);
      if (resp.statusCode == 200) {
        List<dynamic> decoded = json.decode(resp.body);
        var problems = decoded.map((f) => Question.fromJson(f)).toList();
        if (problems.length == count) {
          return problems;
        }
      }
      throw null;
    } catch (_) {
      throw CloudError(error: "Coud not fetch problems");
    }
  }
}

class LocalQuestionsRepo extends QuestionsRepo {
  List<Question> _local = [
    Question(
      id: 10,
      question: "Have you achieved any of your recent goals?",
      left: "No",
      right: "Yes!",
      leftn: 10,
      rightn: 30,
    ),
    Question(
      id: 15,
      question: "Marvel vs DC",
      left: "Marvel",
      right: "DC",
      leftn: 30,
      rightn: 5,
    ),
    Question(
      id: 47,
      question: "Have you ever been drunk AF?",
      left: "Nope🙅🏿‍♂️",
      right: "Yep🕶))0)",
      leftn: 1234,
      rightn: 12444,
    ),
    Question(
      id: 133,
      question: "Any kids?",
      left: "My sin",
      right: "I'm clean",
      leftn: 30,
      rightn: 5,
    ),
    Question(
      id: 97825,
      question: "Want more?)",
      left: "Никак нет",
      right: "Sure",
      leftn: 97825,
      rightn: 97825 * 3,
    ),
    Question(
      id: 107825,
      question: "More for ad?",
      left: "YES",
      right: "YES",
      leftn: 0,
      rightn: 0,
    ),
  ];

  @override
  Future<List<Question>> fetchQuestions({
    int count,
    Map<int, bool> summary,
  }) {
    return Future.delayed(
      Duration(milliseconds: 1500),
      () => _local,
    );
  }

  Future<void> sendSummary(Map<int, bool> summary) async {}
}
