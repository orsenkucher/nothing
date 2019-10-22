import 'package:crystalpuzzle/src/ui/curvebar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/bloc.dart';

class CurveBar extends StatelessWidget {
  final List<Widget> items;
  final double height;

  CurveBar({
    @required this.items,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    var duration = Duration(milliseconds: 220);
    var curve = Curves.easeOut;
    var key = GlobalKey<CurvedNavigationBarState>();
    BlocProvider.of<PageBloc>(context).listen((state) {
      if (state is PageStateIndex) {
        key.currentState.setPage(state.index);
      }
    });
    return CurvedNavigationBar(
      key: key,
      backgroundColor: Theme.of(context).accentColor,
      animationDuration: duration,
      animationCurve: curve,
      height: height,
      items: items,
      onTap: (index) {
        BlocProvider.of<PageBloc>(context).add(
          PageChanged(index: index),
        );
      },
    );
  }
}
