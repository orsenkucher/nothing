import 'dart:convert';

import 'package:http/http.dart';
import 'package:nothing/data/model/problem.dart';
import 'package:nothing/error/cloud_error.dart';

abstract class ProblemRepo {
  Future<List<Problem>> fetchProblems(int count);
}

class CloudProblemRepo extends ProblemRepo {
  var fetchProblemsUrl =
      'https://us-central1-crystal-factory.cloudfunctions.net/GiveTasks';

  Future<List<Problem>> fetchProblems(int count) async {
    var resp = await post(fetchProblemsUrl, body: '{"count": $count}');
    print(resp.body);
    if (resp.statusCode == 200) {
      List<dynamic> decoded = json.decode(resp.body);
      return decoded.map((f) => Problem.fromJson(f)).toList();
    } else {
      throw CloudError(error: "Coud not fetch problem");
    }
  }
}

class LocalProblemRepo extends ProblemRepo {
  @override
  Future<List<Problem>> fetchProblems(int count) {
    return Future.delayed(
      Duration(seconds: 6),
      () => List<Problem>.generate(count, (i) {
        return Problem(
          question: "Simulation $i",
          explanation: "It's just a simulation",
          answers: ["On, I knew that"],
        );
      }),
    );
  }
}
