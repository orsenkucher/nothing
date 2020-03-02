import 'package:flutter/material.dart';
import 'package:nothing/color/scheme.dart';

class Label extends StatelessWidget {
  const Label({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "NOTHING PUZZLE 2",
        style: TextStyle(
          fontSize: 20,
          color: NothingScheme.of(context).label,
        ),
      ),
    );
  }
}
