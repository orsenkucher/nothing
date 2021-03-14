import 'package:flutter/material.dart';

class Slider extends StatelessWidget {
  const Slider({
    required this.value,
    required this.height,
    required this.colorleft,
    required this.coloright,
  }) : assert(value >= 0 && value <= 1);

  final double value;
  final double height;
  final Color colorleft;
  final Color coloright;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(6),
      child: LayoutBuilder(
        builder: (context, constraints) => Stack(
          children: [
            _buildbot(context, constraints), // right
            _buildtop(context, constraints), // left
          ],
        ),
      ),
    );
  }

  Widget _buildtop(BuildContext context, BoxConstraints constraints) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOutCubic,
      color: colorleft,
      // decoration: BoxDecoration(color: colorleft, borderRadius: BorderRadius.circular(6)),
      width: constraints.maxWidth * value,
      height: height,
    );
  }

  Widget _buildbot(BuildContext context, BoxConstraints constraints) {
    return Container(
      color: coloright,
      width: constraints.maxWidth,
      height: height,
    );
  }
}
