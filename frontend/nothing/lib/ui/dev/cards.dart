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

  const Cards({
    @required CardBuilder cardBuilder,
    @required ContentBuilder contentBuilder,
    @required int totalCount,
    int stackCount = 3,
  })  : _cardBuilder = cardBuilder,
        _contentBuilder = contentBuilder,
        _totalCount = totalCount,
        _stackCount = stackCount,
        assert(stackCount <= totalCount);

  @override
  _CardsState createState() => _CardsState();
}

class _CardsState extends State<Cards> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  int _index = 0;
  List<Size> _sizes;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);

    if (ethereal != null) {
      ethereal.remove();
    }
    ethereal = OverlayEntry(
      opaque: false,
      builder: (context) => etherealGestureBuilder(context),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Overlay.of(context).insert(ethereal);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    ethereal.remove();
    super.dispose();
  }

  Widget etherealGestureBuilder(BuildContext context) {
    final RenderBox cardRenderBox = key.currentContext.findRenderObject();
    final size = cardRenderBox.size;
    return Positioned(
      left: 0,
      top: 0,
      child: SizedBox(
        width: size.width,
        height: size.height,
        child: _gestureDetector(context),
      ),
    );
  }

  OverlayEntry ethereal;
  GlobalKey etherealKey = GlobalKey();
  GlobalKey key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(key: key, child: _buildCard(context, 0)),
        ..._buildCards(context),
      ],
    );
  }

  Widget _gestureDetector(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: (upd) {
        print(upd.delta);
      },
      child: Container(color: Colors.green.withAlpha(50)),
    );
  }

  List<Widget> _buildCards(BuildContext context) {
    var start = min(widget._stackCount + _index, widget._totalCount) - 1;
    var end = _index;
    return [for (int i = start; i >= end; i--) _buildCard(context, i)];
  }

  Widget _buildCard(BuildContext context, int idx) {
    return widget._cardBuilder(
      context,
      widget._contentBuilder(context, idx),
      idx == _index,
      idx - _index,
    );
  }
}
