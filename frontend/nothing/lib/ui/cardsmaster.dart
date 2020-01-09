import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nothing/bloc/feed/bloc.dart';
import 'package:nothing/bloc/summary/bloc.dart';
import 'package:nothing/color/scheme.dart';
import 'package:nothing/data/model/question.dart';
import 'package:nothing/ui/cards.dart';

// Bind to dataflow and tune Cards widget
class CardsMaster extends StatelessWidget {
  const CardsMaster({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, box) => BlocBuilder<FeedBloc, Feed>(
        builder: (context, state) => Cards(
          feed: state,
          contentfactory: (ctx, que, anim) => NothingContent(que, anim),
          materialfactory: (ctx, cnt, anim) => NothingMaterial(cnt, anim),
          heightFactor: 0.60,
          widthFactor: 0.85,
          stack: 3,
          size: box.biggest,
          onswipe: (context, q, b) {
            print('${q.question} -> $b');
            BlocProvider.of<SummaryBloc>(context).add(
              NewAnswer(
                idx: q.id, // TODO idx -> id?
                answer: b,
              ),
            );
          },
        ),
      ),
    );
  }
}

class NothingContent extends StatelessWidget {
  final Question question;
  final Animation<double> animation;

  const NothingContent(this.question, this.animation);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Center(
        child: Text(
          question.question,
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: NothingScheme.of(context).textbase,
          ),
        ),
      ),
    );
  }
}

class NothingMaterial extends StatelessWidget {
  final Widget content;
  final Animation<double> animation;

  const NothingMaterial(this.content, this.animation);

  @override
  Widget build(BuildContext context) {
    final scheme = NothingScheme.of(context);
    return Material(
      shadowColor: scheme.shadow,
      color: scheme.card,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: scheme.cardborder, width: 4),
        borderRadius: BorderRadius.circular(28),
      ),
      elevation: lerpDouble(1, 7, animation.value),
      child: content,
    );
  }
}
