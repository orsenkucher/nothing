import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:nothing/binding/control.dart';
import 'package:nothing/bloc/history/bloc.dart';
import 'package:nothing/bloc/summary/bloc.dart';
import 'package:nothing/color/scheme.dart';
import 'package:nothing/icons/icons.dart';

class History extends StatefulWidget {
  final void Function() onBack;
  final AnimationController swipeController;

  const History(this.onBack, this.swipeController);

  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> with AutomaticKeepAliveClientMixin<History> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final colors = [Colors.amber, Colors.amber.withOpacity(0)];
    return _feedListener(Container(
      color: Colors.amber,
      child: Stack(
        children: [
          GestureDetector(onTap: widget.onBack),
          Padding(
            padding: const EdgeInsets.only(left: 100),
            child: Container(
              color: NothingScheme.of(context).background,
              child: HistoryStack(swipeController: widget.swipeController),
            ),
          ),
          SizedBox(
            width: 100,
            child: FuzzyOut(height: 120, loc: Location.up, colors: colors, stops: const [0.5, 0.8]),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.all(40),
              child: Text('Levels', style: TextStyle(fontSize: 36)),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: IconButton(
                padding: const EdgeInsets.all(40),
                icon: Icon(Icons.arrow_back_ios),
                onPressed: widget.onBack,
              ),
            ),
          ),
        ],
      ),
    ));
  }

  Widget _feedListener(Widget child) {
    return BlocListener<ControlCubit, ControlState>(
      listener: (context, state) {
        widget.onBack();
      },
      child: child,
    );
  }
}

class HistoryStack extends StatelessWidget {
  const HistoryStack({
    Key key,
    this.swipeController,
  }) : super(key: key);

  final AnimationController swipeController;

  @override
  Widget build(BuildContext context) {
    final colors = [NothingScheme.of(context).historyBg, NothingScheme.of(context).historyBg.withOpacity(0)];
    return Stack(children: [
      BlocBuilder<HistoryBloc, HistoryState>(
        builder: (context, state) => HookBuilder(
          builder: (context) {
            const itemExtent = 60.0;
            final scrollController = useScrollController();
            useEffect(() {
              WidgetsBinding.instance.addPostFrameCallback(
                (_) => scrollController.jumpTo(itemExtent * (state.items.length - 8)),
              );
              return;
            });
            return Container(
              child: ListView(
                itemExtent: itemExtent,
                clipBehavior: Clip.none,
                controller: scrollController,
                physics: const BouncingScrollPhysics(),
                children: [
                  const SizedBox(),
                  const SizedBox(),
                  ..._items(context, state.items),
                  const SizedBox(),
                ],
              ),
            );
          },
        ),
      ),
      FuzzyOut(height: 120, loc: Location.up, colors: colors, stops: const [0.5, 0.8]),
    ]);
  }

  Iterable<Widget> _items(BuildContext context, List<HistoryItem> items) {
    var counter = 0;
    return items.map(
      (item) => Padding(
        padding: const EdgeInsets.only(left: 12),
        child: Stack(
          children: [
            if (item.answered)
              AnimatedBuilder(
                animation: swipeController,
                builder: (context, child) {
                  final value = swipeController.value;
                  return Transform.translate(offset: Offset(value * 100 / 2, 0), child: child);
                },
                child: Transform.translate(
                  offset: const Offset(-24, -4),
                  child: Transform.scale(
                    scale: 1.18,
                    child: Card(
                      margin: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 4.0),
                      // margin: const EdgeInsets.all(6.0),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
                      clipBehavior: Clip.antiAlias,
                      elevation: 2,
                      color: Colors.black,
                      child: SizedBox.expand(),
                    ),
                  ),
                ),
              ),
            if (item.answered)
              AnimatedBuilder(
                animation: swipeController,
                builder: (context, child) {
                  final value = swipeController.value;
                  return Transform.scale(
                    scale: 1 - value,
                    alignment: FractionalOffset.center,
                    child: child,
                  );
                },
                child: Transform.translate(
                  offset: const Offset(-62, -4),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.0)),
                      clipBehavior: Clip.antiAlias,
                      elevation: 2,
                      color: Colors.black,
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: AnimatedBuilder(
                          animation: swipeController,
                          builder: (context, child) {
                            final value = swipeController.value;
                            return Opacity(
                              opacity: (1 - value * 3).clamp(0.0, 1.0),
                              child: child,
                            );
                          },
                          child: counter == items.length - 1
                              ? Transform.rotate(
                                  angle: pi,
                                  child: Transform.scale(
                                    scale: 0.65,
                                    child: Icon(NothingFont.skip, color: Colors.white),
                                  ),
                                )
                              : Transform.scale(
                                  scale: 0.65,
                                  child: Icon(NothingFont.skip, color: Colors.white),
                                ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            FlatButton(
              padding: const EdgeInsets.all(8.0),
              onPressed: () {
                final pos = counter;
                // if (item.answered) return null;
                return () => context.bloc<ControlCubit>().select(pos);
              }(),
              splashColor: Colors.white.withOpacity(0.2),
              // splashColor: NothingScheme.of(context).hint.withOpacity(0.2),
              // highlightColor: NothingScheme.of(context).neutral.withOpacity(0.1),
              child: Row(mainAxisSize: MainAxisSize.max, children: [
                Flexible(
                  child: Text(
                    '${counter += 1}. ${item.question.question}',
                    maxLines: 1,
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                    style: TextStyle(
                      fontSize: 31,
                      color: _itemColor(context, item.answer),
                    ),
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }

  Color _itemColor(BuildContext context, SummaryAnswer answer) =>
      answer.tries > 0 ? NothingScheme.of(context).question : Colors.white;
}

enum Location { up, down }

extension Location$ on Location {
  Alignment get alignment => const {
        Location.up: Alignment.topCenter,
        Location.down: Alignment.bottomCenter,
      }[this];

  Location operator ~() => const {
        Location.up: Location.down,
        Location.down: Location.up,
      }[this];
}

class FuzzyOut extends StatelessWidget {
  final Location loc;
  final double height;
  final List<double> stops;
  final List<Color> colors;
  const FuzzyOut({this.loc, this.height, this.colors, this.stops = const [0.5, 1]});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: loc.alignment,
      child: Container(
        height: height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: colors,
            begin: loc.alignment,
            end: (~loc).alignment,
            stops: stops,
          ),
        ),
      ),
    );
  }
}
