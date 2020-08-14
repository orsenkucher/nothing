import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class FadeIn extends HookWidget {
  const FadeIn({@required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    const dur = Duration(milliseconds: 200);
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
