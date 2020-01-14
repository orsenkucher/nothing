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
                : TextSwitcher(''),
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
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextSwitcher('80', fontSize: 18),
              TextSwitcher('20', fontSize: 18),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextSwitcher('Extremely low', fontSize: 14),
              TextSwitcher('Extremely high', fontSize: 14),
            ],
          ),
        ],
      ),
    );
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
