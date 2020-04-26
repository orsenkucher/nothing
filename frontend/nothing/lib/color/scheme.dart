import 'package:flutter/material.dart';

class NothingScheme extends InheritedWidget {
  static Color app = const Color(0xfff5f5f5);
  Color get background => app;

  Color get hint => const Color(0xffa946e9);
  Color get skip => const Color(0xfff07025);
  BorderRadiusGeometry get hintBorder =>
      const BorderRadius.all(Radius.circular(12));

  Color get knob => const Color(0xfffdcf3c);
  BorderRadiusGeometry get knobBorder =>
      const BorderRadius.all(Radius.circular(8));

  Color get label => const Color(0xff000000);
  Color get question => const Color(0xff000000);
  Color get answer => const Color(0xff1d2021);
  BorderRadiusGeometry get answerBorder =>
      const BorderRadius.all(Radius.circular(12));
  Color get correct => const Color(0xff88bb33);
  Color get neutral => const Color(0xfffdcf3c);
  Color get wrong => const Color(0xffc02030);

  Color get historyBg => app; //const Color(0xffffffff);

  Brightness get brightness => Brightness.light;

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

extension Shadow$ on Color {
  Color get tint => this.withOpacity(0.5);
}
