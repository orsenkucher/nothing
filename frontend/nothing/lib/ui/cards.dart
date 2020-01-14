import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:nothing/bloc/feed/state.dart';
import 'package:nothing/data/model/question.dart';

typedef Widget CardContentFactory(
  BuildContext context,
  Question question,
  Animation<double> animation,
  double dirsgn,
);

typedef Widget CardMaterialFactory(
  BuildContext context,
  Widget content,
  Animation<double> animation,
  double dirsgn,
);

typedef OnSwipe(
  BuildContext context,
  Question question,
  bool right,
);

class Cards extends StatefulWidget {
  final Feed feed;
  final int stack;
  final double widthFactor;
  final double heightFactor;
  final CardContentFactory contentfactory;
  final CardMaterialFactory materialfactory;
  final Size size;
  final OnSwipe onswipe;

  const Cards({
    @required this.feed,
    @required this.contentfactory,
    @required this.materialfactory,
    @required this.onswipe,
    this.stack = 3,
    this.widthFactor = 0.9,
    this.heightFactor = 0.9,
    this.size,
  });

  @override
  _CardsState createState() => _CardsState();
}

// TODO check all comments
class CardAnimation {
  // TODO move from here
  final Animation<Alignment> align;
  final AnimationController controller;
  final Animation<double> rot;
  final double rotsgn;
  const CardAnimation({
    @required this.controller,
    @required this.align,
    @required this.rot,
    @required this.rotsgn,
  });
}

class _CardsState extends State<Cards> with TickerProviderStateMixin {
  AnimationController _controller; // binds all animations together
  Size _screenSize; // available screen area
  List<Size> _sizes = List<Size>(); // card sizes (len: stack)
  List<Alignment> _aligns = List<Alignment>(); // card aligns (len: stack)
  // Motus lists are pre-baked animations
  List<Animation<Size>> _motusSizes = List<Animation<Size>>();
  List<Animation<Alignment>> _motusAligns = List<Animation<Alignment>>();
  List<Animation<double>> _motusOpacities = List<Animation<double>>();
  List<AnimationController> _motusControllers = List<AnimationController>();
  // Animating-out cards
  List<CardAnimation> _animations = List<CardAnimation>();
  // Front card controls
  double _offset = 0;
  bool _controlflag = true; // when _controller helms

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override // is called every time state changes
  void didChangeDependencies() {
    super.didChangeDependencies();
    _attuneWidget();
  }

  @override // is called when widget changes
  void didUpdateWidget(Cards oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.size != widget.size) {
      _attuneWidget();
      setState(() {});
    }
  }

  void _attuneWidget() {
    _screenSize = widget.size ?? MediaQuery.of(context).size;
    print('Screen size: $_screenSize');
    _refillSizes(_screenSize);
    _refillAligns(_screenSize, _sizes);
    _motusListsUpdate(_controller);
  }

  void _refillSizes(Size full) {
    _sizes.clear();
    final gap = Size(
      full.width * (1 - widget.widthFactor) / 2,
      full.height * (1 - widget.heightFactor) / 2,
    );
    final card = Size(
      full.width * widget.widthFactor,
      full.height * widget.heightFactor,
    );
    for (int i = 0; i < widget.stack + 1; i++) {
      _sizes.add(Size(
        card.width - (gap.width / widget.stack) * i,
        card.height - (gap.height / widget.stack) * i,
      ));
    }
    print('Card sizes: $_sizes');
  }

  void _refillAligns(Size full, List<Size> sizes) {
    _aligns.clear();
    for (int i = 0; i < widget.stack + 1; i++) {
      final curGapHeight = (full.height - sizes[i].height) / 2;
      _aligns.add(
        Alignment(0.0, 0.1 * sizes[0].height * i / curGapHeight),
      );
    }
    print('Card aligns: $_aligns');
  }

  void _motusListsUpdate(
    AnimationController controller, [
    Animation<double> values,
  ]) {
    if (values == null) {
      values = controller;
    }
    _motusSizes.clear();
    _motusAligns.clear();
    _motusOpacities.clear();
    _motusControllers = List<AnimationController>.filled(
      widget.stack + 1,
      controller,
    );
    _motusFrontUpdate(false);
    for (var i = 1; i <= widget.stack; i++) {
      _motusUpdate(i, values); // begin: i; end: i-1
    }
    _motusTransparentUpdate(values);
  }

  void _motusFrontUpdate([bool override = true]) {
    const zero = 0;
    final controller = _controller;
    final align = _calcFrontAlign(controller);
    if (!override) {
      _motusSizes.add(null);
      _motusOpacities.add(null);
      _motusAligns.add(align);
    } else {
      _motusAligns[zero] = align;
    }
  }

  void _motusTransparentUpdate(Animation<double> controller) {
    const from = 0.0;
    const to = 0.6;
    const curve = Curves.easeOutCubic;
    controller = CurvedAnimation(
      parent: controller,
      curve: Interval(from, to, curve: curve),
    );
    _motusOpacities[widget.stack] = Tween<double>(
      begin: 0,
      end: _calcOpacity(widget.stack - 1),
    ).animate(controller);
    _motusOpacities.add(Tween<double>(
      begin: 0,
      end: 1,
    ).animate(controller));
  }

  void _motusUpdate(int index, Animation<double> controller) {
    const from = 0.0;
    const to = 0.6;
    const curve = Curves.easeOutCubic;
    controller = CurvedAnimation(
      parent: controller,
      curve: Interval(from, to, curve: curve),
    );
    _motusSizes.add(
      Tween<Size>(
        begin: _sizes[index],
        end: _sizes[index - 1],
      ).animate(controller),
    );
    _motusAligns.add(
      Tween<Alignment>(
        begin: _aligns[index],
        end: _aligns[index - 1],
      ).animate(controller),
    );
    _motusOpacities.add(
      Tween<double>(
        begin: _calcOpacity(index),
        end: _calcOpacity(index - 1),
      ).animate(controller),
    );
  }

  double _calcOpacity(int index) {
    const drop = 0.20;
    return max(min(1 - drop * index, 1), 0);
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
        _offset.sign * (gap.width + card.width) / gap.width,
        0,
      ),
    ).animate(controller);
    return align;
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

  // Tail card will be on top of stack
  List<Widget> _buildCards(BuildContext context) {
    // count has to be <= stack
    final diff = widget.feed.len - widget.feed.current;
    final count = min(widget.stack, diff);
    // TODO maybe len - cur?
    // TODO prebuild and cache middle cards?
    final tcn = diff > widget.stack;
    // TODO suppl incorp
    final suppl = _controlflag || tcn ? 0 : 1; // supplement
    return [
      if (tcn) _buildCard(context, widget.stack),
      for (var i = count - 1 + suppl; i >= 1; i--) _buildCard(context, i),
      if (_controlflag && count > 0) _buildFrontCard(context),
      for (var i = _animations.length - 1; i >= 0; i--)
        _buildOutCard(context, i),
    ];
  }

  Widget _buildCard(BuildContext context, int index) {
    const threshold = 2; // Content rendering threshold
    final sh = _controlflag ? 0 : -1; // shift _buildCard index
    final question = widget.feed.batch[widget.feed.current + index + sh];
    final controller = _motusControllers[index];
    Widget content = const SizedBox();
    if (index <= threshold) {
      content = widget.contentfactory(
        context,
        question,
        controller,
        0, // no sign means no anim needed
      );
    }
    if (index == threshold) {
      final opacity = _motusOpacities[widget.stack + 1]; // kinda cheat
      content = AnimatedBuilder(
        child: content,
        animation: controller,
        builder: (context, child) => Opacity(
          opacity: opacity.value,
          child: child,
        ),
      );
    }
    return CardTransition(
      key: UniqueKey(),
      controller: controller,
      size: _motusSizes[index],
      align: _motusAligns[index],
      opacity: _motusOpacities[index],
      child: Card(
        animation: controller,
        dirsgn: 0,
        basesize: _sizes[0],
        materialfactory: widget.materialfactory,
        child: content,
      ),
    );
  }

  Widget _buildFrontCard(BuildContext context) {
    const zero = 0;
    final question = widget.feed.batch[widget.feed.current + zero];
    final controller = _controller;
    final animation = CardAnimation(
      controller: controller,
      align: _motusAligns[zero],
      rot: controller,
      rotsgn: _offset.sign,
    );
    return _frontCard(
      context,
      question,
      animation,
    );
  }

  Widget _buildOutCard(BuildContext context, int index) {
    final animation = _animations[index];
    final qindex = widget.feed.current - _animations.length + index;
    final question = qindex < 0 ? null : widget.feed.batch[qindex];
    return _frontCard(
      context,
      question,
      animation,
    );
  }

  FrontCardTransition _frontCard(
    BuildContext context,
    Question question,
    CardAnimation animation,
  ) {
    final controller = animation.controller;
    return FrontCardTransition(
      key: UniqueKey(),
      controller: controller,
      align: animation.align,
      rot: animation.rot,
      rotsgn: animation.rotsgn,
      child: FrontCard(
        animation: controller,
        values: animation.rot,
        dirsgn: animation.rotsgn,
        size: _sizes[0],
        materialfactory: widget.materialfactory,
        child: question != null
            ? widget.contentfactory(
                context,
                question,
                animation.rot,
                animation.rotsgn,
              )
            : const SizedBox(),
      ),
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
          onHorizontalDragUpdate: _onDragUpdate,
          onHorizontalDragEnd: _onDragEnd,
          child: const SizedBox(),
        ),
      ),
    );
  }

  void _onDragUpdate(DragUpdateDetails update) {
    // intercept motus control
    if (!_controlflag) {
      _motusListsUpdate(_controller);
      _controlflag = true;
      setState(() {});
    }
    final rotChanged = _calcFrontOffset(update.delta);
    _controller.value = _offset.abs();
    if (rotChanged) {
      _motusFrontUpdate();
      setState(() {}); // TODO find better place?
    }
  }

  bool _calcFrontOffset(Offset offset) {
    final newOffset = _offset + offset.dx / _screenSize.width;
    final changed = newOffset.sign != _offset.sign;
    _offset = newOffset.clamp(-1.0, 1.0);
    return changed;
  }

  void _onDragEnd(DragEndDetails end) {
    if (widget.feed.current < widget.feed.len) {
      _animate(context, end.velocity);
    }
  }

  void _animate(BuildContext context, Velocity v) {
    final sign = v.pixelsPerSecond.dx.sign;
    final offset = _offset;
    if (sign == 0 && offset.abs() > 0.5 || sign == offset.sign) {
      _animateOut(context, v);
    } else {
      _animateBack(context, v);
    }
  }

  void _animateBack(BuildContext context, Velocity v) {
    final controller = _controller;
    final spring = _simulateSpring(
      size: _screenSize,
      offsetVelocity: v.pixelsPerSecond,
      // from: controller.value,
      // to: 0,
      mass: 42,
      from: controller.value,
      to: 0,
    );
    _offset = 1e-4 * _offset.sign; // magic
    controller.animateWith(spring);
  }

  void _animateOut(BuildContext context, Velocity v) async {
    widget.onswipe?.call(
      context,
      widget.feed.batch[widget.feed.current],
      _offset.sign > 0,
    );

    final spring = _simulateSpring(
      size: _screenSize,
      offsetVelocity: v.pixelsPerSecond,
      mass: 18,
      // from: _controller.value, // or from 0
      from: 0,
      to: 1,
    );
    final controller = AnimationController(
      vsync: this,
    );
    final align = _calcAnimatingAlign(controller);
    final rot = Tween<double>(
      begin: _controller.value, // or 0 if not ln:340
      // begin: 0,
      end: 1,
    ).animate(controller);
    final animation = CardAnimation(
      controller: controller,
      align: align,
      rot: rot,
      rotsgn: _offset.sign,
    );
    setState(() {
      _animations.add(animation);
    });
    // rot is continuation of _controller values
    _motusListsUpdate(controller, rot);
    _controlflag = false;
    setState(() {
      // have to preserve _offset sign for some reasons..
      _offset = 1e-4 * _offset.sign; // magic x2
      _controller.reset();
    });
    await controller.animateWith(spring);
    setState(() {
      _animations.remove(animation);
      // give control back to _controller
      if (!_controlflag && _animations.length == 0) {
        _motusListsUpdate(_controller);
        _controlflag = true;
      }
    });
    print('Animations left: ${_animations.length}');
    controller.dispose();
  }

  SpringSimulation _simulateSpring({
    @required Size size,
    @required Offset offsetVelocity,
    @required double mass,
    @required double from,
    @required double to,
  }) {
    const eps = 1e-2;
    final spring = SpringDescription(
      mass: mass,
      stiffness: 10,
      damping: 1,
    );
    const tolerance = const Tolerance(
      distance: eps,
      time: eps,
      velocity: eps,
    );
    final unitsPerSecondX = offsetVelocity.dx / size.width;
    final unitsPerSecondY = offsetVelocity.dy / size.height;
    final unitsPerSecond = Offset(unitsPerSecondX, unitsPerSecondY);
    final unitVelocity = unitsPerSecond.distance;
    final sign = from < to ? 1 : -1;
    final simulation = SpringSimulation(
      spring,
      from,
      to,
      sign * unitVelocity,
      tolerance: tolerance,
    );
    return simulation;
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
    var normed = Offset(_offset.sign, 0);
    final magnified = normed * multiplier;
    final align = AlignmentTween(
      // begin: _frontAlign.value, //_aligns[0],
      begin: _motusAligns[0].value,
      end: Alignment(magnified.dx, magnified.dy),
    ).animate(controller);
    return align;
  }
}

class FrontCardTransition extends AnimatedWidget {
  final AnimationController controller;
  final Widget child;
  final Animation<Alignment> align;
  final Animation<double> rot;
  final double rotsgn;

  const FrontCardTransition({
    @required Key key,
    @required this.controller,
    @required this.child,
    @required this.align,
    @required this.rot,
    @required this.rotsgn,
  }) : super(key: key, listenable: controller);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: align.value,
      child: Transform.rotate(
        angle: rotsgn * (pi / 180.0) * 8 * rot.value,
        child: child,
      ),
    );
  }
}

class FrontCard extends StatelessWidget {
  final CardMaterialFactory materialfactory;
  final Widget child;
  final Animation<double> animation;
  final Animation<double> values;
  final double dirsgn;
  final Size size;

  const FrontCard({
    @required this.size,
    @required this.child,
    @required this.animation,
    @required this.values,
    @required this.dirsgn,
    @required this.materialfactory,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width,
      height: size.height,
      child: materialfactory(
        context,
        child,
        values,
        dirsgn,
      ),
    );
  }
}

class CardTransition extends AnimatedWidget {
  final AnimationController controller;
  final Widget child;
  final Animation<AlignmentGeometry> align;
  final Animation<Size> size;
  final Animation<double> opacity;

  const CardTransition({
    @required Key key,
    @required this.controller,
    @required this.child,
    @required this.size,
    @required this.align,
    @required this.opacity,
  }) : super(key: key, listenable: controller);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity.value,
      child: Align(
        alignment: align.value,
        child: SizedBox(
          width: size.value.width,
          height: size.value.height,
          child: child,
        ),
      ),
    );
  }
}

class Card extends StatelessWidget {
  final CardMaterialFactory materialfactory;
  final Widget child;
  final Animation<double> animation;
  final double dirsgn;
  final Size basesize;

  const Card({
    @required this.basesize,
    @required this.materialfactory,
    @required this.child,
    @required this.dirsgn,
    @required this.animation,
  });

  @override
  Widget build(BuildContext context) {
    return materialfactory(
      context,
      _prepareContent(child),
      animation,
      dirsgn,
    );
  }

  Widget _prepareContent(Widget child) {
    return FittedBox(
      fit: BoxFit.cover,
      child: SizedBox(
        width: basesize.width,
        height: basesize.height,
        child: child,
      ),
    );
  }
}
