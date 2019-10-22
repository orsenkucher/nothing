import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:crystalpuzzle/src/theme/theme.dart';
import './bloc.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeModeState> {
  @override
  ThemeModeState get initialState => ThemeModeState(
        themeData: themeMode[ThemeMode.Light],
      );

  @override
  Stream<ThemeModeState> mapEventToState(
    ThemeEvent event,
  ) async* {
    if (event is ThemeModeChanged) {
      yield ThemeModeState(themeData: themeMode[event.mode]);
    }
  }
}
