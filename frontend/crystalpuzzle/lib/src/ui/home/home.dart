import 'package:crystalpuzzle/src/ui/home/curvebar.dart';
import 'package:crystalpuzzle/src/ui/home/pages.dart';
import 'package:crystalpuzzle/src/ui/pages/pages.dart';
import 'package:crystalpuzzle/src/ui/pages/playpage.dart';

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String title;
  final Duration duration = const Duration(milliseconds: 600);
  final Curve curve = Curves.easeOutExpo;

  HomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      appBar: _makeAppBar(context),
      // bottomNavigationBar: _makeNavBar(context),
      body: Stack(
        children: [
          Pages(
            duration: duration,
            curve: curve,
            pages: [
              PageOne(),
              PlayPage(),
              PageThree(),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: _makeNavBar(context),
          )
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
    // return Container(
    //   height: 70,
    //   color: Colors.transparent,
    // );
    return CurveBar(items: [
      Icon(Icons.add, size: 30, color: Colors.white),
      Icon(Icons.list, size: 30, color: Colors.white),
      Icon(Icons.compare_arrows, size: 30, color: Colors.white),
    ], height: 54, duration: duration, curve: curve);
  }
}
