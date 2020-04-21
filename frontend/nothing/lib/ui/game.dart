import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nothing/bloc/feed/bloc.dart';
import 'package:nothing/ignitor/ignitor.dart';

class Test extends StatelessWidget {
  const Test({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeedBloc, Ignitable<FeedState>>(
      condition: (previous, current) {
        // print('current in test: $current');
        return true;
      },
      builder: (context, state) => Positioned(
        top: 10,
        left: 0,
        child: Align(
          alignment: Alignment.center,
          child: Text(
            '${state.payload.when(available: (tree) => tree.question.id, empty: () => 'no id')}, '
            '${state.payload.when(available: (tree) => tree.question.mmr, empty: () => 'no mmr')}',
            style: TextStyle(
              fontSize: 16,
              color: Color(0x88c02030),
            ),
          ),
        ),
      ),
    );
  }
}
