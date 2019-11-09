import 'package:flutter/material.dart';
import 'package:nothing/ui/powercard.dart';
import 'package:nothing/ui/solve_problems.dart';
import 'package:nothing/ui/swipecard.dart';

class Hub extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: SwipeCard(
      //   horizontalMultiplier: 1.25,
      //   child: _spawnContent(),
      // ),
      body: Stack(
        children: [
          PowerCard(
            child: _spawnContent(),
          ),
        ],
      ),
    );
  }

  Widget _spawnContent() {
    return FractionallySizedBox(
      widthFactor: 0.9,
      heightFactor: 0.9,
      child: Card(
        elevation: 7,
        child: FlutterLogo(
          size: 10,
        ),
      ),
    );
  }
}
