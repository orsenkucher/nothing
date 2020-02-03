import 'package:flutter/material.dart';

class NothingScheme extends InheritedWidget {
  static Color app = const Color(0xff2e68e9);
  Color get background => app;
  Color get card => const Color(0xfffafafa);
  Color get cardborder => const Color(0x00ffffff);
  Color get shadow => Colors.black.withAlpha(60);
  Color get textbase => const Color(0xffdddddd);
  Color get textleft => const Color(0xffdc1a1a);
  Color get textright => const Color(0xff44d818);
  Color get question => const Color(0xff000000);
  Color get sliderleft => const Color(0xffdc1a1a);
  Color get sliderright => const Color(0xff44d818);
  Color get previoustext => const Color(0xffffffff);

  const NothingScheme({
    Key key,
    @required Widget child,
  }) : super(key: key, child: child);

  static NothingScheme of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<NothingScheme>();
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return false;
  }
}
