import 'package:flutter/material.dart';
import 'package:nothing/color/scheme.dart';

class Slider extends StatelessWidget {
  final double value;
  final double height;
  final String left;
  final String right;
  const Slider({
    @required this.value,
    @required this.height,
    String left,
    String right,
  })  : this.left = left ?? '',
        this.right = right ?? '',
        assert(value >= 0 && value <= 1);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: LayoutBuilder(
        builder: (context, constraints) => Stack(
          children: [
            _buildbot(context, constraints), // right
            _buildtop(context, constraints), // left
            _buildtxt(context, constraints), // data
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

  Widget _buildtxt(BuildContext context, BoxConstraints constraints) {
    final r = value > 0.5;
    final color = r
        ? NothingScheme.of(context).slidertextright
        : NothingScheme.of(context).slidertextleft;
    final text = r ? right : left;
    return SizedBox(
      width: constraints.maxWidth,
      height: height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            '$text ${(value * 100).toInt()}%',
            style: TextStyle(
              color: color,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
