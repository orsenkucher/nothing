import 'dart:convert';

import 'package:http/http.dart';
import 'package:nothing/error/cloud_error.dart';
import 'package:nothing/repository/server.dart';

class LikesRepo {
  Future<void> report(int questionId, int like) async {
    try {
      final body = json.encode({
        "questionId": questionId,
        "like": like,
      });
      print('Sending like report\n$body');
      var resp = await post(
        addressWith(Route.reportLike),
        body: body,
      );
      if (resp.statusCode == 200) return;
      throw null;
    } on dynamic catch (_) {
      throw CloudError(error: "Could not report ad watch");
    }
  }
}
