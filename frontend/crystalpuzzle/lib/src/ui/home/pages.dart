import 'package:crystalpuzzle/src/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Pages extends StatefulWidget {
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
      viewportFraction: 1,
      initialPage: BlocProvider.of<PageBloc>(context).initialState.index,
    );
  }

  var img1 = 'https://w.wallhaven.cc/full/13/wallhaven-13gom9.jpg';
  var img2 = 'https://w.wallhaven.cc/full/q6/wallhaven-q6omvd.jpg';
  var img3 = 'https://w.wallhaven.cc/full/md/wallhaven-mdyvvm.jpg';
  var img4 = 'https://w.wallhaven.cc/full/j5/wallhaven-j589rq.png';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(img4),
            fit: BoxFit.cover,
          ),
        ),
        child: PageView.builder(
          controller: _controller,
          itemCount: widget.pages.length,
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          pageSnapping: true,
          onPageChanged: (index) {
            if (_animations == 0) {
              BlocProvider.of<PageBloc>(context).add(
                PageChanged(index: index, invoker: Invoker.pageview),
              );
            }
          },
          itemBuilder: (context, i) {
            return BlocListener<PageBloc, PageState>(
              listener: (context, state) {
                if (state is PageStateIndex &&
                    state.invoker != Invoker.pageview) {
                  _runPageAnimation(
                    state,
                    widget.duration,
                    widget.curve,
                  );
                }
              },
              child: widget.pages[i],
            );
          },
        ),
      ),
    );
  }

  void _runPageAnimation(PageStateIndex state, Duration duration, Curve curve) {
    _animations++;
    _controller
        .animateToPage(state.index, duration: duration, curve: curve)
        .then((_) {
      _animations--;
    });
  }
}
