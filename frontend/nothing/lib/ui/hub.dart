import 'package:flutter/material.dart';
import 'package:nothing/ui/cards.dart';
import 'package:nothing/ui/powercard.dart';
import 'package:nothing/ui/solve_problems.dart';
import 'package:nothing/ui/swipecard.dart';

class Hub extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Cards(
        cardSize: Size(
          size.width * .8,
          size.height * .8,
        ),
        children: <Widget>[
          _spawnContent(),
          _spawnContent(),
          _spawnContent(),
        ],
      ),
    );
  }

  Widget _spawnContent() {
    return Card(
      elevation: 7,
      child: FlutterLogo(
        size: 10,
      ),
    );
  }
}
