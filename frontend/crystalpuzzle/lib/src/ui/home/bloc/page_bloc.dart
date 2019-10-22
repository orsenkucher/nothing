import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

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
