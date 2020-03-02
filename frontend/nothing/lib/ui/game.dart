import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nothing/bloc/feed/bloc.dart';
import 'package:nothing/ui/answer.dart';
import 'package:nothing/ui/history.dart';
import 'package:nothing/ui/knob.dart';
import 'package:nothing/ui/label.dart';
import 'package:nothing/ui/question.dart';

class Game extends StatelessWidget {
  const Game({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var safeWrap = (Widget w) => Platform.isIOS ? w : SafeArea(child: w);
    return safeWrap(
      LayoutBuilder(
        builder: (context, constraints) {
          double labelH = 50;
          double ansH = 70;
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _makeKnob(Icons.add_shopping_cart),
                  _makeKnob(Icons.history, () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HistoryList(),
                        ));
                  }),
                ],
              ),
              SizedBox(
                height: labelH,
                child: Stack(children: [Label(), Test()]),
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
                child: Answer(),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _makeKnob(IconData icon, [Function onPress]) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 24,
        right: 24,
        top: 21,
      ),
      child: Knob(icon, onPress),
    );
  }
}

class Test extends StatelessWidget {
  const Test({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeedBloc, FeedState>(
      condition: (previous, current) {
        print("************************");
        print(current);
        return true;
      },
      builder: (context, state) => Align(
        alignment: Alignment.centerRight,
        child: Text(
          '${state?.tree?.question?.id?.toString() ?? "no id"}, ${state?.tree?.question?.mmr?.toString() ?? "no mmr"}',
          style: TextStyle(
            fontSize: 16,
            color: Color(0x88c02030),
          ),
        ),
      ),
    );
  }
}