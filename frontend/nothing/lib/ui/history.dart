import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nothing/bloc/history/bloc.dart';
import 'package:nothing/color/scheme.dart';

class History extends StatelessWidget {
  final void Function() onBack;

  const History(this.onBack);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      child: Stack(
        children: [
          GestureDetector(onTap: onBack),
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
                onPressed: onBack,
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
        builder: (context, state) => Container(
          color: NothingScheme.of(context).historyBg,
          child: ListWheelScrollView(
            // offAxisFraction: -0.9,
            diameterRatio: 4,
            itemExtent: 150,
            physics: BouncingScrollPhysics(),
            clipToSize: true,
            renderChildrenOutsideViewport: false,
            children: state.answers
                .map(
                  (x) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            '${x.qid}',
                            style: TextStyle(fontSize: 40),
                          )
                        ],
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ),
      FuzzyOut(Location.up),
      FuzzyOut(Location.down),
    ]);
  }
}

enum Location { up, down }

extension Location$ on Location {
  static const align = {
    Location.up: Alignment.topCenter,
    Location.down: Alignment.bottomCenter,
  };
  static const inverse = {
    Location.up: Location.down,
    Location.down: Location.up,
  };
  Alignment get alignment => align[this];
  Location operator ~() => inverse[this];
}

class FuzzyOut extends StatelessWidget {
  final Location loc;
  const FuzzyOut(this.loc);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: loc.alignment,
      child: Container(
        height: 64,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                NothingScheme.of(context).historyBg,
                NothingScheme.of(context).historyBg.withOpacity(0)
              ],
              begin: loc.alignment,
              end: (~loc).alignment,
              stops: [0.5, 1]),
        ),
      ),
    );
  }
}
