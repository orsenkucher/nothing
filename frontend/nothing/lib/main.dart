import 'dart:io';

import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nothing/binding/binder.dart';
import 'package:nothing/bloc/feed/bloc.dart';
import 'package:nothing/bloc/id/bloc.dart';
import 'package:nothing/bloc/questions/bloc.dart';
import 'package:nothing/bloc/summary/bloc.dart';
import 'package:nothing/bloc/test.dart';
import 'package:nothing/bloc/validation/bloc.dart';
import 'package:nothing/bloc/history/bloc.dart';
import 'package:nothing/color/scheme.dart';
import 'package:nothing/delegate/delegate.dart';
import 'package:nothing/repository/questions.dart';
import 'package:nothing/tools/orientation.dart';
import 'package:nothing/ui/home.dart';

void main() async {
  await _hydrateAsync();
  if (Platform.isIOS) SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(const App());
}

Future _hydrateAsync() async {
  WidgetsFlutterBinding.ensureInitialized();
  BlocSupervisor.delegate = await NothingBlocDelegate.build();
}

class App extends StatelessWidget with PortraitLock {
  const App();
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return RepositoryProvider<QuestionsRepo>(
      create: (context) => // CloudQuestionsRepo|LocalQuestionsRepo
          CloudQuestionsRepo(),
      child: _nestBlocs(_bindBlocs(
        MultiBlocBinder(
          binders: [
            BlocBinder<IdBloc, IdState, FeedBloc, FeedState>(
              f1: (BuildContext context, IdState idState, FeedBloc feedBloc) {
                print('***************************************************');
                print(idState);
                print(feedBloc);
                // feedBloc.add(FeedEvent.moveNext(MoveDir.right()));
                return;
              },
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
        ),
      )),
    );
  }

  Widget _bindBlocs(Widget child) {
    return MultiBlocListener(
      listeners: [
        BlocListener<IdBloc, IdState>(
          listener: (context, state) {
            print("********* $state");
          },
        ),
        BlocListener<FeedBloc, FeedState>(
          listener: (context, state) {
            print("*********2 $state");
          },
        ),
        BlocListener<FeedBloc, FeedState>(
          listener: (context, state) {
            print("*********3 $state");
          },
        ),
      ],
      child: child,
    );
  }

  Widget _nestBlocs(Widget child) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TestBloc>(create: (context) => TestBloc()),
        BlocProvider<IdBloc>(create: (context) => IdBloc()),
        BlocProvider<ValidationBloc>(create: (context) => ValidationBloc()),
        BlocProvider<SummaryBloc>(
          create: (context) => SummaryBloc(
            validation: context.bloc<ValidationBloc>(),
          ),
        ),
        BlocProvider<QuestionsBloc>(
          create: (context) => QuestionsBloc(
            summaryBloc: context.bloc<SummaryBloc>(),
            idBloc: context.bloc<IdBloc>(),
            repo: context.repository<QuestionsRepo>(),
          ),
        ),
        BlocProvider<FeedBloc>(
          create: (context) => FeedBloc(
            questionsBloc: context.bloc<QuestionsBloc>(),
            validationBloc: context.bloc<ValidationBloc>(),
          ),
        ),
        BlocProvider<HistoryBloc>(
          create: (context) => HistoryBloc(
            validation: context.bloc<ValidationBloc>(),
          ),
        ),
      ],
      child: child,
    );
  }
}
