import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

@immutable
abstract class PageEvent {
  const PageEvent();
}

enum Invoker {
  system,
  slidebar,
  pageview,
}

class PageChanged extends PageEvent {
  final int index;
  final Invoker invoker;

  const PageChanged({
    @required this.index,
    @required this.invoker,
  });
}

@immutable
abstract class PageState {
  const PageState();
}

class PageStateIndex extends PageState {
  final int index;
  final Invoker invoker;

  const PageStateIndex({
    @required this.index,
    @required this.invoker,
  });
}

class PageBloc extends Bloc<PageEvent, PageState> {
  @override
  PageStateIndex get initialState =>
      PageStateIndex(index: 1, invoker: Invoker.system);

  @override
  Stream<PageState> mapEventToState(
    PageEvent event,
  ) async* {
    if (event is PageChanged) {
      yield PageStateIndex(index: event.index, invoker: event.invoker);
    }
  }
}
