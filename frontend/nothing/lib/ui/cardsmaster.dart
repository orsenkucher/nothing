import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nothing/bloc/feed/bloc.dart';
import 'package:nothing/data/model/question.dart';
import 'package:nothing/ui/cards.dart';

// Bind to dataflow and tune Cards widget
class CardsMaster extends StatelessWidget {
  const CardsMaster({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeedBloc, Feed>(
      builder: (context, state) => Cards(
        feed: state,
        // and this const won't work either :(
        contentfactory: (q, a) => const Content(q, a),
        materialfactory: (c, a) => const Material(c, a),
        heightFactor: 0.60,
        widthFactor: 0.85,
        stack: 3,
      ),
    );
  }
}

class Content extends StatelessWidget with CardContent {
  final Question question;
  final Animation<double> animation;

  // const may not work with mixin
  const Content(this.question, this.animation);

  @override
  Widget build(BuildContext context) {
    return Text(question.question);
  }
}

class Material extends StatelessWidget with CardMaterial {
  final Widget content;
  final Animation<double> animation;

  const Material(this.content, this.animation);

  @override
  Widget build(BuildContext context) {
    return content;
  }
}

