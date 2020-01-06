import 'dart:math';

import 'package:flutter/material.dart';
import 'package:nothing/bloc/feed/state.dart';
import 'package:nothing/data/model/question.dart';

typedef Widget CardContentFactory(
  BuildContext context,
  Question question,
  Animation<double> animation,
);

typedef Widget CardMaterialFactory(
  BuildContext context,
  Widget content,
  Animation<double> animation,
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

  const Cards({
    @required this.feed,
    @required this.contentfactory,
    @required this.materialfactory,
    this.stack = 3,
    this.widthFactor = 0.9,
    this.heightFactor = 0.9,
    this.size,
  });

  @override
  _CardsState createState() => _CardsState();
}

class _CardsState extends State<Cards> with SingleTickerProviderStateMixin {
  AnimationController _controller; // binds all animations together
  Size _screenSize; // available screen area
  List<Size> _sizes = List<Size>(); // card sizes (len: stack)
  List<Alignment> _aligns = List<Alignment>(); // card aligns (len: stack)
  // Motus lists are pre-baked animations
  List<Animation<Size>> _motusSizes = List<Animation<Size>>();
  List<Animation<Alignment>> _motusAligns = List<Animation<Alignment>>();
  List<Animation<double>> _motusOpacities = List<Animation<double>>();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
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
    _screenSize = widget.size ?? MediaQuery.of(context).size;
    print('Screen size: $_screenSize');
    _refillSizes(_screenSize);
    _refillAligns(_screenSize, _sizes);
    _motusListsUpdate();
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

  void _motusListsUpdate() {
    _motusSizes.clear();
    _motusAligns.clear();
    _motusOpacities.clear();
    for (var i = 1; i <= widget.stack; i++) {
      _motusUpdate(i); // begin: i; end: i-1
    }
  }

  void _motusUpdate(int index) {
    final controller = _controller;
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

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ..._buildCards(context),
        // _gestureDetector(context),
      ],
    );
  }

  // Tail card will be on top of stack
  List<Widget> _buildCards(BuildContext context) {
    // count has to be <= stack
    final count = min(widget.stack, widget.feed.len);
    return [
      for (var i = count - 1; i >= 0; i--) _buildCard(context, i),
    ];
  }

  Widget _buildCard(BuildContext context, int index) {
    final question = widget.feed.batch[widget.feed.current + index];
    // return SizedBox(
    //   key: ValueKey(question.id),
    //   width: _sizes[index].width,
    //   height: _sizes[index].height,
    //   child: widget.materialfactory(
    //     context,
    //     widget.contentfactory(
    //       context,
    //       question,
    //       _controller,
    //     ),
    //     _controller,
    //   ),
    // );
    return CardTransition(
      // content: widget.contentfactory(context, question, _controller),
      // material: widget.materialfactory(context, null, _controller),
      key: ValueKey(question.id),
      controller: _controller,
      size: _motusSizes[index],
      align: _motusAligns[index],
      opacity: _motusOpacities[index],
      // sizes: _sizes,
      // aligns: _aligns,
      // index: index,
      // question: question,
      // contentfactory: widget.contentfactory,
      // materialfactory: widget.materialfactory,
      child: Card(
        animation: _controller,
        basesize: _sizes[0],
        materialfactory: widget.materialfactory,
        child: widget.contentfactory(
          context,
          question,
          _controller,
        ),
      ),
    );
  }

  // Widget _prepareContent(Widget child) {
  //   return FittedBox(
  //     fit: BoxFit.cover,
  //     child: SizedBox(
  //       width: _sizes[0].width,
  //       height: _sizes[0].height,
  //       child: child,
  //     ),
  //   );
  // }
}

// OR CardTransition and build from card material in saparate class Card
class CardTransition extends AnimatedWidget {
  final AnimationController controller;
  // final int index; // this is relative card index in stack
  // final Widget content;
  // final Widget material;
  // final CardContentFactory contentfactory;
  final Widget child;
  // final CardMaterialFactory materialfactory;
  // final List<Alignment> aligns;
  // final List<Size> sizes;
  // final Question question;

  final Animation<AlignmentGeometry> align;
  final Animation<Size> size;
  final Animation<double> opacity;
  // final

  const CardTransition({
    @required Key key,
    @required this.controller,
    // @required this.index,
    // @required this.question,
    // @required this.content,
    // @required this.material,
    // @required this.contentfactory,
    @required this.child,
    // @required this.materialfactory,
    // @required this.aligns,
    // @required this.sizes,
    @required this.size,
    @required this.align,
    @required this.opacity,
  }) : super(key: key, listenable: controller);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity.value,
      child: Align(
        // Try swap Size wiht Align
        // Animation<AlignmentGeometry>
        // alignment: aligns[index],
        alignment: align.value,
        // child: SizeTransition()
        child: SizedBox(
          // width: sizes[index].width,
          // height: sizes[index].height,
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
  final Size basesize;

  const Card({
    @required this.basesize,
    @required this.materialfactory,
    @required this.child,
    @required this.animation,
  });

  @override
  Widget build(BuildContext context) {
    return materialfactory(
      context,
      _prepareContent(child),
      animation,
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
