import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

typedef Widget CardBuilder(
    BuildContext context, Widget child, int stackIndex, double activeLerp);
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
  final _horizontalMultiplier = 1;
  final _verticalMultiplier = 0;
  AnimationController _controller;
  int _index = 0;
  List<Size> _sizes = List<Size>();
  List<Alignment> _aligns = List<Alignment>();
  double _normedOffset = 0;
  double _normedOffsetAcc = 0;

  Alignment _dragAlignment = Alignment.center;

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
            (gap.width / widget._stackCount) * i, // * 2.5,
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
          behavior: HitTestBehavior.opaque,
          onHorizontalDragUpdate: (upd) {
            _normedOffsetAcc +=
                upd.delta.dx * 2 / MediaQuery.of(context).size.width;
            _normedOffset = min(max(-1, _normedOffsetAcc), 1);
            setState(() {
              assert(_normedOffset >= -1 && _normedOffset <= 1);
            });
            // print(_normedOffset);
            final cardSize = _sizes[0];
            final size = MediaQuery.of(context).size;
            setState(() {
              _dragAlignment += Alignment(
                upd.delta.dx /
                    (size.width - cardSize.width) *
                    2 *
                    _horizontalMultiplier,
                upd.delta.dy /
                    (size.height - cardSize.height) *
                    2 *
                    _verticalMultiplier,
              );
            });
          },
          child: Container(
              // color: Colors.green.withAlpha(50),
              ),
        ),
      ),
    );
  }

  List<Widget> _buildCards(BuildContext context) {
    var start = min(widget._stackCount + _index + 1, widget._totalCount) - 1;
    var end = _index;
    return [
      _buildTransparentCard(context, start),
      for (int i = start - 1; i >= end + 1; i--)
        _buildCard(context, i, i == end + 1),
      _buildFrontCard(context, end),
    ];
  }

  Widget _buildFrontCard(BuildContext context, int idx) {
    var size = _sizes[idx];
    // var align = _aligns[idx];
    return Align(
      alignment: _dragAlignment,
      child: SizedBox(
        width: size.width,
        height: size.height,
        child: widget._cardBuilder(
          context,
          widget._contentBuilder(context, idx),
          // idx == _index,
          idx - _index,
          1,
        ),
      ),
    );
  }

  Widget _buildTransparentCard(BuildContext context, int idx) {
    return Opacity(
      opacity: _normedOffset.abs(),
      child: _buildCard(context, idx),
    );
  }

  Widget _buildCard(BuildContext context, int idx, [beforeLast = false]) {
    final curSize = _sizes[idx];
    final curAlign = _aligns[idx];
    final nextSize = _sizes[idx - 1];
    final nextAlign = _aligns[idx - 1];
    return Align(
      alignment: Alignment.lerp(curAlign, nextAlign, _normedOffset.abs()),
      child: SizedBox(
        width: lerpDouble(curSize.width, nextSize.width, _normedOffset.abs()),
        height:
            lerpDouble(curSize.height, nextSize.height, _normedOffset.abs()),
        child: widget._cardBuilder(
            context,
            widget._contentBuilder(context, idx),
            // idx == _index,
            idx - _index,
            beforeLast ? _normedOffset.abs() : 0),
      ),
    );
  }
}
