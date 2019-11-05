import 'package:flutter/material.dart';
import 'package:nothing/ui/solve_problems.dart';
import 'package:nothing/ui/swipecard.dart';

class Hub extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SwipeCard(
        child: FlutterLogo(
          size: 100,
        ),
      ),
    );
  }
}
