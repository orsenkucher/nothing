import 'dart:collection';

import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:nothing/bloc/xp/bloc.dart';

class XPQueueBloc extends HydratedCubit<Queue<XPState>> {
  XPQueueBloc() : super(Queue());

  void push(XPState item) {
    final next = Queue<XPState>.from(state);
    next.add(item);
    emit(next);
  }

  void pop() {
    final next = Queue<XPState>.from(state);
    next.removeFirst();
    emit(next);
  }

  @override
  Queue<XPState> fromJson(Map<String, dynamic> json) {
    return Queue<XPState>.from((json['queue'] as List).map((e) => XPState.fromJson(e)));
  }

  @override
  Map<String, dynamic> toJson(Queue<XPState> state) => {'queue': state.toList()};
}
