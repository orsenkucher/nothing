import 'package:flutter/material.dart';
import 'package:nothing/bloc/routing/navigatable.dart';
import 'package:nothing/bloc/routing/routes.dart';

typedef Build = Widget Function(BuildContext);

extension Routing on Map<Routes, Build> {
  Map<String, Build> get routed => this.map(
        (route, build) => MapEntry(
          route.name,
          (context) => Navigatable(
            route: route,
            child: build(context),
          ),
        ),
      );
}
