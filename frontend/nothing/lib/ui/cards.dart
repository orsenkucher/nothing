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
  List<Size> _sizes = List<Size>(); // card sizes (len: stack)
  List<Alignment> _aligns = List<Alignment>(); // card aligns (len: stack)
  Size _screenSize; // available screen area

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
    return Card(
      // content: widget.contentfactory(context, question, _controller),
      // material: widget.materialfactory(context, null, _controller),
      key: ValueKey(question.id),
      controller: _controller,
      sizes: _sizes,
      aligns: _aligns,
      index: index,
      // question: question,
      // contentfactory: widget.contentfactory,
      materialfactory: widget.materialfactory,
      child: _prepareChild(
        widget.contentfactory(
          context,
          question,
          _controller,
        ),
      ),
    );
  }

  Widget _prepareChild(Widget child) {
    return FittedBox(
      fit: BoxFit.cover,
      child: SizedBox(
        width: _sizes[0].width,
        height: _sizes[0].height,
        child: child,
      ),
    );
  }
}

class Card extends AnimatedWidget {
  final AnimationController controller;
  final int index; // this is relative card index in stack
  // final Widget content;
  // final Widget material;
  // final CardContentFactory contentfactory;
  final Widget child;
  final CardMaterialFactory materialfactory;
  final List<Alignment> aligns;
  final List<Size> sizes;
  // final Question question;

  const Card({
    @required Key key,
    @required this.controller,
    @required this.index,
    // @required this.question,
    // @required this.content,
    // @required this.material,
    // @required this.contentfactory,
    @required this.child,
    @required this.materialfactory,
    @required this.aligns,
    @required this.sizes,
  }) : super(key: key, listenable: controller);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: aligns[index],
      child: SizedBox(
        width: sizes[index].width,
        height: sizes[index].height,
        child: materialfactory(
          context,
          child,
          controller,
        ),
      ),
    );
  }
}
