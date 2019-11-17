import 'dart:math';

import 'package:flutter/material.dart';

typedef Widget CardBuilder(
  BuildContext context,
  Widget child,
  int stackIndex,
  double frontLerp,
);

typedef Widget ContentBuilder(
  BuildContext context,
  int index,
);

class Cards2 extends StatefulWidget {
  final CardBuilder _cardBuilder;
  final ContentBuilder _contentBuilder;
  final int _totalCount;
  final int _stackCount;
  final double _widthFactor;
  final double _heightFactor;

  const Cards2({
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
        assert(stackCount <= totalCount),
        assert(stackCount > 0);

  @override
  _Cards2State createState() => _Cards2State();
}

class _Cards2State extends State<Cards2> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  double _horizontalMultiplier = 1;
  double _verticalMultiplier = 0;

  List<Size> _sizes = List<Size>();
  List<Alignment> _aligns = List<Alignment>();

  int _index = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _refillSizes();
    _refillAligns(_sizes);
  }

  void _refillSizes() {
    _sizes.clear();
    final Size full = MediaQuery.of(context).size;
    final gap = Size(
      full.width * (1 - widget._widthFactor) / 2,
      full.height * (1 - widget._heightFactor) / 2,
    );
    final card = Size(
      full.width * widget._widthFactor,
      full.height * widget._heightFactor,
    );
    for (int i = 0; i < widget._stackCount + 1; i++) {
      _sizes.add(Size(
        card.width - (gap.width / widget._stackCount) * i,
        card.height - (gap.height / widget._stackCount) * i,
      ));
    }
  }

  void _refillAligns(List<Size> sizes) {
    _aligns.clear();
    final Size full = MediaQuery.of(context).size;
    for (int i = 0; i < widget._stackCount + 1; i++) {
      var curGapHeight = (full.height - sizes[i].height) / 2;
      _aligns.add(
        Alignment(0.0, 0.1 * sizes[0].height * i / curGapHeight),
      );
    }
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
    final frontSize = _sizes[0];
    final frontAlign = _aligns[0];
    return Align(
      alignment: frontAlign,
      child: SizedBox(
        width: frontSize.width,
        height: frontSize.height,
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onHorizontalDragUpdate: (update) {
            _controller.value += update.delta.dx / 100;
          },
          onHorizontalDragEnd: (end) {},
          child: Container(), // color: Colors.green.withAlpha(50)
        ),
      ),
    );
  }

  bool _transparentCardNeeded() {
    return _index <= widget._totalCount - widget._stackCount - 1;
  }

  List<Widget> _buildCards(BuildContext context) {
    var start = min(widget._stackCount + _index + 1, widget._totalCount) - 1;
    var end = _index;
    var tcn = _transparentCardNeeded();
    return [
      // if (tcn) _buildTransparentCard(context, start),
      for (int i = start - (tcn ? 1 : 0); i >= end + 1; i--)
        _buildCard(context, i - _index, i == end + 1),
      // if (_index < widget._totalCount) _buildFrontCard(context, end),
    ];
  }

  Widget _buildCard(
    BuildContext context,
    int stackIdx, [
    bool underFront = false,
  ]) {
    final size = Tween<Size>(
      begin: _sizes[stackIdx],
      end: _sizes[stackIdx - 1],
    ).animate(_controller);
    final align = Tween<Alignment>(
      begin: _aligns[stackIdx],
      end: _aligns[stackIdx - 1],
    ).animate(_controller);
    final calcOpacity = (int index) {
      const drop = 0.25;
      return max<double>(min<double>(1 - drop * index, 1), 0);
    };
    final opacity = Tween<double>(
      begin: calcOpacity(stackIdx),
      end: calcOpacity(stackIdx - 1),
    ).animate(_controller);
    return AnimatedBuilder(
      animation: _controller,
      child: underFront
          ? widget._contentBuilder(context, stackIdx + _index)
          : Container(),
      builder: (context, child) {
        return Align(
          alignment: align.value,
          child: SizedBox(
            width: size.value.width,
            height: size.value.height,
            child: Opacity(
              opacity: opacity.value,
              child: widget._cardBuilder(
                context,
                child,
                stackIdx,
                underFront ? 1 : 0, // TODO
              ),
            ),
          ),
        );
      },
    );
  }
}
