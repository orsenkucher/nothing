import 'package:flutter/material.dart';

class PageOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        // color: Colors.red,
        height: 20,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Current index:',
              style: Theme.of(context)
                  .textTheme
                  .display1
                  .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            Text(
              'Page 1',
              style: Theme.of(context)
                  .textTheme
                  .display1
                  .copyWith(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
