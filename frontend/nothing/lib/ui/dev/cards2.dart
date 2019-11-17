import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

typedef Widget CardBuilder(
  BuildContext context,
  Widget child,
  int stackIndex,
  double front,
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

class _Cards2State extends State<Cards2> with TickerProviderStateMixin {
  AnimationController _controller;

  double _horizontalMultiplier = 1;
  double _verticalMultiplier = 0;

  Size _screenSize;
  List<Size> _sizes = List<Size>();
  List<Alignment> _aligns = List<Alignment>();

  int _index = 0;
  int _cntIndex = 0;

  // double _frontOffset = 0;
  double _frontOffsetNormed = 0; // [from -1; to 1]

  List<Animation<Alignment>> _animations = List<Animation<Alignment>>();
  // List<int> _animatingCards = List<int>();
  // int _animatingCards = 0;

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
    _screenSize = MediaQuery.of(context).size;
    _refillSizes(_screenSize);
    _refillAligns(_screenSize, _sizes);
  }

  void _refillSizes(Size full) {
    _sizes.clear();
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

  void _refillAligns(Size full, List<Size> sizes) {
    _aligns.clear();
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
        width: _screenSize.width, //  frontSize.width,
        height: frontSize.height,
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onHorizontalDragUpdate: (update) {
            _calcFrontOffset(update.delta);
            _controller.value = _frontOffsetNormed.abs();
          },
          onHorizontalDragEnd: (end) {
            _animate(end.velocity);
          },
          child: Container(), // color: Colors.green.withAlpha(50)
        ),
      ),
    );
  }

  void _animate(Velocity v) {
    final spring = _simulateSpring(v.pixelsPerSecond, _screenSize);
    final controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    final anim = _calcAnimatingAlign(controller);
    _animations.add(anim);
    setState(() {
      _index++;
      // _animatingCards++;
    });
    controller.animateWith(spring).then((_) {
      // _animatingCards--;
      _animations.remove(anim);
      _cntIndex++;
      // controller.dispose();
    });
  }

  void _calcFrontOffset(Offset offset) {
    // _frontOffset += offset.dx / _screenSize.width;
    _frontOffsetNormed += offset.dx / _screenSize.width;
    _frontOffsetNormed = min(max(-1, _frontOffsetNormed), 1);
    setState(() {
      assert(_frontOffsetNormed >= -1 && _frontOffsetNormed <= 1);
    });
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
      for (int i = start - (tcn ? 1 : 0);
          i >= end + 1 + _animations.length;
          i--)
        _buildCard(context, i - _index, i == end + 1),
      if (_index < widget._totalCount)
        _frontCard(context, end),
      for (int i = 0; i < _animations.length; i++) _animatingCard(context, i),
    ];
  }

  Widget _animatingCard(BuildContext context, int shift) {
    final align = _animations[shift];
    return _buildFrontCard(
      _controller,
      context,
      shift,
      align,
    );
  }

  Widget _frontCard(BuildContext context, int stackIdx) {
    final align = _calcFrontAlign(_controller);
    return _buildFrontCard(
      _controller,
      context,
      stackIdx,
      align,
    );
  }

  AnimatedBuilder _buildFrontCard(
    AnimationController controller,
    BuildContext context,
    int stackIdx,
    Animation<Alignment> align,
  ) {
    return AnimatedBuilder(
      animation: controller,
      child: widget._contentBuilder(context, stackIdx + _cntIndex),
      builder: (context, child) {
        return Align(
          alignment: align.value,
          child: Transform.rotate(
            angle:
                _frontOffsetNormed.sign * (pi / 180.0) * 8 * controller.value,
            child: SizedBox(
              width: _sizes[0].width,
              height: _sizes[0].height,
              child: widget._cardBuilder(
                context,
                child,
                stackIdx,
                1,
              ),
            ),
          ),
        );
      },
    );
  }

  Animation<Alignment> _calcFrontAlign(AnimationController controller) {
    final full = _screenSize;
    final card = _sizes[0];
    final gap = Size(
      (full.width - card.width) / 2,
      (full.height - card.height) / 2,
    );
    // print('gap $gap');
    // print('card $card');
    // print('full $full');
    final align = AlignmentTween(
      begin: _aligns[0],
      end: Alignment(
        _frontOffsetNormed.sign * (gap.width + card.width) / gap.width,
        0, // (gap.height + card.height) / gap.height,
      ),
    ).animate(controller);
    return align;
  }

  Animation<Alignment> _calcAnimatingAlign(AnimationController controller) {
    final size = _screenSize;
    final cardSize = _sizes[0];
    final ratioX = 1 / (size.width - cardSize.width) * 2;
    final ratioY = 1 / (size.height - cardSize.height) * 2;
    final multiplier = Offset(
      size.width * ratioX,
      size.height * ratioY,
    ).distance;
    var normed = Offset(_frontOffsetNormed.sign, 0);
    final magnified = normed * multiplier;
    final align = AlignmentTween(
      begin: _aligns[0],
      end: Alignment(magnified.dx, magnified.dy),
    ).animate(controller);
    return align;
  }

  double _calcOpacity(int index) {
    const drop = 0.25;
    return max(min(1 - drop * index, 1), 0);
  }

//  Widget _middleCard(){}
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
    final opacity = Tween<double>(
      begin: _calcOpacity(stackIdx),
      end: _calcOpacity(stackIdx - 1),
    ).animate(_controller);
    return AnimatedBuilder(
      animation: _controller,
      child: underFront
          ? widget._contentBuilder(context, stackIdx + _cntIndex)
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
                underFront ? _controller.value : 0,
              ),
            ),
          ),
        );
      },
    );
  }

  SpringSimulation _simulateSpring(Offset pixelsPerSecond, Size size) {
    final unitsPerSecondX = pixelsPerSecond.dx / size.width;
    final unitsPerSecondY = pixelsPerSecond.dy / size.height;
    final unitsPerSecond = Offset(unitsPerSecondX, unitsPerSecondY);
    final unitVelocity = unitsPerSecond.distance;

    const spring = SpringDescription(
      mass: 40,
      stiffness: 1,
      damping: 1,
    );

    final simulation = SpringSimulation(spring, 0, 1, -unitVelocity);
    return simulation;
  }
}
