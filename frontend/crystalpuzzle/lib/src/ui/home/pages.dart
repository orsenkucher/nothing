import 'package:crystalpuzzle/src/ui/home/bloc/bloc.dart';
import 'package:crystalpuzzle/src/ui/home/bloc/page_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Pages extends StatefulWidget {
  @override
  _PagesState createState() => _PagesState();
}

class _PagesState extends State<Pages> {
  int _animations = 0;
  PageController _controller;

  _PagesState() {
    _controller = PageController(
      viewportFraction: .8,
    );
  }

  @override
  Widget build(BuildContext context) {
    var duration = Duration(milliseconds: 220);
    var curve = Curves.easeOut;
    return Center(
      child: PageView.builder(
        controller: _controller,
        itemCount: 3,
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
                var idx = state.index;
                _animations++;
                _controller
                    .animateToPage(state.index,
                        duration: duration, curve: curve)
                    .then((_) {
                  _animations--;
                });
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
                      '$idx',
                      style: Theme.of(context)
                          .textTheme
                          .display1
                          .copyWith(color: Colors.white),
                    ),
                  ],
                );
              } else {
                return Container();
              }
            },
          );
        },
      ),
    );
  }
}
