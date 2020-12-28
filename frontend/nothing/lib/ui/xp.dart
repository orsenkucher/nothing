import 'package:flutter/material.dart';
import 'package:nothing/bloc/xp/bloc.dart';
import 'package:nothing/color/scheme.dart';
import 'package:nothing/ui/slider.dart' as no;

class XP extends StatefulWidget {
  const XP({
    @required this.state,
    @required this.sliderHeight,
    @required this.sliderPadding,
  });

  final XPState state;
  final double sliderHeight;
  final EdgeInsets sliderPadding;

  @override
  _XPState createState() => _XPState();
}

class _XPState extends State<XP> with SingleTickerProviderStateMixin {
  // AnimationController _controller;
  int phase = 0;

  @override
  void initState() {
    super.initState();
    // _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 220));
    // _controller.forward();
    phase = 0;
    () async {
      await Future.delayed(const Duration(milliseconds: 300));
      setState(() => phase = 1);
      await Future.delayed(const Duration(milliseconds: 600));
      setState(() => phase = 2);
    }();
  }

  @override
  void didUpdateWidget(covariant XP oldWidget) {
    if (oldWidget.state != widget.state) {
      setState(() {
        phase = 0;
        () async {
          await Future.delayed(const Duration(milliseconds: 300));
          setState(() => phase = 1);
          await Future.delayed(const Duration(milliseconds: 600));
          setState(() => phase = 2);
        }();
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  // @override
  // void dispose() {
  //   _controller.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    var xp = widget.state.basexp;
    if (xp == 0) xp = widget.state.bonusxp;
    var next = widget.state.totalxp.toDouble() / widget.state.levelxp;
    var prev = next - xp.toDouble() / widget.state.levelxp;
    if (phase == 0) {
      next = prev;
    }
    if (phase == 2) {
      prev = next;
    }
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
      padding: widget.sliderPadding,
      child: no.Slider(
        value: value,
        height: widget.sliderHeight,
        colorleft: colorleft,
        coloright: coloright,
      ),
    );
  }
}
