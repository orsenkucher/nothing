import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nothing/bloc/xp/bloc.dart';
import 'package:nothing/bloc/xp_queue/bloc.dart';
import 'package:nothing/color/scheme.dart';
import 'package:nothing/ui/slider.dart' as no;

class XP extends StatefulWidget {
  const XP({
    Key key,
    required this.sliderHeight,
    required this.sliderPadding,
    required this.queueBloc,
    required this.xpBloc,
  }) : super(key: key);

  final double sliderHeight;
  final EdgeInsets sliderPadding;
  final XPQueueBloc queueBloc;
  final XPBloc xpBloc;

  @override
  _XPState createState() => _XPState();
}

class _XPState extends State<XP> with SingleTickerProviderStateMixin {
  int phase = 0;
  XPState state;
  bool disposed = false;

  @override
  void initState() {
    super.initState();
    phase = 0;
    () async {
      if (!disposed && widget.queueBloc.state.isEmpty) {
        state = widget.xpBloc.state;
      }
      while (!disposed && widget.queueBloc.state.isNotEmpty) {
        state = widget.queueBloc.state.first;
        if (disposed) break;
        setState(() => phase = 1);
        await Future.delayed(const Duration(milliseconds: 600));
        if (disposed) break;
        setState(() => phase = 2);
        await Future.delayed(const Duration(milliseconds: 600));
        widget.queueBloc.pop();
      }
      if (!disposed) setState(() => phase = 3);
    }();
  }

  @override
  void dispose() {
    disposed = true;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (state == null) return SizedBox.shrink();

    var xp = state.basexp;
    var bon = false;
    if (xp == 0) {
      xp = state.bonusxp;
      bon = true;
    }

    var levelxp = state.levelxp;
    var next = state.totalxp.toDouble() / levelxp;
    var prev = next - xp.toDouble() / levelxp;

    // Case on level overlap. Only 1 overlap is possible per event.
    if (prev < 0) {
      levelxp = state.prevLevelxp;
      prev = 1 - xp.toDouble() / levelxp;
      next = 1;
    }

    if (phase == 0) {
      next = prev;
    }
    if (phase == 2) {
      prev = next;
    }
    if (phase == 3) {
      prev = next;
      xp = 0;
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
        alignment: Alignment.bottomLeft,
        child: Padding(
          padding: widget.sliderPadding,
          child: Text('0'),
        ),
      ),
      Align(
        alignment: Alignment.bottomRight,
        child: Padding(
          padding: widget.sliderPadding,
          child: Text('${levelxp}'),
        ),
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 220),
          child: Text(xp != 0 ? '+${xp} ${bon ? 'bonus' : 'pt'}' : 'level ${state.level}'),
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
