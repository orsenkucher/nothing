import 'package:flutter/material.dart';

class PageTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Current index:',
          style: TextStyle(
            color: Theme.of(context).canvasColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'Page 2',
          style: Theme.of(context)
              .textTheme
              .display1
              .copyWith(color: Colors.white),
        ),
      ],
    );
  }
}
