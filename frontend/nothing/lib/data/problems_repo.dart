import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart';
import 'package:nothing/data/model/problem.dart';
import 'package:nothing/error/cloud_error.dart';

abstract class ProblemsRepo {
  Future<List<Problem>> fetchProblems(int count);
  Future<void> sendSummary(Map<int, bool> summary);
}

class CloudProblemsRepo extends ProblemsRepo {
  var fetchProblemsUrl =
      'https://us-central1-crystal-factory.cloudfunctions.net/GiveProblems';

  Future<List<Problem>> fetchProblems(int count) async {
    var doc =
        await Firestore.instance.document('problems/logic/problems/10').get();

    try {
      var body = json.encode({
        "count": count,
        "group": "logic",
        "ids": ["4VFtjjzlmSglRaEQ4p5b7zdAQxo1"]
      });
      var resp = await post(
        fetchProblemsUrl,
        body: body,
      );
      print(resp.body);
      if (resp.statusCode == 200) {
        List<dynamic> decoded = json.decode(resp.body);
        var problems = decoded.map((f) => Problem.fromJson(f)).toList();
        if (problems.length == count) {
          return problems;
        }
      }
      throw null;
    } catch (_) {
      throw CloudError(error: "Coud not fetch problems");
    }
  }

  var sendSummaryUrl =
      'https://us-central1-crystal-factory.cloudfunctions.net/ProcessAnswers';

  Future<void> sendSummary(Map<int, bool> summary) async {
    var summaryJson = json.encode(
      summary.map((k, v) => MapEntry(k.toString(), v)),
    );
    var body = json.encode({
      "id": "4VFtjjzlmSglRaEQ4p5b7zdAQxo1",
      "group": "logic",
      "summary": summaryJson
    });
    var resp = await post(
      sendSummaryUrl,
      body: body,
    );
    print(resp.statusCode);
  }
}

class LocalProblemsRepo extends ProblemsRepo {
  @override
  Future<List<Problem>> fetchProblems(int count) {
    return Future.delayed(
      Duration(seconds: 4),
      () => List<Problem>.generate(count, (i) {
        return Problem(
          id: i,
          question: "Simulation $i",
          explanation: "It's just a simulation",
          answers: ["Oh, I knew that", "Know", "I know"],
        );
      }),
    );
  }

  Future<void> sendSummary(Map<int, bool> summary) async {}
}
