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

// @freezed
// abstract class Ignitable<S> with _$Ignitable<S> {
//   factory Ignitable.ignited(S state) = Ignited<S>;
//   factory Ignitable.pending() = Pending<S>;
//   factory Ignitable.fromJson(Map<String, dynamic> json) =>
//       _$IgnitableFromJson<S>(json);
// }

@freezed
abstract class Ignitable with _$Ignitable {
  factory Ignitable.ignited(ComputeState payload) = Ignited;
  factory Ignitable.pending(ComputeState payload) = Pending;
  factory Ignitable.fromJson(Map<String, dynamic> json) =>
      _$IgnitableFromJson(json);
}

// mixin Ignitor<S extends Ignitable> on HydratedBloc {
//   @override
//   // State get initialState => Object as State;
//   S get initialState => Ignitable.pending();
// }

class ComputeBloc extends HydratedBloc<ComputeEvent, Ignitable>
// with Ignitor<Ignitable>
{
  ComputeBloc(DataBloc db) {
    final initial = super.initialState ?? Ignitable.ignited(state.payload);
    initial.payload.when(
      available: (data) => add(ComputeEvent.onNew(data)),
      empty: () => db.add(DataEvent.newDataPlease()),
    );
  }

  @override
  Ignitable get initialState => Ignitable.pending(ComputeState.empty());

  @override
  Stream<Ignitable> mapEventToState(ComputeEvent event) async* {
    yield Ignitable.ignited(ComputeState.available(event.data));
  }

  @override
  Ignitable fromJson(Map<String, dynamic> json) {
    return Ignitable.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(Ignitable state) {
    return state.toJson();
  }
}
