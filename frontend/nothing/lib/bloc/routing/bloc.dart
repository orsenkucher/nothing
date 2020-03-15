import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';
import 'routes.dart';

export 'routes.dart';

part 'bloc.freezed.dart';

@freezed
abstract class RoutingEvent with _$RoutingEvent {
  const factory RoutingEvent.push({
    @required String from,
    @required String to,
  }) = _Push;
  const factory RoutingEvent.resume() = _Resume;
  const factory RoutingEvent.pop({@required String from}) = _Pop;
}

@freezed
abstract class RoutingState with _$RoutingState {
  const factory RoutingState._({
    @required RoutingEvent event,
    @required List<String> log,
    @required String salt,
  }) = _RoutingState;
  factory RoutingState({
    @required RoutingEvent event,
    @required List<String> log,
  }) {
    return RoutingState._(
      event: event,
      log: log,
      salt: Uuid().v4(),
    );
  }
}

extension $_RoutingState on RoutingState {
  String get route => this.log.last;
}

class RoutingBloc extends Bloc<RoutingEvent, RoutingState> {
  @override
  RoutingState get initialState => RoutingState(
        log: [Routes.home().name], // TODO consider List<Routes>
        event: RoutingEvent.resume(),
      );

  @override
  Stream<RoutingState> mapEventToState(RoutingEvent event) async* {
    yield event.when(
      push: (from, to) => RoutingState(
        log: [...state.log, to],
        event: event,
      ),
      pop: (from) => RoutingState(
        log: [...state.log]..removeLast(),
        event: event,
      ),
      resume: () => RoutingState(
        log: state.log,
        event: event,
      ),
    );
  }
}
