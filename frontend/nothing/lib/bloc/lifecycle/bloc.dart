import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:json_annotation/json_annotation.dart';

part 'bloc.freezed.dart';
part 'bloc.g.dart';

@freezed
abstract class LifecycleEvent with _$LifecycleEvent {
  const factory LifecycleEvent.resume(DateTime point) = _Resume;
  const factory LifecycleEvent.suspend(DateTime point) = _Suspend;
  factory LifecycleEvent.resumeNow() => LifecycleEvent.resume(DateTime.now());
  factory LifecycleEvent.suspendNow() => LifecycleEvent.suspend(DateTime.now());
  factory LifecycleEvent.fromJson(Map<String, dynamic> json) => _$LifecycleEventFromJson(json);
}

@freezed
abstract class LifecycleState with _$LifecycleState {
  const factory LifecycleState.just({
    @required List<LifecycleEvent> log,
    @required LifecycleEvent current,
  }) = _Just;

  const factory LifecycleState.nothing() = _Nothing;

  factory LifecycleState.fromJson(Map<String, dynamic> json) => _$LifecycleStateFromJson(json);
}

class LifecycleBloc extends HydratedBloc<LifecycleEvent, LifecycleState> {
  LifecycleBloc() : super(LifecycleState.nothing());

  @override
  Stream<LifecycleState> mapEventToState(LifecycleEvent event) async* {
    final log = state.map(
      just: (s) => [...s.log, event],
      nothing: (_) => [event],
    );
    yield LifecycleState.just(log: log, current: event);
  }

  @override
  LifecycleState fromJson(Map<String, dynamic> json) {
    final history = LifecycleState.fromJson(json);
    return history;
  }

  @override
  Map<String, dynamic> toJson(LifecycleState state) {
    final json = state.toJson();
    return json;
  }
}
