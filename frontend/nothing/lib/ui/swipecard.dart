import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

typedef void Swiped(int result);

class SwipeCard extends StatefulWidget {
  final Widget child;
  final double horizontalMultiplier;
  final double verticalMultiplier;
  final int index;
  final bool isActive;
  final Swiped callback;

  const SwipeCard({
    @required Key key,
    @required this.child,
    @required this.index,
    @required this.isActive,
    @required this.callback,
    this.horizontalMultiplier = 1,
    this.verticalMultiplier = 1,
  }) : super(key: key);

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
    final csize =
        (_cardKey.currentContext?.findRenderObject() as RenderBox)?.size ??
            Size.zero;
    return Align(
      alignment: _dragAlignment,
      child: Transform.translate(
        offset: widget.isActive
            ? Offset(0, _dragAlignment.x.abs() * 5 * 2)
            : Offset(0, widget.index * 25.0),
        child: Transform.rotate(
          origin:
              Offset(_dragAlignment.x.sign * csize.width / 2, csize.height / 2),
          // alignment: Alignment(0, -_dragAlignment.x.abs() * 1.2),
          angle: -(pi / 180.0) * _dragAlignment.x * 3,
          child: Transform.scale(
            scale: 1 - widget.index * 0.05,
            child: _gestureDetector(
              Container(
                key: _cardKey,
                child: widget.child,
              ),
              widget.isActive,
            ),
          ),
        ),
      ),
    );
  }

  Widget _gestureDetector(Widget w, bool ok) {
    var size = MediaQuery.of(context).size;
    if (ok) {
      return GestureDetector(
        child: w,
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
      );
    }
    return w;
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
    final multiplier = Offset(
      size.width * ratioX,
      size.height * ratioY,
    ).distance;
    // print(multiplier);
    final magnified = normed * multiplier * 1.1;
    _animation = _controller.drive(
      AlignmentTween(
        begin: _dragAlignment,
        end: Alignment(magnified.dx, magnified.dy),
      ),
    );

    final simulation = _simulateSpring(pixelsPerSecond, size);

    _controller.animateWith(simulation).then((_) {
      widget.callback?.call(_dragAlignment.x.sign.toInt());
      // sleep(Duration(milliseconds: 500));
      // _dragAlignment = Alignment.center;
    });
  }

  void _animateBack(Offset pixelsPerSecond, Size size) {
    _animation = _controller.drive(
      AlignmentTween(
        begin: _dragAlignment,
        end: Alignment.center,
      ),
    );

    final simulation = _simulateSpring(pixelsPerSecond, size);

    _controller.animateWith(simulation);
  }
}

SpringSimulation _simulateSpring(Offset pixelsPerSecond, Size size) {
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
  return simulation;
}
