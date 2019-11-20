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
        width: frontSize.width,
        height: frontSize.height,
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onHorizontalDragUpdate: (update) {
            _listeners.forEach((l) => l());
            _midController = _controller;
            _midVals = _controller;
            _calcFrontOffset(update.delta);
            // if (!_frontAnimating)
            // _controller.stop();
            _controller.value = _frontOffsetNormed.abs();
          },
          onHorizontalDragEnd: (end) {
            _listeners.forEach((l) => l());
            _animate(end.velocity);
          },
          child: Container(), // color: Colors.green.withAlpha(50)
        ),
      ),
    );
  }

  void _animate(Velocity v) {
    final sign = v.pixelsPerSecond.dx.sign;
    final off = _frontOffsetNormed;
    // print(off.abs());
    if (sign == 0 && off.abs() > 0.5 || sign == off.sign) {
      _animateOut(v);
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

  void _animateOut(Velocity v) {
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

    print(_animations.length);
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
      _index++;
      _midController = controller;
      _midVals = rot;
    });
    // _usefrontAlign = true;
    // _frontAlign = AlignmentTween(
    //   begin: _aligns[0],
    //   end: _aligns[0],
    // ).animate(_controller);
    controller.animateWith(spring).then((_) {
      setState(() {
        // _index++;
        // _cntIndex++;
      });
      setState(() {
        // _controller.reset();
        // _usefrontAlign = false;

        // _frontOffsetNormed = 0;
        // print("kek");
        // print(_animations.first.controller.value);
        _animations.remove(bundle);
        // controller.removeListener(l);
        if (_animations.length == 0) {
          _midController = _controller;
          _midVals = _controller;
        }
        controller.dispose();
        print(_animations.length);
      });
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
    // _frontAlign = _usefrontAlign ? _frontAlign : _calcFrontAlign(_controller);
    _frontAlign = _calcFrontAlign(_controller);
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
      child: widget._contentBuilder(
          context, stackIdx + _cntIndex), //- _animations.length.sign),
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
                child,
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

  Animation<Alignment> _calcFrontAlign(AnimationController controller) {
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
      begin: _frontAlign.value, //_aligns[0],
      end: Alignment(magnified.dx, magnified.dy),
    ).animate(controller);
    return align;
  }

  double _calcOpacity(int index) {
    const drop = 0.20; //0.20;
    return max(min(1 - drop * index, 1), 0);
  }

  Widget _buildCard(
    BuildContext context,
    int stackIdx, [
    bool underFront = false,
  ]) {
    // print(underFront);
    final from = 0.0;
    final to = 0.6;
    // var controller = _controller;
    // var controller = _animations.length > 0
    //     // &&             _animations.first.controller.status != AnimationStatus.forward
    //     // ? _animations.last.rotation
    //     ? _animations.first.rotation
    //     : _controller;
    var controller2 = _midController;
    var controller = _midVals;
    // print('[${_animations.length}] ${controller.value}');
    final size = Tween<Size>(
      begin: _sizes[stackIdx],
      end: _sizes[stackIdx - 1],
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(from, to, curve: Curves.linear),
      ),
    );
    final align = Tween<Alignment>(
      begin: _aligns[stackIdx],
      end: _aligns[stackIdx - 1],
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(from, to, curve: Curves.linear),
      ),
    );
    final opacity = Tween<double>(
      begin: _calcOpacity(stackIdx),
      end: _calcOpacity(stackIdx - 1),
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(from, to, curve: Curves.easeOut),
      ),
    );
    return AnimatedBuilder(
      animation: controller2,
      child: underFront
          ? widget._contentBuilder(
              context,
              stackIdx +
                  _cntIndex -
                  (_midController == _controller
                      ? 0
                      : 1)) //- _animations.length.sign)
          : Container(),
      builder: (context, child) {
        return Align(
          alignment: align.value,
          child: SizedBox(
            key: UniqueKey(),
            width: size.value.width,
            height: size.value.height,
            child: Opacity(
              opacity: opacity.value,
              child: widget._cardBuilder(
                context,
                child,
                stackIdx,
                underFront ? controller.value : 0,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildTransparentCard(BuildContext context, int stackIdx) {
    // var controller =
    //     // _animations.length > 0 ? _animations.last.rotation : _controller;
    //     _animations.length > 0 ? _animations.first.rotation : _controller;
    // var controller = _midController;
    final opacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _midVals, // _controller
        curve: Curves.easeOutCubic,
      ),
    );
    return AnimatedBuilder(
      animation: _midController, //controller,
      builder: (context, child) {
        return Opacity(
          opacity: opacity.value,
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
      mass: 30,
      stiffness: 1,
      damping: 1,
    );

    final simulation = SpringSimulation(spring, 0, 1, unitVelocity);
    return simulation;
  }
}
