import 'package:meta/meta.dart';
import 'package:flutter/material.dart';

@immutable
class ThemeModeState {
  final ThemeData themeData;

  ThemeModeState({
    @required this.themeData,
  });
}
