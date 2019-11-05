import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

class SwipeCard extends StatefulWidget {
  final Widget child;
  const SwipeCard({
    @required this.child,
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
            details.delta.dx / (size.width - cardSize.width) * 2,
            details.delta.dy / (size.height - cardSize.height) * 2,
          );
        });
      },
      onPanEnd: (details) {
        _runAnimation(details.velocity.pixelsPerSecond, size);
      },
      child: Align(
        alignment: _dragAlignment,
        child: Card(
          key: _cardKey,
          child: widget.child,
        ),
      ),
    );
  }

  void _runAnimation(Offset pixelsPerSecond, Size size) {
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
