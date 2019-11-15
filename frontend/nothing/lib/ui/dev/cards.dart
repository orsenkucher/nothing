import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

typedef Widget CardBuilder(
    BuildContext context, Widget child, bool active, int stackIndex);
typedef Widget ContentBuilder(BuildContext context, int index);

// Align version
class Cards extends StatefulWidget {
  final CardBuilder _cardBuilder;
  final ContentBuilder _contentBuilder;
  final int _totalCount;
  final int _stackCount;
  final double _widthFactor;
  final double _heightFactor;

  const Cards({
    @required CardBuilder cardBuilder,
    @required ContentBuilder contentBuilder,
    @required int totalCount,
    int stackCount = 3,
    double widthFactor = 0.9,
    double heightFactor = 0.9,
  })  : _cardBuilder = cardBuilder,
        _contentBuilder = contentBuilder,
        _totalCount = totalCount,
        _stackCount = stackCount,
        _widthFactor = widthFactor,
        _heightFactor = heightFactor,
        assert(stackCount <= totalCount);

  @override
  _CardsState createState() => _CardsState();
}

class _CardsState extends State<Cards> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  int _index = 0;
  List<Size> _sizes = List<Size>();
  List<Alignment> _aligns = List<Alignment>();
  double _normedOffset = 0.5;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('didChangeDependencies');
    _sizes.clear();
    _aligns.clear();
    var size = MediaQuery.of(context).size;
    var gap = Size(
      size.width * (1 - widget._widthFactor) / 2,
      size.height * (1 - widget._heightFactor) / 2,
    );
    for (int i = 0; i < widget._stackCount + 1; i++) {
      _sizes.add(Size(
        size.width * widget._widthFactor -
            (gap.width / widget._stackCount) * i * 2.5,
        size.height * widget._heightFactor -
            (gap.height / widget._stackCount) * i,
      ));
      _aligns.add(Alignment(
        0.0,
        (0.7 / (widget._stackCount - 1)) * i,
      ));
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ..._buildCards(context),
        _gestureDetector(context),
      ],
    );
  }

  Widget _gestureDetector(BuildContext context) {
    final mainCardSize = _sizes[0];
    final mainAlign = _aligns[0];
    return Align(
      alignment: mainAlign,
      child: SizedBox(
        width: mainCardSize.width,
        height: mainCardSize.height,
        child: GestureDetector(
          onHorizontalDragUpdate: (upd) {
            setState(() {
              _normedOffset += upd.delta.dx / MediaQuery.of(context).size.width;
            });
          },
          child: Container(color: Colors.green.withAlpha(50)),
        ),
      ),
    );
  }

  List<Widget> _buildCards(BuildContext context) {
    var start = min(widget._stackCount + _index, widget._totalCount) - 1;
    var end = _index;
    return [
      // build transparent card here
      for (int i = start; i >= end + 1; i--) _buildCard(context, i),
      _buildFrontCard(context, end),
    ];
  }

  Widget _buildFrontCard(BuildContext context, int idx) {
    var size = _sizes[idx];
    var align = _aligns[idx];
    return Align(
      alignment: align,
      child: SizedBox(
        width: size.width,
        height: size.height,
        child: widget._cardBuilder(
          context,
          widget._contentBuilder(context, idx),
          idx == _index,
          idx - _index,
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, int idx) {
    final curSize = _sizes[idx];
    final curAlign = _aligns[idx];
    final nextSize = _sizes[idx - 1];
    final nextAlign = _aligns[idx - 1];
    return Align(
      alignment: Alignment.lerp(curAlign, nextAlign, _normedOffset),
      child: SizedBox(
        width: lerpDouble(curSize.width, nextSize.width, _normedOffset),
        height: lerpDouble(curSize.height, nextSize.height, _normedOffset),
        child: widget._cardBuilder(
          context,
          widget._contentBuilder(context, idx),
          idx == _index,
          idx - _index,
        ),
      ),
    );
  }
}
