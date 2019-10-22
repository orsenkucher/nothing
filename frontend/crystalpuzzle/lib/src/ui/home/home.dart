import 'package:crystalpuzzle/src/ui/home/curvebar.dart';
import 'package:crystalpuzzle/src/ui/home/pages.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String title;

  HomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      appBar: _makeAppBar(context),
      bottomNavigationBar: _makeNavBar(context),
      body: Pages(),
    );
  }

  _makeAppBar(BuildContext context) {
    return AppBar(
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
    ], height: 54);
  }
}
