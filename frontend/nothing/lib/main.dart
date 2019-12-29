import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nothing/bloc/questions/bloc.dart';
import 'package:nothing/bloc/summary/bloc.dart';
import 'package:nothing/data/questions_repo.dart';
import 'package:nothing/ui/hub.dart';

import 'bloc/question/bloc.dart';

void main() => runApp(App());

// [+] Make 2 blocs
// [+] How to persist some state in bloc
// [+] Repo ln: 16 exception
// [+] Connect to firebase ios / android
// [.] Divide widgets into smaller & define widget-wide params
// [.] Fix symbol rendering
// [+] Arrow button tap, clear TextField
// [.] Rework all bloc states and events with sumtypes

// [.] Поменять ответы местами
// [.] Адмоб для андройд/айос
// [*] Цвета
// [.] Сместить карточки ниже
// [.] Бесшовность
// [.] Как делать кастомную тему - use custom clolor scheme extended from Inherited widget or use ext methods
// [.] Пересчитывать слайдер через ответ человека
// [+] Подвязать слайдер к данным
// [+] Хранить айди пользователя в приложении
// [+] Шрифт
// [.] Порталы
// [.] Название

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
        BlocProvider<SummaryBloc>(
          builder: (context) => SummaryBloc(),
        ),
        BlocProvider<QuestionsBloc>(
          builder: (context) {
            return QuestionsBloc(
              qusRepo: LocalQuestionsRepo(), // CloudQuestionsRepo
              summaryBloc: BlocProvider.of<SummaryBloc>(context),
            );
          },
        ),
        BlocProvider<QuestionBloc>(
          builder: (context) => QuestionBloc(
            questionsBloc: BlocProvider.of<QuestionsBloc>(context),
          ),
        )
      ],
      child: MaterialApp(
        title: 'Nothing',
        theme: ThemeData(fontFamily: 'Gilroy'),
        home: Hub(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
