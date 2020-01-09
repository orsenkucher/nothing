import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nothing/bloc/feed/bloc.dart';
import 'package:nothing/bloc/questions/bloc.dart';
import 'package:nothing/bloc/summary/bloc.dart';
import 'package:nothing/color/scheme.dart';
import 'package:nothing/data/questions_repo.dart';
import 'package:nothing/tools/orientation.dart';
import 'package:nothing/ui/home.dart';

void main() => runApp(const App());

// TODO
// remove all todos
// check all comments
// make consts whenever possible
// make animations sharper
// fix all index out of range
// fix orientation on startup
// finish card material and card content
// better animations
// make slider
// do i need `tools` folder
class App extends StatelessWidget with PortraitLock {
  const App();
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider<SummaryBloc>(
          create: (context) => SummaryBloc(),
        ),
        BlocProvider<QuestionsBloc>(
          create: (context) => QuestionsBloc(
            summaryBloc: BlocProvider.of<SummaryBloc>(context),
            repo: LocalQuestionsRepo(), // CloudQuestionsRepo LocalQuestionsRepo
            loadCount: 10,
          ),
        ),
        BlocProvider<FeedBloc>(
          create: (context) => FeedBloc(
            questionsBloc: BlocProvider.of<QuestionsBloc>(context),
            summaryBloc: BlocProvider.of<SummaryBloc>(context),
            threshold: 6,
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Nothing',
        theme: ThemeData(
          fontFamily: 'Gilroy',
        ),
        home: NothingScheme(
          child: Home(),
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
