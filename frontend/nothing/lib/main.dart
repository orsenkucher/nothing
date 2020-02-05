import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:nothing/bloc/feed/bloc.dart';
import 'package:nothing/bloc/questions/bloc.dart';
import 'package:nothing/bloc/summary/bloc.dart';
import 'package:nothing/color/scheme.dart';
import 'package:nothing/data/questions_repo.dart';
import 'package:nothing/tools/orientation.dart';
import 'package:nothing/ui/home.dart';

// TODO
// [ ] remove all todos
// [ ] check all comments
// [+] make consts whenever possible
// [+] make animations sharper
// [+] better animations
// [+] fix all index out of range
// [+] fix orientation on startup
// [+] finish card material and card content
// [+] make slider
// [+] do i need `tools` folder
// [+] fast-swipe protection (300ms)
void main() async {
  await _hydrateAsync();
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
        BlocProvider<SummaryBloc>(
          create: (context) => SummaryBloc(),
        ),
        BlocProvider<QuestionsBloc>(
          create: (context) => QuestionsBloc(
            summaryBloc: BlocProvider.of<SummaryBloc>(context),
            repo: LocalQuestionsRepo(), // CloudQuestionsRepo LocalQuestionsRepo
            loadCount: 12,
          ),
        ),
        BlocProvider<FeedBloc>(
          create: (context) => FeedBloc(
            questionsBloc: BlocProvider.of<QuestionsBloc>(context),
            threshold: 8,
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
