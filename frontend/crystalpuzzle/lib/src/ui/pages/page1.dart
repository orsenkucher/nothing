import 'package:flutter/material.dart';

class PageOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
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
            'Page 1',
            style: Theme.of(context)
                .textTheme
                .display1
                .copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
