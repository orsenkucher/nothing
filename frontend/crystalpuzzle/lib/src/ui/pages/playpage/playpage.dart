import 'package:crystalpuzzle/src/ui/pages/playpage/bloc/bloc.dart';
import 'package:crystalpuzzle/src/ui/pages/playpage/bloc/play_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlayPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayBloc, PlayState>(
      builder: (context, state) {
        switch (state.runtimeType) {
          case LoadingState:
            return Loading();
          case TasksState:
            return DisplayTask(state: state);
        }
        return Container();
      },
    );
  }
}

class DisplayTask extends StatelessWidget {
  final TasksState state;
  const DisplayTask({
    this.state,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: state.tasks
          .map(
            (t) => Card(
              child: Text(
                t.question,
              ),
            ),
            // Text(
            //   t.question,
            //   style: Theme.of(context)
            //       .textTheme
            //       .display1
            //       .copyWith(color: Colors.white),
            // ),
            // Text(
            //   t.explanation,
            //   style: Theme.of(context)
            //       .textTheme
            //       .body1
            //       .copyWith(color: Colors.white),
            // ))
          )
          .toList(),
    );
  }
}

class Loading extends StatelessWidget {
  const Loading({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 150,
        width: 150,
        child: CircularProgressIndicator(
          backgroundColor: Colors.white,
          strokeWidth: 8,
        ),
      ),
    );
  }
}
