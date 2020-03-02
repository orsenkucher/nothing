import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nothing/bloc/history/bloc.dart';
import 'package:nothing/color/scheme.dart';
import 'package:nothing/ui/knob.dart';

class HistoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var safeWrap = (Widget w) => Platform.isIOS ? w : SafeArea(child: w);
    return NothingScheme(
      child: Scaffold(
        body: Stack(children: [
          BlocBuilder<HistoryBloc, HistoryState>(
            builder: (context, state) => Container(
              color: NothingScheme.of(context).background,
              child: ListWheelScrollView(
                // perspective: 0.006,
                // offAxisFraction: 1,
                // squeeze: 3,
                // diameterRatio: 3,
                itemExtent: 150,
                physics: BouncingScrollPhysics(),
                clipToSize: true,
                renderChildrenOutsideViewport: false,
                children: state.answers
                    .map((x) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Material(
                            elevation: 3,
                            borderRadius: BorderRadius.circular(8),
                            color: NothingScheme.of(context).label,
                            child: Center(child: Text('${x.qid}')),
                          ),
                        ))
                    .toList(),
              ),
            ),
          ),
          safeWrap(
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Knob(Icons.arrow_back_ios, () => {Navigator.pop(context)}),
            ),
          ),
        ]),
      ),
    );
  }
}
