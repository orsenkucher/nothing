import 'package:crystalpuzzle/src/ui/home/bloc/bloc.dart';
import 'package:crystalpuzzle/src/ui/home/bloc/page_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Pages extends StatefulWidget {
  // final List<Widget Function(BuildContext, PageState)> pageBuilders;
  final List<Widget> pages;
  final Duration duration;
  final Curve curve;

  Pages({
    @required this.pages,
    @required this.duration,
    @required this.curve,
  });

  @override
  _PagesState createState() => _PagesState();
}

class _PagesState extends State<Pages> {
  int _animations = 0;
  PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController(
      viewportFraction: .8,
      initialPage: 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: PageView.builder(
        controller: _controller,
        itemCount: widget.pages.length,
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        pageSnapping: true,
        onPageChanged: (index) {
          if (_animations == 0) {
            BlocProvider.of<PageBloc>(context).add(
              PageChanged(index: index),
            );
          }
        },
        itemBuilder: (context, i) {
          return BlocBuilder<PageBloc, PageState>(
            builder: (context, state) {
              if (state is PageStateIndex) {
                _runPageAnimation(
                  state,
                  widget.duration,
                  widget.curve,
                );
              }
              return widget.pages[i];
            },
          );
        },
      ),
    );
  }

  void _runPageAnimation(PageStateIndex state, Duration duration, Cubic curve) {
    _animations++;
    _controller
        .animateToPage(state.index, duration: duration, curve: curve)
        .then((_) {
      _animations--;
    });
  }
}
