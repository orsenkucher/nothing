import 'dart:io';

import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nothing/binding/binder.dart';
import 'package:nothing/bloc/feed/bloc.dart';
import 'package:nothing/bloc/id/bloc.dart';
import 'package:nothing/bloc/routing/bloc.dart';
import 'package:nothing/bloc/questions/bloc.dart';
import 'package:nothing/bloc/routing/routing.dart';
import 'package:nothing/bloc/summary/bloc.dart';
import 'package:nothing/bloc/test.dart';
import 'package:nothing/bloc/lifecycle/bloc.dart';
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
  //ignore: close_sinks
  final lifecycle = LifecycleBloc();
  _lifecycle(lifecycle);
  runApp(App(lifecycle));
}

Future _hydrateAsync() async {
  WidgetsFlutterBinding.ensureInitialized();
  BlocSupervisor.delegate = await NothingBlocDelegate.build();
}

void _lifecycle(LifecycleBloc lifecycle) {
  final observer = LifecycleEventHandler(
    suspendingCallBack: () async {
      print('lifecycle: suspending');
      lifecycle.add(LifecycleEvent.suspendNow());
    },
    resumeCallBack: () async {
      print('lifecycle: resuming');
      lifecycle.add(LifecycleEvent.resumeNow());
    },
  );
  WidgetsBinding.instance.addObserver(observer);
}

class App extends StatelessWidget with PortraitLock {
  final LifecycleBloc lifecycleBloc;
  const App(this.lifecycleBloc);

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return _repos(_blocs(_bindings(Builder(
      builder: (context) => NothingScheme(
        child: MaterialApp(
          title: 'NOTHING 2',
          theme: ThemeData(
            fontFamily: 'Gilroy',
          ),
          initialRoute: context.bloc<RoutingBloc>().initialState.name,
          routes: {
            Routes.home(): (_) => Home(),
            Routes.history(): (_) => HistoryList(),
          }.routed,
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
            just: (just) => just.maybeWhen(
                correct: (question, tries, duration) {
                  bloc.add(SummaryEvent.answer(
                    qid: question.id,
                    tries: tries.length,
                    seconds: duration.inSeconds,
                  ));
                },
                orElse: () {}),
            orElse: () {},
          );
        },
      ),
      BlocBinder<ValidationBloc, ValidationState, HistoryBloc, HistoryState>(
        direct: (context, s, bloc) {
          s.when(
            just: (just) => bloc.add(HistoryEvent.next(
              SummaryAnswer(
                  qid: just.question.id,
                  tries: just.tries.length,
                  seconds: just.maybeMap(
                    correct: (x) => x.duration.inSeconds,
                    orElse: () => 0,
                  )),
            )),
            nothing: () {},
          );
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
            just: (just) => just.maybeWhen(
              correct: (question, tries, duration) => bloc.add(
                FeedEvent.moveNext(
                  duration.inSeconds > 60 ? MoveDir.left() : MoveDir.right(),
                ),
              ),
              orElse: () {},
            ),
            orElse: () {},
          );
        },
      ),
      BlocBinder<LifecycleBloc, LifecycleState, RoutingBloc, RoutingState>(
        direct: (context, state, bloc) => state.when(
            just: (_, e) => e.map(
                resume: (_) => bloc.add(RoutingEvent.resume()),
                suspend: (_) => {}),
            nothing: () => {}),
      ),
      BlocBinder<LifecycleBloc, LifecycleState, ValidationBloc,
          ValidationState>(
        direct: (context, state, bloc) => state.when(
          just: (_, e) => bloc.add(ValidationEvent.lifecycle(
            e.when(
              resume: $TimePoint.resume,
              suspend: $TimePoint.suspend,
            ),
          )),
          nothing: () => {},
        ),
      ),
    ]);
  }

  Widget _blocs(Widget child) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LifecycleBloc>(create: (_) => lifecycleBloc),
        BlocProvider<ValidationBloc>(create: (_) => ValidationBloc()),
        BlocProvider<SummaryBloc>(create: (_) => SummaryBloc()),
        BlocProvider<HistoryBloc>(create: (_) => HistoryBloc()),
        BlocProvider<RoutingBloc>(create: (_) => RoutingBloc()),
        BlocProvider<TestBloc>(create: (_) => TestBloc()),
        BlocProvider<IdBloc>(create: (_) => IdBloc()),
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
