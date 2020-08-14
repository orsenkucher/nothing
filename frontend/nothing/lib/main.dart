import 'dart:io';

import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:nothing/binding/binder.dart';
import 'package:nothing/bloc/ad/bloc.dart';
import 'package:nothing/bloc/coin/bloc.dart';
import 'package:nothing/bloc/feed/bloc.dart';
import 'package:nothing/bloc/id/bloc.dart';
import 'package:nothing/bloc/routing/bloc.dart';
import 'package:nothing/bloc/questions/bloc.dart';
import 'package:nothing/bloc/routing/routing.dart';
import 'package:nothing/bloc/summary/bloc.dart';
import 'package:nothing/bloc/lifecycle/bloc.dart';
import 'package:nothing/bloc/validation/bloc.dart';
import 'package:nothing/bloc/history/bloc.dart';
import 'package:nothing/color/scheme.dart';
import 'package:nothing/domain/domain.dart';
import 'package:nothing/repository/ads.dart';
import 'package:nothing/repository/likes.dart';
import 'package:nothing/repository/questions.dart';
import 'package:nothing/tools/lifecycle.dart';
import 'package:nothing/tools/orientation.dart';
import 'package:nothing/ui/home.dart';

void main() async {
  await _hydrateAsync();
  await _admob();
  if (Platform.isIOS) SystemChrome.setEnabledSystemUIOverlays([]);
  //ignore: close_sinks
  final lifecycle = LifecycleBloc();
  _lifecycle(lifecycle);
  runApp(App(lifecycle));
}

Future _hydrateAsync() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build();
  // await HydratedBloc.storage.clear();
}

Future<bool> _admob() {
  final appId = Platform.isIOS
      ? 'ca-app-pub-3169956978186495~8308569350' //ios
      : 'ca-app-pub-3169956978186495~3700924713'; //android
  return FirebaseAdMob.instance.initialize(appId: appId);
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
          // used initialState here before, haha
          initialRoute: context.bloc<RoutingBloc>().state.name,
          routes: {
            Routes.home(): (_) => Home(),
          }.routed,
          color: NothingScheme.app,
          debugShowCheckedModeBanner: false,
        ),
      ),
    ))));
  }

  Widget _bindings(Widget child) {
    return MultiBlocBinder(child: child, binders: [
      BlocBinder<ValidationBloc, ValidationState, SummaryBloc, SummaryState>(
        direct: (context, state, bloc) {
          state.maybeWhen(
            just: (just) {
              return just.maybeWhen(
                correct: (question, tries, duration) {
                  bloc.add(SummaryEvent.answer(
                    answers: tries,
                    qid: question.id,
                    tries: tries.length,
                    seconds: duration.inSeconds,
                  ));
                },
                skip: (question, tries, duration) {
                  bloc.add(SummaryEvent.answer(
                    answers: tries,
                    qid: question.id,
                    tries: -1,
                    seconds: duration.inSeconds,
                  ));
                },
                orElse: () => void$(),
              );
            },
            orElse: () => void$(),
          );
        },
      ),
      BlocBinder<ValidationBloc, ValidationState, HistoryBloc, HistoryState>(
        direct: (context, state, bloc) {
          state.when(
            just: (just) => bloc.add(HistoryEvent.next(HistoryItem(
              question: just.question,
              answer: SummaryAnswer(
                  qid: just.question.id,
                  tries: just.answers.length,
                  answers: just.answers,
                  seconds: just.maybeMap(
                    correct: (x) => x.duration.inSeconds,
                    orElse: () => 0,
                  )),
            ))),
            nothing: () => void$(),
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
        },
        reverse: (context, state, bloc) => state.when(
          available: (_) => void$(),
          pending: (_, __) => void$(),
          empty: (_) => bloc.add(QuestionsEvent.fetch()),
        ),
      ),
      BlocBinder<ValidationBloc, ValidationState, FeedBloc, FeedState>(
        direct: (context, state, bloc) {
          state.maybeWhen(
            just: (just) => just.maybeWhen(
              correct: (question, tries, duration) => bloc.add(
                FeedEvent.moveNext(
                  duration.inSeconds > 80 ? MoveDir.left() : MoveDir.right(),
                ),
              ),
              skip: (question, tries, duration) {
                bloc.add(FeedEvent.moveNext(MoveDir.left()));
                bloc.add(FeedEvent.ground());
              },
              orElse: () => void$(),
            ),
            orElse: () => void$(),
          );
        },
        reverse: (context, state, bloc) {
          state.when(
            available: (tree) => bloc.add(ValidationEvent.focus(tree.question)),
            pending: (_, __) => void$(),
            empty: (_) => void$(),
          );
        },
      ),
      BlocBinder<LifecycleBloc, LifecycleState, RoutingBloc, RoutingState>(
        direct: (context, state, bloc) => state.when(
            just: (_, e) => e.map(resume: (_) => bloc.add(RoutingEvent.resume()), suspend: (_) => {}),
            nothing: () => {}),
      ),
      BlocBinder<LifecycleBloc, LifecycleState, ValidationBloc, ValidationState>(
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
        BlocProvider<IdBloc>(create: (_) => IdBloc()),
        BlocProvider<CoinBloc>(create: (_) => CoinBloc()),
        BlocProvider<QuestionsBloc>(
          create: (context) => QuestionsBloc(
            idBloc: context.bloc<IdBloc>(),
            historyBloc: context.bloc<HistoryBloc>(),
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
        BlocProvider<AdBloc>(
          create: (context) => AdBloc(
            context.repository<AdRepo>(),
            context.bloc<IdBloc>(),
          ),
        ),
      ],
      child: child,
    );
  }

  Widget _repos(Widget child) {
    return MultiRepositoryProvider(child: child, providers: [
      RepositoryProvider<QuestionsRepo>(
        child: child,
        create: (context) => CloudQuestionsRepo(),
      ), // CloudQuestionsRepo|LocalQuestionsRepo
      RepositoryProvider<AdRepo>(
        child: child,
        create: (context) => AdRepo(),
      ),
      RepositoryProvider<LikesRepo>(
        child: child,
        create: (context) => LikesRepo(),
      ),
    ]);
  }
}
