import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:simple/data.dart';

part 'bloc.freezed.dart';
part 'bloc.g.dart';

@freezed
abstract class ComputeEvent with _$ComputeEvent {
  factory ComputeEvent.onNew(Data data) = OnNew;
}

@freezed
abstract class ComputeState with _$ComputeState {
  factory ComputeState.available(Data data) = Available;
  factory ComputeState.empty() = Empty;
  factory ComputeState.fromJson(Map<String, dynamic> json) =>
      _$ComputeStateFromJson(json);
}

class ComputeBloc extends HydratedBloc<ComputeEvent, ComputeState> {
  ComputeBloc(DataBloc db) {
    state.when(
      available: (data) => add(ComputeEvent.onNew(data)),
      empty: () => db.add(DataEvent.newDataPlease()),
    );
  }

  @override
  ComputeState get initialState => super.initialState ?? ComputeState.empty();

  @override
  Stream<ComputeState> mapEventToState(ComputeEvent event) async* {
    yield ComputeState.available(event.data);
  }

  @override
  ComputeState fromJson(Map<String, dynamic> json) {
    return ComputeState.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(ComputeState state) {
    return state.toJson();
  }
}
