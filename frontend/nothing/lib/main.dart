import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nothing/bloc/problem_bloc.dart';
import 'package:nothing/data/problem_repo.dart';
import 'package:nothing/ui/hub.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // BlocProvider<PageBloc>(builder: (context) => PageBloc()),
        BlocProvider<ProblemBloc>(
          builder: (context) => ProblemBloc(
            problemRepo: CloudProblemRepo(),
          ),
        ),
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
