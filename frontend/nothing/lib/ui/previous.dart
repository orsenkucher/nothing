import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nothing/bloc/feed/bloc.dart';

class PreviousQ extends StatelessWidget {
  final double height;

  const PreviousQ({@required this.height});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: SizedBox(
        height: height,
        child: Center(
          child: BlocBuilder<FeedBloc, Feed>(
            builder: (context, state) => state.current > 0
                ? TextSwitcher(state.batch[state.current - 1].question)
                : TextSwitcher(
                    state.len > 0 ? state.batch[state.current].question : '',
                  ),
          ),
        ),
      ),
    );
  }
}

class PreviousA extends StatelessWidget {
  final double height;

  const PreviousA({@required this.height});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: BlocBuilder<FeedBloc, Feed>(
        builder: (context, state) {
          var ln = '?', rn = '?';
          var l = '', r = '';
          if (state.current > 0) {
            final q = state.batch[state.current - 1];
            final sum = q.leftn + q.rightn;
            final value = (sum != 0 ? q.leftn / sum * 100 : 0.0).toInt();
            ln = '$value';
            rn = '${100 - value}';
            l = q.left;
            r = q.right;
          } else if (state.len > 0) {
            final q = state.batch[state.current];
            l = q.left;
            r = q.right;
          }
          return Column(
            children: [
              _makerow(context, ln, rn, 18),
              _makerow(context, l, r, 14),
            ],
          );
        },
      ),
    );
  }

  Widget _makerow(
    BuildContext context,
    String a,
    String b,
    double fontSize,
  ) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      TextSwitcher(a, fontSize: fontSize),
      TextSwitcher(b, fontSize: fontSize),
    ]);
  }
}

class TextSwitcher extends StatelessWidget {
  final String text;
  final double fontSize;

  const TextSwitcher(
    this.text, {
    Key key,
    this.fontSize = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 200),
      child: Text(
        text,
        textAlign: TextAlign.center,
        key: ValueKey(text),
        style: TextStyle(
          fontSize: fontSize,
          color: Colors.white,
        ),
      ),
    );
  }
}
