import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crystalpuzzle/src/bloc/playbloc/bloc.dart';

class Newpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(28),
          ),
        ),
        FractionallySizedBox(
          heightFactor: 0.46,
          child: Container(
            width: 376,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(28),
            ),
            child: BlocBuilder<PlayBloc, PlayState>(
              builder: (context, state) {
                switch (state.runtimeType) {
                  case TasksState:
                    return DisplayTask2(state: state);
                }
                return Container();
              },
            ),
          ),
        ),
        Positioned(
          bottom: 331,
          left: 50,
          right: 50,
          child: Container(
            height: 78,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 4,
              ),
              borderRadius: BorderRadius.circular(28),
            ),
            child: BlocBuilder<PlayBloc, PlayState>(
              builder: (context, state) {
                switch (state.runtimeType) {
                  case TasksState:
                    return Center(
                      child: Text(
                        (state as TasksState).tasks[0].answers[0],
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                }
                return Container();
              },
            ),
          ),
        ),
      ],
    );
  }
}

class DisplayTask2 extends StatelessWidget {
  final TasksState state;
  const DisplayTask2({
    this.state,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var task = state.tasks[0];
    return Align(
      child: Text(
        task.question,
        style: TextStyle(
          color: Colors.white,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
