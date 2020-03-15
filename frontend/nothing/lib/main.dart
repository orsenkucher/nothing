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
      lifecycle.add(LifecycleEvent.suspend());
    },
    resumeCallBack: () async {
      print('lifecycle: resuming');
      lifecycle.add(LifecycleEvent.resume());
    },
  );
  WidgetsBinding.instance.addObserver(observer);
}

class Navigatable extends StatelessWidget {
  final Widget child;
  final String route;
  const Navigatable({
    @required this.route,
    @required this.child,
  });
  @override
  Widget build(BuildContext context) {
    print("BUILDING NAVIGATABLE!Q");
    return MultiBlocListener(
      child: child,
      listeners: [
        BlocListener<RoutingBloc, RoutingState>(
          listener: (context, state) => state.event.when(
            push: (from, to) => {
              if (from == route) Navigator.pushNamed(context, to),
            },
            pop: (from) => {
              if (from == route) Navigator.pop(context),
            },
            resume: () => {},
          ),
        ),
      ],
    );
  }
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
          initialRoute: context.bloc<RoutingBloc>().initialState.route,
          routes: {
            Routes.home: (_) => Navigatable(
                  route: Routes.home,
                  child: Home(),
                ),
            Routes.history: (_) => Navigatable(
                  route: Routes.history,
                  child: HistoryList(),
                ),
          }, // TODO wrap in navigatable widget
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
            just: (_, e) => e.when(
                resume: () => bloc.add(RoutingEvent.resume()),
                suspend: () => {}),
            nothing: () => {}),
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
