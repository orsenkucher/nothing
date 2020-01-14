import 'package:flutter/material.dart';

class NothingScheme extends InheritedWidget {
  Color get background => const Color(0xff1d2021);
  Color get card => const Color(0xff32302f);
  Color get cardborder => const Color(0xffa89984);
  Color get shadow => Colors.black.withAlpha(60);
  Color get textbase => const Color(0xff83a598);
  Color get textleft => const Color(0xffd3869b);
  Color get textright => const Color(0xff8ec07c);
  Color get question => const Color(0xffd5c4a1);
  Color get sliderleft => const Color(0xff665c54);
  Color get sliderright => const Color(0xffd5c4a1);
  Color get slidertextleft => const Color(0xff1d2021);
  Color get slidertextright => const Color(0xfffbf1c7);

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
