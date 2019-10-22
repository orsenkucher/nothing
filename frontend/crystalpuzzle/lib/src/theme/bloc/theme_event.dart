import 'package:crystalpuzzle/src/theme/theme.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ThemeEvent {}

class ThemeModeChanged extends ThemeEvent {
  final ThemeMode mode;

  ThemeModeChanged({
    @required this.mode,
  });
}
