import 'dart:convert';

import 'package:http/http.dart';
import 'package:meta/meta.dart';
import 'package:nothing/bloc/id/bloc.dart';
import 'package:nothing/domain/domain.dart';
import 'package:nothing/error/cloud_error.dart';

abstract class QuestionsRepo {
  const QuestionsRepo();

  Future<QTree> fetchQuestions({
    @required int count,
    Map<int, bool> summary,
  });
}

class CloudQuestionsRepo extends QuestionsRepo {
  final IdBloc idBloc;
  final fetchProblemsUrl = 'http://34.89.201.1:9091/';
  // String userID;

  const CloudQuestionsRepo(this.idBloc);

  @override
  Future<QTree> fetchQuestions({
    int count,
    Map<int, bool> summary,
  }) async {
    final userID = idBloc.state.id;
    try {
      // var body = json.encode({
      //   "n": count,
      //   "userId": userID,
      //   "answers": summary.map((k, v) => MapEntry(k.toString(), v)),
      // });
      print('USERID: $userID');
      var body = json.encode({"currentid": -1, "userid": userID});
      print('Sending request\n$body');
      var resp = await post(
        fetchProblemsUrl,
        body: body,
      );
      print('Received response\n${resp.body}');
      if (resp.statusCode == 200) {
        var decoded = json.decode(resp.body);
        // var problems = decoded.map((f) => Question.fromJson(f)).toList();
        // if (problems.length == count) {
        //   return problems;
        // }
        var tr = QTree.fromJson(decoded);
        print(tr);
        return tr;
      }
      throw null;
    } catch (_) {
      throw CloudError(error: "Coud not fetch problems");
    }
  }

  // Future<String> _loadUserID() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final userID = prefs.getString('userid') ?? _createUserID(prefs);
  //   print('UserID loaded: $userID');
  //   return userID;
  // }

  // Future<String> _createUserID(SharedPreferences prefs) async {
  //   final newID = Uuid().v4();
  //   await prefs.setString('userid', newID);
  //   print('New UserID created: $newID');
  //   return newID;
  // }
}

class LocalQuestionsRepo extends QuestionsRepo {
  @override
  Future<QTree> fetchQuestions({
    int count,
    Map<int, bool> summary,
  }) {
    return Future.delayed(
      Duration(milliseconds: 800), // 800 1800 2800 server delays
      () => _local,
    );
  }

  QTree _local = QTree(
    question: Question(
      id: 17,
      question: "1 2 6 24 ?",
      explanation: "No",
      answers: "Yes!|yes",
    ),
    left: QTree(
      question: Question(
        id: 10,
        question: "2 Have you achieved any of your recent goals?",
        explanation: "No",
        answers: "Yes!|yes",
      ),
      right: QTree(
        question: Question(
          id: 10,
          question: "3 Have you achieved any of your recent goals?",
          explanation: "No",
          answers: "Yes!|yes",
        ),
        left: QTree(
          question: Question(
            id: 10,
            question: "4 Have you achieved any of your recent goals?",
            explanation: "No",
            answers: "Yes!|yes",
          ),
        ),
      ),
    ),
  );
}
