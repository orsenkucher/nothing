import 'dart:math';

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
  List<Offset> _offsets = List<Offset>();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    var size = MediaQuery.of(context).size;
    for (int i = 0; i < widget._stackCount + 1; i++) {
      _sizes.add(Size(
        size.width * widget._widthFactor * (1 - i * 0.04),
        size.height * widget._heightFactor * (1 - i * 0.04),
      ));
      _offsets.add(Offset(
        (size.width - _sizes[i].width) / 2,
        (size.height - _sizes[i].height) / 2 + 20 * i,
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
    final mainOffset = _offsets[0];
    return Positioned(
      left: mainOffset.dx,
      top: mainOffset.dy,
      child: SizedBox(
        width: mainCardSize.width,
        height: mainCardSize.height,
        child: GestureDetector(
          onHorizontalDragUpdate: (upd) {
            print(upd.delta);
          },
          child: Container(color: Colors.green.withAlpha(50)),
        ),
      ),
    );
  }

  List<Widget> _buildCards(BuildContext context) {
    var start = min(widget._stackCount + _index, widget._totalCount) - 1;
    var end = _index;
    return [for (int i = start; i >= end; i--) _buildCard(context, i)];
  }

  Widget _buildCard(BuildContext context, int idx) {
    final curSize = _sizes[idx];
    final curOffset = _offsets[idx];
    return Positioned(
      left: curOffset.dx,
      top: curOffset.dy,
      child: SizedBox(
        width: curSize.width,
        height: curSize.height,
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
