import 'dart:io';
import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nothing/bloc/feed/bloc.dart';
import 'package:nothing/bloc/questions/bloc.dart';
import 'package:nothing/color/scheme.dart';
import 'package:nothing/ui/cardsmaster.dart';
import 'package:vibrate/vibrate.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  FocusNode focusNode;

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (BlocProvider.of<FeedBloc>(context).state.len < 36) {
      BlocProvider.of<QuestionsBloc>(context).add(const FetchQuestions());
    }
    focusNode.unfocus();
    focusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: NothingScheme.of(context).card,
        // color: Color(0xff5d26db),
        child: Stack(
          children: [
            _inputPoint(),
            Game(),
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                focusNode.unfocus();
                focusNode.requestFocus();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _inputPoint() {
    return SizedBox(
      height: 1,
      width: 1,
      child: FittedBox(
        fit: BoxFit.cover,
        child: SizedBox(
          height: 200,
          width: 200,
          child: TextField(
            focusNode: focusNode,
            enableSuggestions: false,
            autocorrect: false,
            keyboardAppearance: Brightness.light,
            keyboardType: TextInputType.text,
            /*      onSubmitted: (s) async =>
                await SystemChannels.platform.invokeMethod<void>(
              'HapticFeedback.vibrate',
              'HapticFeedbackType.success',
            ), */
            onSubmitted: (s) async => Vibrate.feedback(FeedbackType.warning),
            textInputAction: TextInputAction.go,
            onChanged: print,
          ),
        ),
      ),
    );
  }
}

class Game extends StatelessWidget {
  const Game({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var safeWrap = (Widget w) => Platform.isIOS ? w : SafeArea(child: w);
    return safeWrap(
      LayoutBuilder(
        builder: (context, constraints) {
          print(constraints.biggest.height);
          double labelH = 50;
          double ansH = 70;
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [_yellowThing(), _yellowThing()],
              ),
              SizedBox(
                height: labelH,
                child: Label(),
              ),
              SizedBox(
                height: min(
                  280,
                  constraints.biggest.height -
                      (labelH + ansH + 21 + 28 + 8 + 12),
                ),
                child: Center(
                  child: Question(),
                ),
              ),
              SizedBox(
                height: ansH,
                child: Answer(
                  height: 70,
                ),
              ),
              // Expanded(
              //   child: Placeholder(),
              // )
            ],
          );
        },
      ),
    );
  }

  Widget _yellowThing() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 24,
        right: 24,
        top: 21,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xfffdcf3c),
          borderRadius: BorderRadius.circular(28),
        ),
        width: 50,
        height: 28,
      ),
    );
  }
}

class Answer extends StatelessWidget {
  final double height;

  const Answer({
    Key key,
    @required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(horizontal: 32),
      decoration: BoxDecoration(
        color: Color(0xfffdcf3c),
        borderRadius: BorderRadius.circular(28),
      ),
      // height: height,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 12),
              child: IconButton(
                onPressed: () => print("Press"),
                icon: Icon(
                  Icons.lightbulb_outline,
                  color: Colors.black,
                  size: 32,
                ),
              ),
            ),
          ),
          Center(
            child: AutoSizeText(
              "123123",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: NothingScheme.of(context).question,
              ),
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }
}

class Question extends StatelessWidget {
  const Question({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 8,
      ),
      child: AutoSizeText(
        "Two people are standing back Two people are standing?",
        maxLines: 6,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 44,
          fontWeight: FontWeight.bold,
          color: NothingScheme.of(context).question,
        ),
      ),
    );
  }
}

class Label extends StatelessWidget {
  const Label({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "NOTHING PUZZLE 2",
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
