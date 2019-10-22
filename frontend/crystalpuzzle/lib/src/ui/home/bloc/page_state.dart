import 'package:meta/meta.dart';

@immutable
abstract class PageState {}

class PageStateIndex extends PageState {
  final int index;

  PageStateIndex({@required this.index});
}
