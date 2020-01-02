import 'dart:math';

import 'package:flutter/foundation.dart';
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
  double lerp,
);

typedef void OnSwipe(
  BuildContext context,
  int index,
  double direction,
);

typedef void OnDone(BuildContext context);

class Cards extends StatefulWidget {
  final CardBuilder _cardBuilder;
  final ContentBuilder _contentBuilder;
  final OnSwipe _onSwipe;
  final OnDone _onDone;
  final int _totalCount;
  final int _stackCount;
  final double _widthFactor;
  final double _heightFactor;

  const Cards({
    @required CardBuilder cardBuilder,
    @required ContentBuilder contentBuilder,
    @required OnSwipe onSwipe,
    @required OnDone onDone,
    @required int totalCount,
    int stackCount = 3,
    double widthFactor = 0.9,
    double heightFactor = 0.9,
  })  : _cardBuilder = cardBuilder,
        _contentBuilder = contentBuilder,
        _onSwipe = onSwipe,
        _onDone = onDone,
        _totalCount = totalCount,
        _stackCount = stackCount,
        _widthFactor = widthFactor,
        _heightFactor = heightFactor,
        assert(stackCount <= totalCount),
        assert(stackCount > 0);

  @override
  _CardsState createState() => _CardsState();
}

class AnimBundle {
  final Animation<Alignment> align;
  final AnimationController controller;
  final Animation<double> rotation;
  final double rotSgn;
  const AnimBundle({
    @required this.align,
    @required this.controller,
    @required this.rotation,
    @required this.rotSgn,
  });
}

class _CardsState extends State<Cards> with TickerProviderStateMixin {
  AnimationController _controller;

  // double _horizontalMultiplier = 1;
  // double _verticalMultiplier = 0;

  Size _screenSize;
  List<Size> _sizes = List<Size>();
  List<Alignment> _aligns = List<Alignment>();

  int _index = 0;
  int _cntIndex = 0;

  // double _frontOffset = 0;
  double _frontOffsetNormed = 0; // [from -1; to 1]
  Animation<Alignment> _frontAlign;
  // bool _usefrontAlign = false;

  List<AnimBundle> _animations = List<AnimBundle>();
  // bool _frontAnimating = false;
  final ObserverList<VoidCallback> _listeners = ObserverList<VoidCallback>();
  // AnimBundle _midBnd;
  AnimationController _midController;
  Animation<double> _midVals;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _midController = _controller;
    _midVals = _controller;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _screenSize = MediaQuery.of(context).size;
    _refillSizes(_screenSize);
    _refillAligns(_screenSize, _sizes);
    _swapAnimations();
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
        width: frontSize.width,
        height: frontSize.height,
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onHorizontalDragUpdate: (update) {
            _listeners.forEach((l) => l());
            if (_midController != _controller) {
              _midController = _controller;
              _midVals = _controller;
              _swapAnimations();
              // _swapTranspOpacity();
            }
            final rotChanged = _calcFrontOffset(update.delta);
            // if (!_frontAnimating)
            // _controller.stop();
            _controller.value = _frontOffsetNormed.abs();
            if (rotChanged) _calcFrontAlign();
          },
          onHorizontalDragEnd: (end) {
            _listeners.forEach((l) => l());
            _animate(context, end.velocity);
          },
          child: Container(), // color: Colors.green.withAlpha(50)
        ),
      ),
    );
  }

  void _animate(BuildContext context, Velocity v) {
    if (_cntIndex >= widget._totalCount) {
      return;
    }
    final sign = v.pixelsPerSecond.dx.sign;
    final off = _frontOffsetNormed;
    // print(off.abs());
    if (sign == 0 && off.abs() > 0.5 || sign == off.sign) {
      _animateOut(context, v);
    } else {
      _animateBack(v);
    }
  }

  void _animateBack(Velocity v) {
    final spring = _simulateSpring(v.pixelsPerSecond, _screenSize);
    final controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    final l = () {
      setState(() {
        _controller.value = Tween<double>(
          begin: _controller.value,
          end: 0,
        ).animate(controller).value;
      });
    };
    controller.addListener(l);
    final l2 = () {
      controller.removeListener(l);
    };
    _listeners.add(l2);
    // _frontAnimating = true;
    _midController = _controller;
    _midVals = _controller;
    _frontOffsetNormed = 1e-4 * _frontOffsetNormed.sign;
    controller.animateWith(spring).then((_) {
      setState(() {
        // _frontOffsetNormed = 0;
        // _frontAnimating = false;
        controller.removeListener(l);
        _listeners.remove(l2);
        controller.dispose();
      });
    });
  }

  void _animateOut(BuildContext context, Velocity v) {
    if (_index < widget._totalCount)
      widget._onSwipe?.call(
        context,
        _cntIndex,
        _frontOffsetNormed.sign,
      );

    final spring = _simulateSpring(v.pixelsPerSecond, _screenSize);
    final controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
      // lowerBound: _controller.value, //опа
      lowerBound: 0,
      upperBound: 1,
    );
    final anim = _calcAnimatingAlign(controller);
    final rot = Tween<double>(
      begin: _controller.value,
      // begin: 0,
      end: 1,
    ).animate(controller);
    final bundle = AnimBundle(
      align: anim,
      controller: controller,
      rotation: rot,
      rotSgn: _frontOffsetNormed.sign,
    );
    setState(() {
      _animations.add(bundle);
    });

    // print(_animations.length);
    // final l = () {
    //   setState(() {
    //     _controller.value = Tween<double>(
    //       begin: _controller.value,
    //       end: 1,
    //     ).animate(controller).value;
    //   });
    // };
    // controller.addListener(l);
    setState(() {
      _frontOffsetNormed = 1e-4 * _frontOffsetNormed.sign;
      _controller.reset();
      _cntIndex++;
      // _index++;
      _midController = controller;
      _midVals = rot;
    });
    _swapAnimations();
    // _usefrontAlign = true;
    // _frontAlign = AlignmentTween(
    //   begin: _aligns[0],
    //   end: _aligns[0],
    // ).animate(_controller);
    controller.animateWith(spring).then((_) {
      // setState(() {
      //   // _index++;
      //   // _cntIndex++;
      // });
      _animations.remove(bundle);
      setState(() {
        // _controller.reset();
        // _usefrontAlign = false;

        // _frontOffsetNormed = 0;
        // print("kek");
        // print(_animations.first.controller.value);
        // controller.removeListener(l);
        if (_animations.length == 0) {
          _midController = _controller;
          _midVals = _controller;
          _swapAnimations();
        }
        // print(_animations.length);
      });
      controller.dispose();
      if (_animations.length == 0 && _cntIndex >= widget._totalCount) {
        widget._onDone?.call(context);
      }
    });
  }

  bool _calcFrontOffset(Offset offset) {
    // _frontOffset += offset.dx / _screenSize.width;
    final newOffset = _frontOffsetNormed + offset.dx / _screenSize.width;
    // if (newOffset.sign != _frontOffsetNormed.sign) _calcFrontAlign();
    final changed = newOffset.sign != _frontOffsetNormed.sign;
    _frontOffsetNormed = newOffset.clamp(-1, 1);
    setState(() {
      assert(_frontOffsetNormed >= -1 && _frontOffsetNormed <= 1);
    });
    return changed;
  }

  bool _transparentCardNeeded() {
    return _index <= widget._totalCount - widget._stackCount - 1;
  }

  List<Widget> _buildCards(BuildContext context) {
    var start = min(widget._stackCount + _index + 1, widget._totalCount) - 1;
    var end = _index;
    var tcn = _transparentCardNeeded();
    var compFront = _controller == _midController ? 0 : -1;
    return [
      if (tcn) _buildTransparentCard(context, start - _index),
      // for (int i = 0; i < _animations.length; i++)
      //   _buildCard(context, end + _animations.length),
      for (int i = start - (tcn ? 1 : compFront); i >= end + 1; i--)
        _buildCard(context, i - _index, i == end + 1),
      if (_index < widget._totalCount &&
          _midController == _controller) //&& _animations.length == 0)
        _frontCard(context, end - _index),
      if (_index <= widget._totalCount)
        for (int i = 0; i < _animations.length; i++) _animatingCard(context, i),
    ];
  }

  Widget _animatingCard(BuildContext context, int shift) {
    final bundle = _animations[shift];
    return _buildFrontCard(
      bundle.controller,
      context,
      // -shift,
      -1,
      bundle.align,
      bundle.rotation,
      bundle.rotSgn,
    );
  }

  Widget _frontCard(BuildContext context, int stackIdx) {
    return _buildFrontCard(
      _controller,
      context,
      stackIdx,
      _frontAlign,
      _controller,
      _frontOffsetNormed.sign,
    );
  }

  AnimatedBuilder _buildFrontCard(
    AnimationController controller,
    BuildContext context,
    int stackIdx,
    Animation<Alignment> align,
    Animation<double> rot,
    double rotSgn,
  ) {
    return AnimatedBuilder(
      animation: controller,
      // child: widget._contentBuilder(
      //     context, stackIdx + _cntIndex), //- _animations.length.sign),
      builder: (context, child) {
        return Align(
          alignment: align.value,
          child: Transform.rotate(
            angle: rotSgn * (pi / 180.0) * 8 * rot.value,
            child: SizedBox(
              key: UniqueKey(),
              width: _sizes[0].width,
              height: _sizes[0].height,
              child: widget._cardBuilder(
                context,
                widget._contentBuilder(
                  context,
                  stackIdx + _cntIndex,
                  // _midController.value * _frontOffsetNormed.sign,
                  rot.value * rotSgn,
                ),
                stackIdx,
                // stackIdx >= 0 ? stackIdx : 0,
                1,
              ),
            ),
          ),
        );
      },
    );
  }

  void _calcFrontAlign() {
    final full = _screenSize;
    final card = _sizes[0];
    final gap = Size(
      (full.width - card.width) / 2,
      (full.height - card.height) / 2,
    );
    final align = AlignmentTween(
      begin: _aligns[0],
      end: Alignment(
        _frontOffsetNormed.sign * (gap.width + card.width) / gap.width,
        0,
      ),
    ).animate(_controller);
    _frontAlign = align;
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
      begin: _frontAlign.value, //_aligns[0],
      end: Alignment(magnified.dx, magnified.dy),
    ).animate(controller);
    return align;
  }

  double _calcOpacity(int index) {
    const drop = 0.20;
    return max(min(1 - drop * index, 1), 0);
  }

  List<Animation<Size>> _midSizes = List<Animation<Size>>();
  List<Animation<Alignment>> _midAligns = List<Animation<Alignment>>();
  List<Animation<double>> _midOpacities = List<Animation<double>>();
  void _swapAnimations() {
    _midSizes.clear();
    _midAligns.clear();
    _midOpacities.clear();

    for (int i = 1; i <= widget._stackCount; i++) {
      _swapAnimation(i);
    }

    _swapTranspOpacity();
    _calcFrontAlign();
  }

  void _swapAnimation(int stackIdx) {
    final from = 0.0;
    final to = 0.6;
    // var controller2 = ;
    var controller = _midVals;
    // print('[${_animations.length}] ${controller.value}');
    var curve = Curves.easeOutQuad;
    final size = Tween<Size>(
      begin: _sizes[stackIdx],
      end: _sizes[stackIdx - 1],
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(from, to, curve: curve),
      ),
    );
    _midSizes.add(size);
    final align = Tween<Alignment>(
      begin: _aligns[stackIdx],
      end: _aligns[stackIdx - 1],
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(from, to, curve: curve),
      ),
    );
    _midAligns.add(align);
    final opacity = Tween<double>(
      begin: _calcOpacity(stackIdx),
      end: _calcOpacity(stackIdx - 1),
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(from, to, curve: curve),
      ),
    );
    _midOpacities.add(opacity);
  }

  Widget _buildCard(
    BuildContext context,
    int stackIdx, [
    bool underFront = false,
  ]) {
    // print(underFront);
    // print(stackIdx);
    return AnimatedBuilder(
      animation: _midController,
      child: underFront
          ? FittedBox(
              fit: BoxFit.cover,
              child: SizedBox(
                width: _sizes[0].width,
                height: _sizes[0].height,
                child: widget._contentBuilder(
                  context,
                  stackIdx +
                      _cntIndex -
                      (_midController == _controller ? 0 : 1),
                  0,
                ),
              ),
            )
          : Container(),
      builder: (context, child) {
        return Align(
          alignment: _midAligns[stackIdx - 1].value,
          child: SizedBox(
            key: UniqueKey(),
            width: _midSizes[stackIdx - 1].value.width,
            height: _midSizes[stackIdx - 1].value.height,
            child: Opacity(
              opacity: _midOpacities[stackIdx - 1].value,
              child: widget._cardBuilder(
                context,
                child,
                stackIdx,
                underFront ? _midVals.value : 0,
              ),
            ),
          ),
        );
      },
    );
  }

  Animation<double> _transpOpacity;
  void _swapTranspOpacity() {
    _transpOpacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _midVals,
        curve: Curves.easeOutCubic,
      ),
    );
  }

  Widget _buildTransparentCard(BuildContext context, int stackIdx) {
    // var controller =
    //     // _animations.length > 0 ? _animations.last.rotation : _controller;
    //     _animations.length > 0 ? _animations.first.rotation : _controller;
    // var controller = _midController;
    return AnimatedBuilder(
      animation: _midController, //controller,
      builder: (context, child) {
        return Opacity(
          opacity: _transpOpacity.value,
          child: child,
        );
      },
      child: _buildCard(context, stackIdx),
    );
  }

  SpringSimulation _simulateSpring(Offset pixelsPerSecond, Size size) {
    final unitsPerSecondX = pixelsPerSecond.dx / size.width;
    final unitsPerSecondY = pixelsPerSecond.dy / size.height;
    final unitsPerSecond = Offset(unitsPerSecondX, unitsPerSecondY);
    final unitVelocity = unitsPerSecond.distance;

    const spring = SpringDescription(
      mass: 25,
      stiffness: 10,
      damping: 1,
    );

    const eps = 1e-2;
    final simulation = SpringSimulation(
      spring,
      0,
      1,
      unitVelocity,
      tolerance: Tolerance(
        distance: eps,
        time: eps,
        velocity: eps,
      ),
    );
    return simulation;
  }
}
