import 'dart:convert';

import 'package:http/http.dart';
import 'package:nothing/domain/domain.dart';
import 'package:nothing/error/cloud_error.dart';
import 'package:nothing/repository/server.dart';

class AdRepo {
  Future<AdMode> register(String userId) async {
    try {
      final body = json.encode({
        "userid": userId,
      });
      print('Sending request\n$body');
      var resp = await post(
        addressWith(Route.registerAd),
        body: body,
      );
      if (resp.statusCode == 200) {
        var decoded = json.decode(resp.body);
        var mode = decoded["admode"];
        print(mode);
        return mode;
      }
      throw null;
    } on dynamic catch (_) {
      throw CloudError(error: "Could not register ad user");
    }
  }

  Future<void> report(String userId, AdType adType) async {
    try {
      final body = json.encode({
        "userid": userId,
        "adtype": adType,
      });
      print('Sending request\n$body');
      var resp = await post(
        addressWith(Route.registerAd),
        body: body,
      );
      if (resp.statusCode == 200) return;
      throw null;
    } on dynamic catch (_) {
      throw CloudError(error: "Could not report ad watch");
    }
  }
}
