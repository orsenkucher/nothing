import 'package:meta/meta.dart';

@immutable
abstract class PlayEvent {}

class StartLoading extends PlayEvent {}
