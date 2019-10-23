import 'package:crystalpuzzle/src/bloc/bloc.dart';
import 'package:crystalpuzzle/src/ui/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PageBloc>(builder: (context) => PageBloc()),
        BlocProvider<PlayBloc>(builder: (context) => PlayBloc()),
      ],
      child: MaterialApp(
        title: 'Nothing',
        theme: ThemeData(),
        home: HomePage(title: 'Nothing Puzzle 2.0'),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
