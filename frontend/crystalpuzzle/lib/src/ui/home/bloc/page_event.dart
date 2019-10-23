import 'package:meta/meta.dart';

@immutable
abstract class PageEvent {}

class PageChanged extends PageEvent {
  final int index;

  PageChanged({@required this.index});
}
