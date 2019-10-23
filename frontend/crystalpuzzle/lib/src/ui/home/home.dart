import 'package:crystalpuzzle/src/ui/home/curvebar.dart';
import 'package:crystalpuzzle/src/ui/home/pages.dart';
import 'package:crystalpuzzle/src/ui/pages/pages.dart';

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String title;
  final Duration duration = const Duration(milliseconds: 220);
  final Curve curve = Curves.easeOut;

  HomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      appBar: _makeAppBar(context),
      bottomNavigationBar: _makeNavBar(context),
      body: Pages(
        duration: duration,
        curve: curve,
        pages: [
          PageOne(),
          PageTwo(),
          PageThree(),
        ],
      ),
    );
  }

  _makeAppBar(BuildContext context) {
    AppBar(
      title: Text(title),
      backgroundColor: Theme.of(context).accentColor,
      elevation: 0,
    );
  }

  _makeNavBar(context) {
    return CurveBar(items: [
      Icon(Icons.add, size: 30),
      Icon(Icons.list, size: 30),
      Icon(Icons.compare_arrows, size: 30),
    ], height: 54, duration: duration, curve: curve);
  }
}
