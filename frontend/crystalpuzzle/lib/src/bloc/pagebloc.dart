import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

@immutable
abstract class PageEvent {}

class PageChanged extends PageEvent {
  final int index;

  PageChanged({@required this.index});
}

@immutable
abstract class PageState {}

class PageStateIndex extends PageState {
  final int index;

  PageStateIndex({@required this.index});
}

class PageBloc extends Bloc<PageEvent, PageState> {
  @override
  PageState get initialState => PageStateIndex(index: 1);

  @override
  Stream<PageState> mapEventToState(
    PageEvent event,
  ) async* {
    if (event is PageChanged) {
      yield PageStateIndex(index: event.index);
    }
  }
}
