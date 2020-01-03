import 'dart:convert';

import 'package:http/http.dart';
import 'package:meta/meta.dart';
import 'package:nothing/data/model/question.dart';
import 'package:nothing/error/cloud_error.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

abstract class QuestionsRepo {
  const QuestionsRepo();

  Future<List<Question>> fetchQuestions({
    @required int count,
    Map<int, bool> summary,
  });
}

class CloudQuestionsRepo extends QuestionsRepo {
  final fetchProblemsUrl = 'http://34.89.201.1:9090/';
  String userID;

  @override
  Future<List<Question>> fetchQuestions({
    int count,
    Map<int, bool> summary,
  }) async {
    if (userID == null) {
      userID = await _loadUserID();
    }
    try {
      var body = json.encode({
        "n": count,
        "userId": userID,
        "answers": summary.map((k, v) => MapEntry(k.toString(), v)),
      });
      print('Sending request\n$body');
      var resp = await post(
        fetchProblemsUrl,
        body: body,
      );
      print('Received response\n${resp.body}');
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

  Future<String> _loadUserID() async {
    final prefs = await SharedPreferences.getInstance();
    final userID = prefs.getString('userid') ?? _createUserID(prefs);
    print('UserID loaded: $userID');
    return "orsen-7"; // TODO: Debug
    return userID;
  }

  Future<String> _createUserID(SharedPreferences prefs) async {
    final newID = Uuid().v4();
    await prefs.setString('userid', newID);
    print('New UserID created: $newID');
    return newID;
  }
}

class LocalQuestionsRepo extends QuestionsRepo {
  @override
  Future<List<Question>> fetchQuestions({
    int count,
    Map<int, bool> summary,
  }) {
    return Future.delayed(
      Duration(milliseconds: 800),
      () => _local,
    );
  }

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
}
