import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:nothing/bloc/problem/bloc.dart';
// import 'package:nothing/bloc/problems/bloc.dart';
import 'package:nothing/bloc/questions/bloc.dart';
// import 'package:nothing/data/problems_repo.dart';
import 'package:nothing/data/questions_repo.dart';
import 'package:nothing/ui/hub.dart';

void main() => runApp(App());

// [+] Make 2 blocs
// [+] How to persist some state in bloc
// [+] Repo ln: 16 exception
// [+] Connect to firebase ios / android
// [.] Divide widgets into smaller & define widget-wide params
// [.] Fix symbol rendering
// [+] Arrow button tap, clear TextField
// [.] Rework all bloc states and events with sumtypes
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // BlocProvider<ProblemsBloc>(
        //   builder: (context) => ProblemsBloc(problemsRepo: CloudProblemsRepo()),
        //   // CloudProblemsRepo | LocalProblemsRepo
        // ),
        // BlocProvider<ProblemBloc>(
        //   builder: (context) =>
        //       ProblemBloc(problemsBloc: BlocProvider.of<ProblemsBloc>(context)),
        // ),
        BlocProvider<QuBloc>(
          builder: (context) => QuBloc(qusRepo: CloudQuestionsRepo()),
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
