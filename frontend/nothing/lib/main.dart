import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nothing/bloc/problem/bloc.dart';
import 'package:nothing/bloc/problems/bloc.dart';
import 'package:nothing/data/problem_repo.dart';
import 'package:nothing/ui/hub.dart';

void main() => runApp(App());

// [+] Make 2 blocs
// [.] Rework all bloc states and events with sumtypes
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProblemBloc>(builder: (context) => ProblemBloc()),
        BlocProvider<ProblemsBloc>(
          builder: (context) => ProblemsBloc(
            problemRepo: CloudProblemRepo(),
            context: context,
          ),
        )
      ],
      child: MaterialApp(
        title: 'Nothing',
        theme: ThemeData(),
        home: Hub(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
