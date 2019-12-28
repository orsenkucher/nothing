import 'package:flutter/material.dart';

class StatsBar extends StatelessWidget {
  final double value;
  final double height;
  const StatsBar({
    @required this.value,
    @required this.height,
  }) : assert(value >= 0 && value <= 1);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: LayoutBuilder(
        builder: (context, constraints) => Stack(
          children: [
            Container(
              color: Colors.red,
              width: constraints.maxWidth,
              height: height,
            ),
            AnimatedContainer(
              duration: Duration(milliseconds: 500),
              curve: Curves.easeOutCubic,
              color: Colors.green,
              width: constraints.maxWidth * value,
              height: height,
            ),
          ],
        ),
      ),
    );
  }
}
