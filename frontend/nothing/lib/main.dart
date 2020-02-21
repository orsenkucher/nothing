import 'dart:io';

import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:nothing/bloc/feed/bloc.dart';
import 'package:nothing/bloc/id/bloc.dart';
import 'package:nothing/bloc/questions/bloc.dart';
import 'package:nothing/bloc/summary/bloc.dart';
import 'package:nothing/bloc/validation/bloc.dart';
import 'package:nothing/color/scheme.dart';
import 'package:nothing/repository/questions.dart';
import 'package:nothing/tools/orientation.dart';
import 'package:nothing/ui/home.dart';

// TODOs
// currentid is always -1
// SummaryState does not hydrate
// add seconds, tries to ValidationBloc
// calc where to move (left|right)
void main() async {
  await _hydrateAsync();
  if (Platform.isIOS) SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(const App());
}

Future _hydrateAsync() async {
  WidgetsFlutterBinding.ensureInitialized();
  BlocSupervisor.delegate = await HydratedBlocDelegate.build();
}

class App extends StatelessWidget with PortraitLock {
  const App();
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider<IdBloc>(
          create: (context) => IdBloc(),
        ),
        BlocProvider<FeedBloc>(
          create: (context) => FeedBloc(),
        ),
        BlocProvider<ValidationBloc>(
          create: (context) => ValidationBloc(
            feed: BlocProvider.of<FeedBloc>(context),
          ),
        ),
        BlocProvider<SummaryBloc>(
          create: (context) => SummaryBloc(
            validation: BlocProvider.of<ValidationBloc>(context),
          ),
        ),
        BlocProvider<QuestionsBloc>(
          create: (context) => QuestionsBloc(
            summaryBloc: BlocProvider.of<SummaryBloc>(context),
            idBloc: BlocProvider.of<IdBloc>(context),
            feed: BlocProvider.of<FeedBloc>(context),
            repo: CloudQuestionsRepo(), // CloudQuestionsRepo LocalQuestionsRepo
          ),
        ),
      ],
      child: MaterialApp(
        title: 'NOTHING 2',
        theme: ThemeData(
          fontFamily: 'Gilroy',
        ),
        home: NothingScheme(
          child: Home(),
        ),
        color: NothingScheme.app,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
