import 'package:flutter/material.dart';

class YellowKnob extends StatelessWidget {
  final IconData icon;
  final Function onPress;
  const YellowKnob(this.icon, [this.onPress]);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Color(0xfffdcf3c),
          borderRadius: BorderRadius.circular(28),
        ),
        width: 50,
        height: 28,
        // child: Icon(icon),
        child: IconButton(
          // splashColor: Colors.red,
          // highlightColor: Colors.transparent,
          padding: EdgeInsets.zero,
          onPressed: onPress,
          icon: Icon(icon),
        ));
  }
}
