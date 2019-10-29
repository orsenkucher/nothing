import 'package:flutter/material.dart';
import 'package:nothing/ui/solve_problems.dart';

class Hub extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SolveProblems(
        count: 3,
      ),
    );
  }
}
