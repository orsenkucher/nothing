import 'package:flutter/material.dart';
import 'package:nothing/bloc/xp/bloc.dart';
import 'package:nothing/color/scheme.dart';
import 'package:nothing/ui/slider.dart' as no;

class XP extends StatelessWidget {
  const XP({
    @required this.state,
    @required this.sliderHeight,
    @required this.sliderPadding,
  });

  final XPState state;
  final double sliderHeight;
  final EdgeInsets sliderPadding;

  @override
  Widget build(BuildContext context) {
    var xp = state.basexp;
    if (xp == 0) xp = state.bonusxp;
    final next = state.totalxp.toDouble() / state.levelxp;
    var prev = next - xp.toDouble() / state.levelxp;
    return Stack(children: [
      _slider(
        value: next,
        colorleft: NothingScheme.of(context).slidernext,
        coloright: NothingScheme.of(context).sliderback,
      ),
      _slider(
        value: prev,
        colorleft: NothingScheme.of(context).sliderprev,
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 220),
          child: Text('+${xp}pt'),
        ),
      ),
    ]);
  }

  Widget _slider({
    double value = 0,
    Color colorleft,
    Color coloright = Colors.transparent,
  }) {
    return Padding(
      padding: sliderPadding,
      child: no.Slider(
        value: value,
        height: sliderHeight,
        colorleft: colorleft,
        coloright: coloright,
      ),
    );
  }
}
