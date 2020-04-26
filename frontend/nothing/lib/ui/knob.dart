import 'package:flutter/material.dart';
import 'package:nothing/color/scheme.dart';

class Knob extends StatelessWidget {
  final IconData icon;
  final Function onPress;
  const Knob(this.icon, [this.onPress]);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        decoration: BoxDecoration(
          color: NothingScheme.of(context).knob,
          borderRadius: NothingScheme.of(context).knobBorder,
        ),
        width: 50,
        height: 40,
        child: Icon(icon),
      ),
    );
  }
}
