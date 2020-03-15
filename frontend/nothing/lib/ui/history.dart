import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nothing/bloc/history/bloc.dart';
import 'package:nothing/bloc/routing/bloc.dart';
import 'package:nothing/color/scheme.dart';
import 'package:nothing/ui/knob.dart';

class HistoryList extends StatelessWidget {
  void _back(BuildContext context) {
    // context // TODO do bloc screens management?
    //     .bloc<RoutingBloc>()
    //     .add(RoutingEvent.push(to: 'home')); // TODO use RoutingBloC
    // Navigator.pop(context);
    context
        .bloc<RoutingBloc>()
        .add(RoutingEvent.pop(from: Routes.history().name));
  }

  @override
  Widget build(BuildContext context) {
    var safeWrap = (Widget w) => Platform.isIOS ? w : SafeArea(child: w);
    return WillPopScope(
      onWillPop: () async {
        _back(context);
        return false;
      },
      child: Scaffold(
        body: Stack(children: [
          BlocBuilder<HistoryBloc, HistoryState>(
            builder: (context, state) => Container(
              color: NothingScheme.of(context).historyBg,
              child: ListWheelScrollView(
                // perspective: 0.006,
                // offAxisFraction: .2,
                // squeeze: 3,

                // perspective: 0.0001,
                offAxisFraction: -0.9,
                // offAxisFraction: -1,
                diameterRatio: 2.5,
                // useMagnifier: true,
                // magnification: 1.6,
                // overAndUnderCenterOpacity: 0.4,

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
                              ),
                              // Knob(Icons.arrow_forward_ios, () => {})
                            ],
                          )),
                        ))
                    .toList(),
              ),
            ),
          ),
          FuzzyOut(Location.up),
          FuzzyOut(Location.down),
          safeWrap(
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Knob(Icons.arrow_back_ios, () => _back(context)),
            ),
          ),
        ]),
      ),
    );
  }
}

enum Location { up, down }

extension $Location on Location {
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
