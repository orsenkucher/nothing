import 'dart:convert';

import 'package:http/http.dart';
import 'package:nothing/domain/domain.dart';
import 'package:nothing/error/cloud_error.dart';
import 'package:nothing/repository/server.dart';

abstract class AdRepo {
  const AdRepo();

  Future<AdMode> register(String userId);
  Future<void> report(String userId, AdType adType);
}

class CloudAdRepo extends AdRepo {
  Future<AdMode> register(String userId) async {
    try {
      final body = json.encode({
        "userid": userId,
      });
      print('adReport\n$body');
      var resp = await post(
        addressWith(Route.registerAd),
        body: body,
      );
      if (resp.statusCode == 200) {
        var decoded = json.decode(resp.body);
        var mode = AdMode.values[decoded["admode"]];
        print(mode);
        return mode;
      }
      throw Never;
    } catch (_) {
      throw CloudError(error: "Could not register ad user");
    }
  }

  Future<void> report(String userId, AdType adType) async {
    try {
      final body = json.encode({
        "userid": userId,
        "adtype": adType.index,
      });
      print('Sending request\n$body');
      var resp = await post(
        addressWith(Route.reportAd),
        body: body,
      );
      if (resp.statusCode == 200) return;
      throw Never;
    } catch (_) {
      throw CloudError(error: "Could not report ad watch");
    }
  }
}

class LocalAdRepo extends AdRepo {
  Future<AdMode> register(String userId) async {
    print("AdRepo: registering $userId");
    return AdMode.one;
  }

  Future<void> report(String userId, AdType adType) {
    print("AdRepo: reporting $userId used type: $adType");
    return Future.value();
  }
}
