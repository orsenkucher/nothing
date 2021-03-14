import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'routes.freezed.dart';

@freezed
class Routes with _$Routes {
  const factory Routes.home() = _Home;
  const factory Routes.history() = _History;
}

extension Routes$ on Routes {
  String get name => this.when(
        home: () => '/',
        history: () => '/history',
      ); // this.toString() is also fine
}
