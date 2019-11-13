import 'package:flutter/material.dart';

class Cards extends StatefulWidget {
  const Cards({
    @required this.children,
    @required this.cardSize,
  });

  final List<Widget> children;
  final Size cardSize;

  @override
  _CardsState createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  int _currentTop = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        for (int i = widget.children.length - 1; i >= 0; i--)
          SwipeCard(
            child: widget.children[i],
            cardSize: widget.cardSize,
            onTop: _currentTop == i,
            idx: i,
          )
      ],
    );
  }
}

class SwipeCard extends StatefulWidget {
  const SwipeCard({
    @required this.child,
    @required this.cardSize,
    @required this.onTop,
    @required this.idx,
  });

  final Widget child;
  final Size cardSize;
  final bool onTop;
  final int idx;

  @override
  _SwipeCardState createState() => _SwipeCardState();
}

class _SwipeCardState extends State<SwipeCard> {
  @override
  didChangeDependencies() {
    super.didChangeDependencies();
    final size = MediaQuery.of(context).size;
    _offset = (size / 2 - widget.cardSize / 2);
    _offset = _offset.translate(0, widget.idx * 10.0);
  }

  Offset _offset;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: _offset.dx,
      top: _offset.dy,
      child: _gestureDetector(
        SizedBox.fromSize(
          size: widget.cardSize,
          child: widget.child,
        ),
        widget.onTop,
      ),
    );
  }

  Widget _gestureDetector(Widget w, bool ok) {
    if (ok) {
      return GestureDetector(
        child: Container(
          child: w,
          color: Colors.red,
        ),
        onHorizontalDragUpdate: (upd) {
          setState(() {
            _offset = _offset.translate(upd.delta.dx, upd.delta.dy);
          });
        },
      );
    }
    return w;
  }
}
