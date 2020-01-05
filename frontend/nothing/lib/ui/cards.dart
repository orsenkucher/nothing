import 'package:flutter/material.dart';
import 'package:nothing/bloc/feed/state.dart';
import 'package:nothing/data/model/question.dart';

mixin CardMaterial on Widget {
  Widget get content; //  CardContent
  Animation<double> get animation;
}

mixin CardContent on Widget {
  Question get question;
  Animation<double> get animation;
}

typedef CardContent CardContentFactory(Question question, Animation<double> animation);

typedef CardMaterial CardMaterialFactory(Widget content, Animation<double> animation);

typedef OnSwipe(BuildContext context, Question question, bool right);

class Cards extends StatefulWidget {
  final Feed feed;
  final int stack;
  final double widthFactor;
  final double heightFactor;
  final CardContentFactory contentfactory;
  final CardMaterialFactory materialfactory;

  const Cards({
    @required this.feed,
    @required this.contentfactory,
    @required this.materialfactory,
    this.stack = 3,
    this.widthFactor = 0.9,
    this.heightFactor = 0.9,
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
      duration: Duration(seconds: 1),
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
    _screenSize = MediaQuery.of(context).size;
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
  }

  void _refillAligns(Size full, List<Size> sizes) {
    _aligns.clear();
    for (int i = 0; i < widget.stack + 1; i++) {
      final curGapHeight = (full.height - sizes[i].height) / 2;
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
        // _gestureDetector(context),
      ],
    );
  }

  // Tail card will be on top of stack
  List<Widget> _buildCards(BuildContext context) {
    return [
      widget.materialfactory(
        content:widget.contentfactory(
          question:widget.feed.batch[widget.feed.current],
          animation:_controller,
        ),
        animation:_controller,
      );
    ];
  }
}
