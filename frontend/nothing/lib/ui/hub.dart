import 'package:flutter/material.dart';
import 'package:nothing/ui/solve_problems.dart';
import 'package:nothing/ui/swipecard.dart';

class Hub extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SwipeCard(
        allowVertical: true,
        child: _spawnContent(),
      ),
    );
  }

  Widget _spawnContent() {
    return Card(
      elevation: 7,
      child: FractionallySizedBox(
        widthFactor: 0.9,
        heightFactor: 0.9,
        child: FlutterLogo(
          size: 10,
        ),
      ),
    );
  }
}
