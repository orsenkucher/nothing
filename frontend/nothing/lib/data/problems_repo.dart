import 'dart:convert';

import 'package:http/http.dart';
import 'package:nothing/data/model/problem.dart';
import 'package:nothing/error/cloud_error.dart';

abstract class ProblemsRepo {
  Future<List<Problem>> fetchProblems(int count);
}

class CloudProblemsRepo extends ProblemsRepo {
  var fetchProblemsUrl =
      'https://us-central1-crystal-factory.cloudfunctions.net/GiveTasks';

  Future<List<Problem>> fetchProblems(int count) async {
    try {
      var resp = await post(fetchProblemsUrl, body: '{"count": $count}');
      print(resp.body);
      if (resp.statusCode == 200) {
        List<dynamic> decoded = json.decode(resp.body);
        return decoded.map((f) => Problem.fromJson(f)).toList();
      } else {
        throw null;
      }
    } catch (_) {
      throw CloudError(error: "Coud not fetch problems");
    }
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
}
