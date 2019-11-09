import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

class SwipeCard extends StatefulWidget {
  final Widget child;
  final double horizontalMultiplier;
  final double verticalMultiplier;
  const SwipeCard({
    @required this.child,
    this.horizontalMultiplier = 1,
    this.verticalMultiplier = 1,
  });

  @override
  _SwipeCardState createState() => _SwipeCardState();
}

class _SwipeCardState extends State<SwipeCard>
    with SingleTickerProviderStateMixin {
  Alignment _dragAlignment = Alignment.center;
  AnimationController _controller;
  Animation<Alignment> _animation;
  GlobalKey _cardKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _controller.addListener(() {
      setState(() {
        _dragAlignment = _animation.value;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onPanDown: (details) {
        _controller.stop();
      },
      onPanUpdate: (details) {
        setState(() {
          final RenderBox cardRenderBox =
              _cardKey.currentContext.findRenderObject();
          final cardSize = cardRenderBox.size;
          _dragAlignment += Alignment(
            details.delta.dx /
                (size.width - cardSize.width) *
                2 *
                widget.horizontalMultiplier,
            details.delta.dy /
                (size.height - cardSize.height) *
                2 *
                widget.verticalMultiplier,
          );
        });
      },
      onPanEnd: (details) {
        _runAnimation(details.velocity.pixelsPerSecond, size);
      },
      child: Align(
        alignment: _dragAlignment,
        child: Transform.rotate(
          // angle: (pi / 180.0) *
          //     (_controller.status == AnimationStatus.forward
          //         ? _animation.value
          //         : _dragAlignment.x),
          angle: (pi / 180.0) * _dragAlignment.x,
          child: Container(
            key: _cardKey,
            child: widget.child,
          ),
        ),
      ),
    );
  }

  void _runAnimation(Offset offset, Size size) {
    if (offset.distanceSquared < 9) {
      _animateBack(offset, size);
    } else {
      _animateOutside(offset, size);
    }
  }

  void _animateOutside(Offset pixelsPerSecond, Size size) {
    var normed = pixelsPerSecond / pixelsPerSecond.distance;
    normed = pixelsPerSecond.scale(
      widget.horizontalMultiplier,
      widget.verticalMultiplier,
    );
    normed = normed / normed.distance;
    final RenderBox cardRenderBox = _cardKey.currentContext.findRenderObject();
    final cardSize = cardRenderBox.size;
    final ratioX = 1 / (size.width - cardSize.width) * 2;
    final ratioY = 1 / (size.height - cardSize.height) * 2;
    final multiplier =
        Offset(size.width * ratioX, size.height * ratioY).distance;
    print(multiplier);
    final magnified = normed * multiplier;
    _animation = _controller.drive(
      AlignmentTween(
        begin: _dragAlignment,
        end: Alignment(magnified.dx, magnified.dy),
      ),
    );

    final unitsPerSecondX = pixelsPerSecond.dx / size.width;
    final unitsPerSecondY = pixelsPerSecond.dy / size.height;
    final unitsPerSecond = Offset(unitsPerSecondX, unitsPerSecondY);
    final unitVelocity = unitsPerSecond.distance;

    const spring = SpringDescription(
      mass: 30,
      stiffness: 1,
      damping: 1,
    );

    final simulation = SpringSimulation(spring, 0, 1, -unitVelocity);

    _controller.animateWith(simulation).then((_) {
      sleep(Duration(milliseconds: 500));
      _dragAlignment = Alignment.center;
    });
  }

  void _animateBack(Offset pixelsPerSecond, Size size) {
    _animation = _controller.drive(
      AlignmentTween(
        begin: _dragAlignment,
        end: Alignment.center,
      ),
    );

    final unitsPerSecondX = pixelsPerSecond.dx / size.width;
    final unitsPerSecondY = pixelsPerSecond.dy / size.height;
    final unitsPerSecond = Offset(unitsPerSecondX, unitsPerSecondY);
    final unitVelocity = unitsPerSecond.distance;

    const spring = SpringDescription(
      mass: 30,
      stiffness: 1,
      damping: 1,
    );

    final simulation = SpringSimulation(spring, 0, 1, -unitVelocity);

    _controller.animateWith(simulation);
  }
}
