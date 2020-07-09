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
    @required Routes from,
    @required Routes to,
  }) = _Push;
  const factory RoutingEvent.resume() = _Resume;
  const factory RoutingEvent.pop({@required Routes from}) = _Pop;
}

@freezed
abstract class RoutingState with _$RoutingState {
  const factory RoutingState._({
    @required RoutingEvent event,
    @required List<Routes> log,
    @required String salt,
  }) = _RoutingState;

  factory RoutingState({
    @required RoutingEvent event,
    @required List<Routes> log,
  }) {
    return RoutingState._(
      event: event,
      log: log,
      salt: Uuid().v4(),
    );
  }
}

extension RoutingState$ on RoutingState {
  Routes get route => this.log.last;
  String get name => this.route.name;
}

class RoutingBloc extends Bloc<RoutingEvent, RoutingState> {
  RoutingBloc()
      : super(RoutingState(
          log: [Routes.home()],
          event: RoutingEvent.resume(),
        ));

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
