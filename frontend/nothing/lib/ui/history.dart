import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nothing/bloc/history/bloc.dart';
import 'package:nothing/color/scheme.dart';

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
            offAxisFraction: -0.9,
            diameterRatio: 2.5,
            itemExtent: 150,
            physics: BouncingScrollPhysics(),
            clipToSize: true,
            renderChildrenOutsideViewport: false,
            children: state.answers
                .map((x) => Padding(
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
                      )),
                    ))
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
