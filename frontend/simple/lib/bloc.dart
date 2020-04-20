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

class ComputeBloc extends IgnitedBloc<ComputeEvent, ComputeState> {
  DataBloc db;
  ComputeBloc(this.db);

  @override
  void ignition(ComputeState payload) => payload.when(
        available: (data) => add(ComputeEvent.onNew(data)),
        empty: () => db.add(DataEvent.newDataPlease()),
      );

  @override
  ComputeState get initialPayload => ComputeState.empty();

  @override
  Stream<ComputeState> mapEventToPayload(ComputeEvent event) async* {
    yield ComputeState.available(event.data);
  }

  @override
  ComputeState payloadFromJson(json) => ComputeState.fromJson(json);

  @override
  payloadToJson(ComputeState payload) => payload.toJson();
}

@freezed
abstract class Ignitable<S> with _$Ignitable<S> {
  factory Ignitable.ignited(S payload) = Ignited<S>;
  factory Ignitable.pending(S payload) = Pending<S>;
}

abstract class IgnitedBloc<Event, State>
    extends HydratedBloc<Event, Ignitable<State>> {
  IgnitedBloc() {
    ignition(state.payload);
  }

  State get initialPayload;
  void ignition(State paylaod);

  dynamic payloadToJson(State payload);
  State payloadFromJson(dynamic json);
  Stream<State> mapEventToPayload(Event event);

  @override
  @nonVirtual
  Ignitable<State> get initialState =>
      Ignitable.pending(super.initialState?.payload ?? initialPayload);

  @override
  @nonVirtual
  Stream<Ignitable<State>> mapEventToState(Event event) =>
      mapEventToPayload(event).map((pl) => Ignitable.ignited(pl));

  @override
  @nonVirtual
  Map<String, dynamic> toJson(Ignitable<State> state) {
    return {
      'payload': payloadToJson(state.payload),
      'runtimeType': state.when(
        ignited: (_) => 'ignited',
        pending: (_) => 'pending',
      ),
    };
  }

  @override
  @nonVirtual
  Ignitable<State> fromJson(Map<String, dynamic> json) {
    final pl = payloadFromJson(json['payload']);
    switch (json['runtimeType'] as String) {
      case 'ignited':
        return Ignitable.ignited(pl);
      case 'pending':
        return Ignitable.pending(pl);
      default:
        throw FallThroughError();
    }
  }
}
