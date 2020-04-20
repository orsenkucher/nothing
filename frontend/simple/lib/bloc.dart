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

@freezed
abstract class Ignitable<S> with _$Ignitable<S> {
  factory Ignitable.ignited(S payload) = Ignited<S>;
  factory Ignitable.pending(S payload) = Pending<S>;
  // factory Ignitable.fromJsouny(Map<String, dynamic> json) => null;
}

// @freezed
// abstract class Ignitable with _$Ignitable {
//   factory Ignitable.ignited(ComputeState payload) = Ignited;
//   factory Ignitable.pending(ComputeState payload) = Pending;
//   factory Ignitable.fromJson(Map<String, dynamic> json) =>
//       _$IgnitableFromJson(json);
// }

// mixin Ignitor<S extends Ignitable> on HydratedBloc {
//   @override
//   // State get initialState => Object as State;
//   S get initialState => Ignitable.pending();
// }

class ComputeBloc extends IgnitedBloc<ComputeEvent, ComputeState>
// with Ignitor<Ignitable>
{
  ComputeBloc(DataBloc db) {
    // final initial = super.initialState ?? Ignitable.ignited(state.payload);
    final initial = superInitial ?? Ignitable.ignited(state.payload);
    initial.payload.when(
      available: (data) => add(ComputeEvent.onNew(data)),
      empty: () => db.add(DataEvent.newDataPlease()),
    );
  }

  @override
  ComputeState get initialPayload => ComputeState.empty();

  @override
  Stream<Ignitable<ComputeState>> mapEventToState(ComputeEvent event) async* {
    yield Ignitable.ignited(ComputeState.available(event.data));
  }

  // @override
  // ComputeEvent Function(ComputeState) get initialEvent =>
  //     (payload) => payload.when(
  //           available: (data) => ComputeEvent.onNew(data),
  //           empty: () => DataEvent.newDataPlease(),
  //         );

  @override
  ComputeState payloadFromJson(json) => ComputeState.fromJson(json);

  @override
  payloadToJson(ComputeState payload) => payload.toJson();

  // @override
  // ComputeState fromJson(Map<String, dynamic> json) {
  //   // return Ignitable.fromJson(json);
  //   // switch (json['runtimeType'] as String) {
  //   //   case 'available':
  //   //     return Available.fromJson(json);
  //   //   case 'empty':
  //   //     return Empty.fromJson(json);

  //   //   default:
  //   //     throw FallThroughError();
  //   // }
  //   return null;
  // }

  // @override
  // Map<String, dynamic> toJson(Ignitable state) {
  //   // // return state.payload.toJson();
  //   // _$_$AvailableToJson(this)..['runtimeType'] = 'available';
  //   return null;
  // }
}

abstract class IgnitedBloc<Event, State>
    extends HydratedBloc<Event, Ignitable<State>> {
  IgnitedBloc() {
    // final initial = super.initialState ?? Ignitable.ignited(state.payload);
    // add(initialEvent(initial.payload));
  }
  State get initialPayload;
  // Event Function(State) get initialEvent;
  @nonVirtual
  Ignitable<State> get superInitial => super.initialState;

  dynamic payloadToJson(State payload);
  State payloadFromJson(dynamic json);

  @override
  @nonVirtual
  Ignitable<State> get initialState => Ignitable.pending(initialPayload);

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
