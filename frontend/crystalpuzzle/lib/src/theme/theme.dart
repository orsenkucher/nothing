import 'package:flutter/material.dart';

enum ThemeMode {
  Dark,
  Light,
}

final themeMode = {
  ThemeMode.Dark: ThemeData.dark(),
  ThemeMode.Light: ThemeData.light(),
};
