import 'package:flutter/material.dart';
import 'package:nothing/color/scheme.dart';

class Knob extends StatelessWidget {
  final IconData icon;
  final Function onPress;
  const Knob(this.icon, [this.onPress]);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: NothingScheme.of(context).knob,
        borderRadius: NothingScheme.of(context).knobBorder,
      ),
      width: 50,
      height: 28,
      child: IconButton(
        padding: EdgeInsets.zero,
        onPressed: onPress,
        icon: Icon(icon),
      ),
    );
  }
}
