import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

/// Use this mixin on the main App widget
/// to lock entire app in portrait mode
/// Call `super.build(context)` in the main build() method
mixin PortraitLock on StatelessWidget {
  @override
  @mustCallSuper
  Widget build(BuildContext context) {
    _portraitModeOnly();
    return null;
  }

  void _portraitModeOnly() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
}
