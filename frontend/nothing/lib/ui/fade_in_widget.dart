import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class FadeInWidget extends HookWidget {
  const FadeInWidget({@required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    const dur = Duration(milliseconds: 250);
    const cur = Curves.easeIn;
    final contr = useAnimationController(duration: dur);
    final anim = CurvedAnimation(curve: cur, parent: contr);

    useEffect(() {
      contr.forward();
      return null;
    });

    return AnimatedBuilder(
      animation: contr,
      child: child,
      builder: (context, child) => Opacity(
        opacity: anim.value,
        child: child,
      ),
    );
  }
}
