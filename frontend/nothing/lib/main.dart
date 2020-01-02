import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nothing/bloc/feed/bloc.dart';
import 'package:nothing/bloc/questions/bloc.dart';
import 'package:nothing/bloc/summary/bloc.dart';
import 'package:nothing/data/questions_repo.dart';
import 'package:nothing/ui/home.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SummaryBloc>(
          create: (context) => SummaryBloc(
            // questionsBloc: BlocProvider.of<QuestionsBloc>(context),
          ),
        ),
        BlocProvider<QuestionsBloc>(
          create: (context) => QuestionsBloc(
            summaryBloc: BlocProvider.of<SummaryBloc>(context),
            repo: CloudQuestionsRepo(),
            loadCount: 6,
          ),
        ),
        BlocProvider<FeedBloc>(
          create: (context) => FeedBloc(
            questionsBloc: BlocProvider.of<QuestionsBloc>(context),
            threshold: 6,
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Nothing',
        theme: ThemeData(
          fontFamily: 'Gilroy',
        ),
        home: Home(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
