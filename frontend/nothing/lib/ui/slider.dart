import 'package:flutter/material.dart';
import 'package:nothing/color/scheme.dart';

class Slider extends StatelessWidget {
  final double value;
  final double height;
  const Slider({
    @required this.value,
    @required this.height,
  }) : assert(value >= 0 && value <= 1);

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
      color: NothingScheme.of(context).sliderleft,
      width: constraints.maxWidth * value,
      height: height,
    );
  }

  Widget _buildbot(BuildContext context, BoxConstraints constraints) {
    return Container(
      color: NothingScheme.of(context).sliderright,
      width: constraints.maxWidth,
      height: height,
    );
  }
}
