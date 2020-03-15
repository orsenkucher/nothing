import 'package:flutter/material.dart';
import 'package:nothing/bloc/routing/navigatable.dart';
import 'package:nothing/bloc/routing/routes.dart';
import 'package:nothing/ui/history.dart';
import 'package:nothing/ui/home.dart';

typedef Build = Widget Function(BuildContext);

abstract class Mapping {
  static Map<Routes, Build> _mapped = {
    Routes.home(): (_) => Home(),
    Routes.history(): (_) => HistoryList(),
  };

  static Map<String, Build> get mapped =>
      _mapped.map((route, build) => MapEntry(
            route.name,
            (context) => Navigatable(
              route: route.name,
              child: build(context),
            ),
          ));
}
