import 'package:crystalpuzzle/src/theme/bloc/bloc.dart';
import 'package:crystalpuzzle/src/ui/home/bloc/bloc.dart';
import 'package:crystalpuzzle/src/ui/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeBloc>(builder: (context) => ThemeBloc()),
        BlocProvider<PageBloc>(builder: (context) => PageBloc()),
      ],
      child: BlocBuilder<ThemeBloc, ThemeModeState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Nothing',
            theme: state.themeData,
            home: HomePage(title: 'Nothing Puzzle 2.0'),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
