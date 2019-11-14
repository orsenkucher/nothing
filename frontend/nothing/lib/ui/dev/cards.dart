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
    return SizedBox(child: Container(color: Colors.blue));
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
