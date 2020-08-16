import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nothing/bloc/feed/bloc.dart';
import 'package:nothing/bloc/history/bloc.dart';
import 'package:nothing/color/scheme.dart';
import 'package:nothing/domain/domain.dart';

class History extends StatefulWidget {
  final void Function() onBack;

  const History(this.onBack);

  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> with AutomaticKeepAliveClientMixin<History> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Container(
      color: Colors.amber,
      child: Stack(
        children: [
          GestureDetector(onTap: widget.onBack),
          Padding(
            padding: const EdgeInsets.only(left: 100),
            child: Container(
              color: NothingScheme.of(context).background,
              child: HistoryStack(),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.all(40),
              child: Text('Уровни', style: TextStyle(fontSize: 36)),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(40),
              child: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: widget.onBack,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HistoryStack extends StatelessWidget {
  const HistoryStack({
    Key key,
  }) : super(key: key);

  @override
  //  WillPopScope()
  Widget build(BuildContext context) {
    return Stack(children: [
      BlocBuilder<HistoryBloc, HistoryState>(
        builder: (context, state) {
          var counter = 0;
          return Container(
            color: NothingScheme.of(context).historyBg,
            child: ListView(
              itemExtent: 70,
              physics: const BouncingScrollPhysics(),
              children: [
                SizedBox(height: 40),
                ...state.items.map(
                  (it) => Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Flexible(
                            child: FlatButton(
                              onPressed: () {
                                final pos = counter;
                                return () {
                                  print('pos: $pos');
                                  final tree = QTree(question: state.items[pos].question);
                                  // и тут посторить дерево из всех скипнутых, а если это последний,
                                  // то спросит сервер что дальше
                                  context.bloc<FeedBloc>().add(FeedEvent.newArrived(tree));
                                };
                              }(),
                              child: Text(
                                '${counter += 1}. ${it.question.question}',
                                maxLines: 1,
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 31),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
      FuzzyOut(height: 120, loc: Location.up),
      FuzzyOut(height: 32, loc: Location.down, stops: const [0, 1]),
    ]);
  }
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
  const FuzzyOut({this.loc, this.height, this.stops = const [0.5, 1]});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: loc.alignment,
      child: Container(
        height: height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [NothingScheme.of(context).historyBg, NothingScheme.of(context).historyBg.withOpacity(0)],
            begin: loc.alignment,
            end: (~loc).alignment,
            stops: stops,
          ),
        ),
      ),
    );
  }
}
