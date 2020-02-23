import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'test.freezed.dart';
part 'test.g.dart';

@freezed
abstract class TestEvent with _$TestEvent {
  const factory TestEvent.name(String name) = _Name;
}

@freezed
abstract class TestState with _$TestState {
  const factory TestState.data(List<String> names) = _Data;
  factory TestState.fromJson(Map<String, dynamic> json) =>
      _$TestStateFromJson(json);
}

class TestBloc extends HydratedBloc<TestEvent, TestState> {
  @override
  TestState get initialState =>
      super.initialState ?? TestState.data(['markiro']);

  @override
  Stream<TestState> mapEventToState(TestEvent event) async* {
    // yield state.copyWith()..names.add(event.name); // no
    yield TestState.data([...state.names, event.name]);
    // yield state.copyWith(names: [event.name]);
    // state.names.add(event.name);
    // yield state;
  }

  @override
  TestState fromJson(Map<String, dynamic> json) {
    try {
      final state = TestState.fromJson(json);
      return state;
    } on dynamic catch (_) {
      print(_);
      return null;
    }
  }

  @override
  Map<String, dynamic> toJson(TestState state) {
    try {
      final json = state.toJson();
      return json;
    } on dynamic catch (_) {
      print(_);
      return null;
    }
  }
}
