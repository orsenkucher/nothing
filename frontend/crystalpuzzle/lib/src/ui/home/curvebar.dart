import 'package:crystalpuzzle/src/bloc/bloc.dart';
import 'package:crystalpuzzle/src/ui/curvebar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurveBar extends StatelessWidget {
  final List<Widget> items;
  final Duration duration;
  final Curve curve;
  final double height;

  CurveBar({
    @required this.items,
    @required this.duration,
    @required this.curve,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    var key = GlobalKey<CurvedNavigationBarState>();
    return BlocListener<PageBloc, PageState>(
      listener: (context, state) {
        if (state is PageStateIndex) {
          key.currentState?.setPage(state.index);
        }
      },
      child: CurvedNavigationBar(
        key: key,
        index: _latestState(context)?.index ?? 0,
        backgroundColor: Colors.transparent, //Theme.of(context).cardColor,
        color: Colors.black,
        animationDuration: duration,
        animationCurve: curve,
        height: height,
        items: items,
        onTap: (index) {
          BlocProvider.of<PageBloc>(context).add(
            PageChanged(index: index, invoker: Invoker.slidebar),
          );
        },
      ),
    );
  }

  PageStateIndex _latestState(BuildContext context) =>
      BlocProvider.of<PageBloc>(context).state as PageStateIndex;
}
