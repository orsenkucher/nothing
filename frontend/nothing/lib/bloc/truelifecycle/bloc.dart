import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:json_annotation/json_annotation.dart';

part 'bloc.freezed.dart';
part 'bloc.g.dart';

@freezed
abstract class TrueLifecycleEvent with _$TrueLifecycleEvent {
  const factory TrueLifecycleEvent.resume() = _Resume;
  const factory TrueLifecycleEvent.suspend() = _Suspend;

  factory TrueLifecycleEvent.fromJson(Map<String, dynamic> json) =>
      _$TrueLifecycleEventFromJson(json);
}

@freezed
abstract class TrueLifecycleState with _$TrueLifecycleState {
  const factory TrueLifecycleState.just({
    @required List<TrueLifecycleEvent> log,
    @required TrueLifecycleEvent current,
  }) = _Just;

  const factory TrueLifecycleState.nothing() = _Nothing;

  factory TrueLifecycleState.fromJson(Map<String, dynamic> json) =>
      _$TrueLifecycleStateFromJson(json);
}

class TrueLifecycleBloc
    extends HydratedBloc<TrueLifecycleEvent, TrueLifecycleState> {
  @override
  TrueLifecycleState get initialState =>
      super.initialState ?? TrueLifecycleState.nothing();

  @override
  Stream<TrueLifecycleState> mapEventToState(TrueLifecycleEvent event) async* {
    final log = state.map(
      just: (s) => [...s.log, event],
      nothing: (_) => <TrueLifecycleEvent>[],
    );
    yield TrueLifecycleState.just(log: log, current: event);
  }

  @override
  TrueLifecycleState fromJson(Map<String, dynamic> json) {
    try {
      final history = TrueLifecycleState.fromJson(json);
      return history;
    } catch (_) {
      print('$this: fromJson error');
      return null;
    }
  }

  @override
  Map<String, dynamic> toJson(TrueLifecycleState state) {
    try {
      final json = state.toJson();
      return json;
    } catch (_) {
      print('$this: toJson error');
      return null;
    }
  }
}
