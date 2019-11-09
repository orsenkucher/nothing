import 'dart:math';

import 'package:flutter/material.dart';

class PowerCard extends StatefulWidget {
  final Widget child;

  const PowerCard({
    @required this.child,
  });

  @override
  _PowerCardState createState() => _PowerCardState();
}

class _PowerCardState extends State<PowerCard>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final rotAnim = Tween<double>(begin: 0, end: 0 * pi).animate(_controller);
    final transAnim = RelativeRectTween(
      begin: RelativeRect.fromLTRB(0, 0, 0, 0),
      end: RelativeRect.fromLTRB(100.0 + 100, 150.0 + 100, -300, 150.0 + 100),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.125,
          0.250,
          curve: Curves.easeOutQuint,
        ),
      ),
    );
    return AnimatedBuilder(
      animation: rotAnim,
      child: widget.child,
      builder: (context, child) {
        return PositionedTransition(
          rect: transAnim,
          child: Transform.rotate(
            angle: rotAnim.value,
            child: GestureDetector(
              onTap: () =>
                  _controller.forward().then((_) => _controller.reverse()),
              child: child,
            ),
          ),
        );
      },
    );
  }
}
