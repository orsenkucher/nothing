import 'dart:convert';

import 'package:http/http.dart';
import 'package:meta/meta.dart';
import 'package:nothing/bloc/summary/bloc.dart';
import 'package:nothing/domain/domain.dart';
import 'package:nothing/error/cloud_error.dart';
import 'package:nothing/repository/server.dart';

abstract class QuestionsRepo {
  const QuestionsRepo();

  Future<QTree> fetchQuestions({
    @required String userID,
    @required int currentID,
    @required List<SummaryAnswer> answers,
  });
}

class CloudQuestionsRepo extends QuestionsRepo {
  const CloudQuestionsRepo();

  @override
  Future<QTree> fetchQuestions({
    String userID,
    int currentID,
    List<SummaryAnswer> answers,
  }) async {
    // final userID = idBloc.state.id;
    try {
      // var body = json.encode({
      //   "n": count,
      //   "userId": userID,
      //   "answers": summary.map((k, v) => MapEntry(k.toString(), v)),
      // });
      print('USERID: $userID');
      var body = json.encode({"currentid": currentID, "userid": userID, "answers": answers});
      print('Sending request\n$body');
      var resp = await post(
        addressWith(Route.questions),
        body: body,
      );
      // print('Received response\n${resp.body}');
      if (resp.statusCode == 200) {
        var decoded = json.decode(resp.body);
        // var problems = decoded.map((f) => Question.fromJson(f)).toList();
        // if (problems.length == count) {
        //   return problems;
        // }
        var tr = QTree.fromJson(decoded);
        // await Future.delayed(Duration(seconds: 10));
        print(tr);
        return tr;
      }
      throw null;
    } catch (_) {
      throw CloudError(error: "Could not fetch problems");
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
    String userID,
    int currentID,
    List<SummaryAnswer> answers,
  }) {
    return Future.delayed(
      Duration(milliseconds: 400), // 800 1800 2800 server delays
      () => _local,
    );
  }

  QTree _local = QTree(
    question: Question(
      id: 1,
      question: "Привет",
      explanation: "Будь вежливым",
      answers: r"привет<$>здравствуй<$>дороуля",
    ),
    left: QTree(
      question: Question(
        id: 2,
        question: "Площадь квадрата с диагональю = √2",
        explanation: "Сторона квадрата = 1",
        answers: r"1<$>один",
      ),
      right: QTree(
        question: Question(
          id: 3,
          question: "М, В, З, М, Ю, С, ?",
          explanation: "Планеты солнечной системы",
          answers: r"У",
        ),
        left: QTree(
          question: Question(
            id: 4,
            question: "Бабочка, авто, самолет, птица, пчела",
            explanation: "Бабочка и пчела умеют летать",
            answers: r"авто",
          ),
        ),
      ),
    ),
  );
}
