import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nothing/bloc/history/bloc.dart';
import 'package:nothing/color/scheme.dart';
import 'package:nothing/ui/yellowknob.dart';

class HistoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var safeWrap = (Widget w) => Platform.isIOS ? w : SafeArea(child: w);
    return NothingScheme(
      child: Scaffold(
        body: Stack(children: [
          BlocBuilder<HistoryBloc, HistoryState>(
            builder: (context, state) => Container(
              color: NothingScheme.of(context).card,
              child: ListWheelScrollView(
                // perspective: 0.006,
                // offAxisFraction: 1,
                itemExtent: 150,
                physics: BouncingScrollPhysics(),
                // overAndUnderCenterOpacity: 0.9,
                // overAndUnderCenterOpacity: 0.4,
                // magnification: 1.2,
                // useMagnifier: true,
                // children: state.answers
                //     .map((e) => Card(
                //           child: Text('${e.qid}'),
                //         ))
                //     .toList(),
                clipToSize: false,
                // squeeze: 3,
                // diameterRatio: 3,
                renderChildrenOutsideViewport: true,
                children: state.answers
                    .map((x) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Material(
                            elevation: 3,
                            borderRadius: BorderRadius.circular(8),
                            color: NothingScheme.of(context).textbase,
                            child: Center(child: Text('${x.qid}')),
                          ),
                        ))
                    .toList(),
                // children: <Widget>[
                //   Text("hello"),
                //   Text("world"),
                //   Text("from"),
                //   Text("NOTHING"),
                //   Text("2.0")
                // ]
                //     .map((e) => GestureDetector(
                //           onVerticalDragDown: (_) => print('HELLo'),
                //           child: Card(
                //             margin: EdgeInsets.all(10),
                //             // color: Colors.brown,
                //             elevation: 7,
                //             child: SizedBox(
                //               height: 150,
                //               width: 110,
                //               child: Center(
                //                   child: OutlineButton(
                //                 color: Colors.red,
                //                 child: e,
                //                 onPressed: () => print('heh'),
                //                 splashColor: Colors.purple,
                //               )),
                //             ),
                //           ),
                //         ))
                //     .map((x) => Row(
                //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //           mainAxisSize: MainAxisSize.max,
                //           children: <Widget>[x, x, x],
                //         ))
                //     .toList(),
              ),
            ),
          ),
          safeWrap(
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: YellowKnob(
                  Icons.arrow_back_ios, () => {Navigator.pop(context)}),
            ),
          )
        ]),
      ),
    );
  }
}
