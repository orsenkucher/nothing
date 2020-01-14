import 'package:flutter/material.dart';

class NothingScheme extends InheritedWidget {
  Color get background => const Color(0xff2E68E9);
  Color get card => const Color(0xffFFFFFF);
  Color get cardborder => const Color(0xffB8C8ED);
  Color get shadow => Colors.black.withAlpha(60);
  Color get textbase => const Color(0xffDDDDDD);
  Color get textleft => const Color(0xffDC1A1A);
  Color get textright => const Color(0xff44D818);
  Color get question => const Color(0xff000000);
  Color get sliderleft => const Color(0xffDC1A1A);
  Color get sliderright => const Color(0xff44D818);
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
