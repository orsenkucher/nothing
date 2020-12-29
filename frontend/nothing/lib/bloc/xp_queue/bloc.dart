import 'dart:collection';

import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:nothing/bloc/xp/bloc.dart';

class XPQueueBloc extends HydratedCubit<Queue<XPState>> {
  XPQueueBloc() : super(Queue());

  void push(XPState item) {
    final next = Queue.from(state);
    next.add(item);
    emit(next);
  }

  void pop() {
    final next = Queue.from(state);
    next.removeFirst();
    emit(next);
  }

  @override
  Queue<XPState> fromJson(Map<String, dynamic> json) => Queue.from(json['queue']);

  @override
  Map<String, dynamic> toJson(Queue<XPState> state) => {'queue': state.toList()};
}
