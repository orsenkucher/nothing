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
          contentfactory: (ctx, que, anim, dirsgn) =>
              NothingContent(que, anim, dirsgn),
          materialfactory: (ctx, cnt, anim, dirsgn) =>
              NothingMaterial(cnt, anim, dirsgn),
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
  final double dirsgn;
  final Animation<double> animation;

  const NothingContent(this.question, this.animation, this.dirsgn);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: _buildText(context, true),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: _buildText(context, false),
          ),
          Center(
            child: Text(
              question.question,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: NothingScheme.of(context).question,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildText(BuildContext context, bool right) {
    final text = right ? question.right : question.left;
    final scheme = NothingScheme.of(context);
    const fontSize = 40.0;
    const fontWeight = FontWeight.bold;
    final curved = CurvedAnimation(
      parent: animation,
      curve: Curves.easeOutCubic,
    );
    if (dirsgn > 0 && right) {
      final rightcolor = ColorTween(
        begin: scheme.textbase,
        end: scheme.textright,
      ).animate(curved);
      return TextTransition(
        controller: animation,
        text: text,
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: rightcolor,
      );
    } else if (dirsgn < 0 && !right) {
      final leftcolor = ColorTween(
        begin: scheme.textbase,
        end: scheme.textleft,
      ).animate(curved);
      return TextTransition(
        controller: animation,
        text: text,
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: leftcolor,
      );
    } else {
      return Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: scheme.textbase,
        ),
      );
    }
  }
}

class NothingMaterial extends AnimatedWidget {
  final Widget content;
  final double dirsgn;
  final Animation<double> animation;

  const NothingMaterial(
    this.content,
    this.animation,
    this.dirsgn, {
    Key key,
  }) : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final scheme = NothingScheme.of(context);
    const borderWidth = 4.0;
    var borderSide = BorderSide(color: scheme.cardborder, width: borderWidth);
    if (dirsgn != 0) {
      final curved = CurvedAnimation(
        parent: animation,
        curve: Curves.easeOutCubic,
      );
      final color = ColorTween(
        begin: scheme.cardborder,
        end: dirsgn > 0 ? scheme.textright : scheme.textleft,
      ).animate(curved);
      borderSide = BorderSide(color: color.value, width: borderWidth);
    }
    final tween = Tween<double>(begin: 1, end: 7).animate(animation);
    return Material(
      shadowColor: scheme.shadow,
      color: scheme.card,
      shape: RoundedRectangleBorder(
        side: borderSide,
        borderRadius: BorderRadius.circular(28),
      ),
      elevation: dirsgn == 0 ? 1 : tween.value,
      child: content,
    );
  }
}

class TextTransition extends AnimatedWidget {
  final Animation<double> controller;
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Animation<Color> color;

  const TextTransition({
    Key key,
    @required this.controller,
    @required this.text,
    @required this.fontSize,
    @required this.fontWeight,
    @required this.color,
  }) : super(key: key, listenable: controller);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color.value,
      ),
    );
  }
}
