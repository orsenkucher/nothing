import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

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
        assert(stackCount <= totalCount),
        assert(stackCount > 0);

  @override
  _CardsState createState() => _CardsState();
}

class _CardsState extends State<Cards> with SingleTickerProviderStateMixin {
  double _horizontalMultiplier = 1;
  double _verticalMultiplier = 0;
  AnimationController _controller;
  int _index = 0;
  List<Size> _sizes = List<Size>();
  List<Alignment> _aligns = List<Alignment>();
  double _normedOffset = 0;
  double _normedOffsetAcc = 0;
  Animation<Alignment> _animation;

  Alignment _dragAlignment = Alignment.center;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    _controller.addListener(() {
      setState(() {
        _dragAlignment = _animation.value;
        // _normedOffsetAcc += _controller.value;
        // _normedOffset = min(max(-1, _normedOffsetAcc), 1);
      });
    });
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
      var currgapheight = (size.height - _sizes[i].height) / 2;
      _aligns.add(Alignment(
        0.0,
        _sizes[0].height * 0.1 * i / currgapheight,
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
            // print('$_normedOffsetAcc | $_normedOffset');
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
          onHorizontalDragEnd: (details) {
            _runAnimation(
                details.velocity.pixelsPerSecond, MediaQuery.of(context).size);
          },
          child: Container(
              //color: Colors.green.withAlpha(50),
              ),
        ),
      ),
    );
  }

  List<Widget> _buildCards(BuildContext context) {
    var start = min(widget._stackCount + _index + 1, widget._totalCount) - 1;
    var end = _index;
    // print('start: $start; end: $end.');
    // var start = widget._stackCount;
    // var end = 0;
    var tnd = // transparentNeeded
        _index <= widget._totalCount - widget._stackCount - 1;
    return [
      if (tnd) _buildTransparentCard(context, start),
      for (int i = start - (tnd ? 1 : 0); i >= end + 1; i--) //  end + 1
        // for (int i = start - 1; i >= end + 1; i--)
        _buildCard(context, i, i == end + 1),
      if (_index < widget._totalCount) _buildFrontCard(context, end),
    ];
  }

  Widget _buildFrontCard(BuildContext context, int idx) {
    var size = _sizes[0];
    // var align = _aligns[idx];
    return Align(
      alignment: _dragAlignment,
      child: Transform.rotate(
        // origin: Offset(_dragAlignment.x.sign * size.width / 2, size.height / 2),
        angle: (pi / 180.0) * _dragAlignment.x * 1,
        child: SizedBox(
          key: UniqueKey(),
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
    // print(idx);
    final curSize = _sizes[idx - _index];
    final curAlign = _aligns[idx - _index];
    final nextSize = _sizes[idx - 1 - _index];
    final nextAlign = _aligns[idx - 1 - _index];
    final op = 0.1; //0.25;
    return Align(
      alignment: Alignment.lerp(curAlign, nextAlign, _normedOffset.abs()),
      child: SizedBox(
        key: UniqueKey(),
        width: lerpDouble(curSize.width, nextSize.width, _normedOffset.abs()),
        height:
            lerpDouble(curSize.height, nextSize.height, _normedOffset.abs()),
        child: Opacity(
          opacity: 1 -
              lerpDouble(op * (idx - _index), op * (idx - _index - 1),
                  _normedOffset.abs()),
          child: widget._cardBuilder(
              context,
              beforeLast ? widget._contentBuilder(context, idx) : Container(),
              // idx == _index,
              idx - _index,
              beforeLast ? _normedOffset.abs() : 0),
        ),
      ),
    );
  }

// Anim
  void _runAnimation(Offset offset, Size size) {
    if (offset.distanceSquared < 9) {
      _animateBack(offset, size);
    } else {
      _animateOutside(offset, size);
    }
  }

  void _animateOutside(Offset pixelsPerSecond, Size size) {
    var normed = pixelsPerSecond / pixelsPerSecond.distance;
    normed = pixelsPerSecond.scale(
      _horizontalMultiplier,
      _verticalMultiplier,
    );
    normed = normed / normed.distance;
    if (normed.dx.sign != _normedOffset.sign) {
      _animateBack(pixelsPerSecond, size);
      return;
    }
    // final RenderBox cardRenderBox = _cardKey.currentContext.findRenderObject();
    // final cardSize = cardRenderBox.size;
    final cardSize = _sizes[0];
    final ratioX = 1 / (size.width - cardSize.width) * 2;
    final ratioY = 1 / (size.height - cardSize.height) * 2;
    final multiplier = Offset(
      size.width * ratioX,
      size.height * ratioY,
    ).distance;
    // print(multiplier);
    final magnified = normed * multiplier; //* 1.1;
    _animation = _controller.drive(
      AlignmentTween(
        begin: _dragAlignment,
        end: Alignment(magnified.dx, magnified.dy),
      ),
    );

    // _controller.addListener((){});
    // final rndValue = -Random().nextInt(2000);
    final normedSnap = _normedOffset;
    var myl = () {
      // print('outside $rndValue');
      setState(() {
        // _normedOffsetAcc += _controller.value;
        // _normedOffset = min(max(-1, _normedOffsetAcc), 1);
        _normedOffset =
            lerpDouble(normedSnap, 1 * normedSnap.sign, _controller.value);
      });
    };
    final simulation = _simulateSpring(pixelsPerSecond, size);
    _controller.addListener(myl);
    // _normedOffsetAcc = 0;
    _controller.animateWith(simulation).then((_) {
      _controller.removeListener(myl);
      setState(() {
        _index++;
        print(_index);
      });
      setState(() {
        _normedOffsetAcc = 0;
        _normedOffset = 0;
        _dragAlignment = Alignment.center;
      });
    });
  }

  void _animateBack(Offset pixelsPerSecond, Size size) {
    _animation = _controller.drive(
      AlignmentTween(
        begin: _dragAlignment,
        end: Alignment.center,
      ),
    );

    final simulation = _simulateSpring(pixelsPerSecond, size);
    // final rndValue = Random().nextInt(1000);
    final normedSnap = _normedOffset;
    var myl = () {
      // print('back $rndValue');
      setState(() {
        // _normedOffsetAcc -= _controller.value;
        // _normedOffset = min(max(-1, _normedOffsetAcc), 1);
        _normedOffset = lerpDouble(normedSnap, 0, _controller.value);
      });
    };
    _controller.addListener(myl);
    _controller.animateWith(simulation).then((_) {
      _controller.removeListener(myl);
      setState(() {
        _normedOffsetAcc = 0;
        _normedOffset = 0;
      });
    });
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
