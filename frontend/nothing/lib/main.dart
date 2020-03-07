import 'dart:io';

import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nothing/binding/binder.dart';
import 'package:nothing/bloc/feed/bloc.dart';
import 'package:nothing/bloc/id/bloc.dart';
import 'package:nothing/bloc/lifecycle/bloc.dart';
import 'package:nothing/bloc/questions/bloc.dart';
import 'package:nothing/bloc/summary/bloc.dart';
import 'package:nothing/bloc/test.dart';
import 'package:nothing/bloc/validation/bloc.dart';
import 'package:nothing/bloc/history/bloc.dart';
import 'package:nothing/color/scheme.dart';
import 'package:nothing/delegate/delegate.dart';
import 'package:nothing/repository/questions.dart';
import 'package:nothing/tools/lifecycle.dart';
import 'package:nothing/tools/orientation.dart';
import 'package:nothing/ui/history.dart';
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
    return _repos(_blocs(_bindings(_LifeCycle(
      NothingScheme(
        child: MaterialApp(
          title: 'NOTHING 2',
          theme: ThemeData(
            fontFamily: 'Gilroy',
          ),
          initialRoute: '/',
          routes: {
            '/': (_) => Home(),
            '/history': (_) => HistoryList(),
          },
          color: NothingScheme.app,
          debugShowCheckedModeBanner: false,
        ),
      ),
    ))));
  }

  Widget _repos(Widget child) {
    return RepositoryProvider<QuestionsRepo>(
      child: child,
      create: (context) => CloudQuestionsRepo(),
    ); // CloudQuestionsRepo|LocalQuestionsRepo
  }

  Widget _bindings(Widget child) {
    return MultiBlocBinder(child: child, binders: [
      BlocBinder<ValidationBloc, ValidationState, SummaryBloc, SummaryState>(
        direct:
            (BuildContext context, ValidationState state, SummaryBloc bloc) {
          state.maybeWhen(
            correct: (question, tries, duration) {
              bloc.add(SummaryEvent.answer(
                qid: question.id,
                tries: tries,
                seconds: duration.inSeconds,
              ));
            },
            orElse: () {},
          );
        },
      ),
      BlocBinder<ValidationBloc, ValidationState, HistoryBloc, HistoryState>(
        direct: (context, s, bloc) {
          bloc.add(HistoryEvent.next(
            SummaryAnswer(
                qid: s.question.id,
                tries: s.tries,
                seconds: s.maybeMap(
                  correct: (x) => x.duration.inSeconds,
                  orElse: () => 0,
                )),
          ));
        },
      ),
      BlocBinder<QuestionsBloc, QuestionsState, FeedBloc, FeedState>(
          direct: (context, state, bloc) {
        if (state is Loaded) {
          if (state?.questions?.question != null) {
            bloc.add(FeedEvent.newArrived(state.questions));
          }
        }
      }),
      BlocBinder<ValidationBloc, ValidationState, FeedBloc, FeedState>(
        direct: (context, state, bloc) {
          state.maybeWhen(
            correct: (question, tries, duration) => bloc.add(
              FeedEvent.moveNext(
                duration.inSeconds > 90 ? MoveDir.left() : MoveDir.right(),
              ),
            ),
            orElse: () {},
          );
        },
      )
    ]);
  }

  Widget _blocs(Widget child) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TestBloc>(create: (_) => TestBloc()),
        BlocProvider<IdBloc>(create: (_) => IdBloc()),
        BlocProvider<ValidationBloc>(create: (_) => ValidationBloc()),
        BlocProvider<SummaryBloc>(create: (_) => SummaryBloc()),
        BlocProvider<HistoryBloc>(create: (_) => HistoryBloc()),
        BlocProvider<LifecycleBloc>(create: (_) => LifecycleBloc()),
        BlocProvider<QuestionsBloc>(
          create: (context) => QuestionsBloc(
            idBloc: context.bloc<IdBloc>(),
            summaryBloc: context.bloc<SummaryBloc>(),
            repo: context.repository<QuestionsRepo>(),
          ),
        ),
        BlocProvider<FeedBloc>(
          create: (context) => FeedBloc(
            questionsBloc: context.bloc<QuestionsBloc>(),
            validationBloc: context.bloc<ValidationBloc>(),
          ),
        ),
      ],
      child: child,
    );
  }
}

class _LifeCycle extends StatelessWidget {
  final Widget child;
  const _LifeCycle(this.child);
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addObserver(
      new LifecycleEventHandler(
          resumeCallBack: () async =>
              context.bloc<LifecycleBloc>().add(LifecycleEvent.resume())),
    );
    context.bloc<LifecycleBloc>().add(LifecycleEvent.resume());
    return child;
  }
}
