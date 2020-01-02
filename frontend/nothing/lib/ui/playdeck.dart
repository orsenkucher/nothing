import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nothing/bloc/feed/bloc.dart';
import 'package:nothing/bloc/summary/bloc.dart';
import 'package:nothing/data/model/question.dart';
import 'package:nothing/ui/cards.dart';

class PlayDeck extends StatefulWidget {
  final List<Question> qus;

  PlayDeck({List<Question> qus}) : this.qus = qus ?? List<Question>();

  @override
  _PlayDeckState createState() => _PlayDeckState();

  void add(Question q) {
    this.qus.add(q);
  }
}

class _PlayDeckState extends State<PlayDeck> {
  @override
  Widget build(BuildContext context) {
    if (widget.qus.length < 1) {
      widget.qus.addAll(BlocProvider.of<FeedBloc>(context).state.batch);
    }
    Widget w = widget.qus.length > 0
        ? Cards(
            stackCount: min(widget.qus.length, 3),
            totalCount: widget.qus.length,
            heightFactor: 0.60,
            widthFactor: 0.85,
            onSwipe: (context, idx, dr) {
              final text = 'Card $idx: ${dr < 0 ? "left" : "right"}';
              print(text);
              BlocProvider.of<SummaryBloc>(context).add(
                NewAnswer(
                  idx: widget.qus[idx].id,
                  answer: dr < 0,
                ),
              );
              BlocProvider.of<FeedBloc>(context).add(MoveNext());
              // BlocProvider.of<QuestionBloc>(context).add(
              //   NextQuestion(),
              // );
              // final snackBar = SnackBar(content: Text(text));
              // Scaffold.of(context).hideCurrentSnackBar();
              // Scaffold.of(context).showSnackBar(snackBar);
            },
            onDone: (context) {
              print('Done');
              // _showAd();
              // BlocProvider.of<QuestionsBloc>(context).add(
              //   FetchQus(),
              // );
            },
            cardBuilder: (context, child, index, lerp) {
              // print(lerp);
              // var colors = Colors.primaries;
              // Color color = colors[(colors.length + index * 6) % colors.length];
              // color = Colors.white;
              return Material(
                shadowColor: Colors.black.withAlpha(60),
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Color(0xffa89984), width: 4),
                  borderRadius: BorderRadius.circular(28),
                ),
                color: Color(0xff32302f),
                // borderRadius: BorderRadius.circular(28),
                elevation: lerpDouble(1, 7, lerp),
                // color: color,
                child: child,
              );
            },
            contentBuilder: (context, index, lerp) {
              // print(index);
              final qu = widget.qus[index];
              lerp = (lerp * 6).clamp(-1.0, 1.0);
              var baseColor = Color(0xff83a598);
              var colorRight = baseColor;
              var colorLeft = baseColor;
              if (lerp > 0)
                colorRight = Color.lerp(
                  colorRight,
                  Color(0xff8ec07c),
                  lerp.abs(),
                );
              if (lerp < 0)
                colorLeft = Color.lerp(
                  colorLeft,
                  Color(0xffd3869b), // 0xffcc241d
                  lerp.abs(),
                );
              return Padding(
                padding: EdgeInsets.all(20),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        '${qu.right}',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: colorRight,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        '${qu.left}',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: colorLeft,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        // 'Have you achieved any of your recent goals?',
                        '${qu.question}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Color(0xffd5c4a1), // 0xffd65d0e
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
            // infinite: false,
          )
        : Container();

    return BlocListener<FeedBloc, Feed>(
      listener: (context, state) {
        if (state is Feed && state.batch.length > 0) {
          setState(() {
            for (var q in state.batch) {
              if (!widget.qus.contains(q)) {
                widget.add(q);
              }
            }
          });
          print(widget.qus.length);
        }
      },
      child: w,
    );
  }
}
