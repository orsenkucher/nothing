import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

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
    final offsetAnim = RectTween(
      begin: Rect.fromLTRB(0, 0, 100, 100),
      end: Rect.fromLTRB(100, 100, 200, 200),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.linear,
      ),
    );
    return AnimatedBuilder(
      animation: offsetAnim,
      child: widget.child,
      builder: (context, child) {
        return RelativePositionedTransition(
          // size: MediaQuery.of(context).size,
          size: Size(0, 0),
          // position: offsetAnim,
          rect: offsetAnim,
          child: GestureDetector(
            onTap: () {
              _controller.forward().then((_) => _controller.reverse());
            },

            // onTap: () {
            //   const spring = SpringDescription(
            //     mass: 30,
            //     stiffness: 1,
            //     damping: 1,
            //   );

            //   final simulation = SpringSimulation(spring, 0, 1, 0);
            //   _controller
            //       .animateWith(simulation)
            //       // .animateTo()
            //       .then((_) => _controller.reverse());
            //   // _controller.forward().then((_) => _controller.reverse());
            // },

            child: child,
          ),
        );
      },
    );
  }
}
