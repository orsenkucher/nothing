import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nothing/bloc/feed/bloc.dart';
import 'package:nothing/color/scheme.dart';

class PreviousQ extends StatelessWidget {
  final double height;

  const PreviousQ({@required this.height});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0, left: 8.0, right: 8.0),
      child: SizedBox(
        height: height,
        child: Center(
          child: BlocBuilder<FeedBloc, Feed>(
            builder: (context, state) => state.current > 0
                ? Switcher(_words(state.batch[state.current - 1].question))
                : Switcher(
                    _words(state.len > 0
                        ? state.batch[state.current].question
                        : ''),
                  ),
          ),
        ),
      ),
    );
  }

  Widget _words(String text) {
    return Words(text, key: ValueKey(text));
  }
}

class PreviousA extends StatelessWidget {
  const PreviousA();

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
            final value = (sum != 0 ? q.leftn / sum * 100 : 0.5).toInt();
            ln = '$value%';
            rn = '${100 - value}%';
            l = q.left;
            r = q.right;
          } else if (state.len > 0) {
            final q = state.batch[state.current];
            l = q.left;
            r = q.right;
          }
          return Column(
            children: [
              _makerow(context, ln, rn, 19),
              _makerow(context, l, r, 15),
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
    return Switcher(
      Row(
        key: ValueKey(a + b),
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Words(a, fontSize: fontSize),
          Words(b, fontSize: fontSize),
        ],
      ),
      duration: const Duration(milliseconds: 180),
    );
  }
}

class Switcher extends StatelessWidget {
  final Widget child;
  final Duration duration;

  const Switcher(
    this.child, {
    Key key,
    this.duration = const Duration(milliseconds: 220),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: duration,
      child: child,
    );
  }
}

class Words extends StatelessWidget {
  final String text;
  final double fontSize;

  const Words(
    this.text, {
    Key key,
    this.fontSize = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: fontSize,
        color: NothingScheme.of(context).previoustext,
      ),
    );
  }
}
