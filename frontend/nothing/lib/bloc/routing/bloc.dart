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
  const factory RoutingState.push({
    @required List<String> log,
  }) = _PushState;
  const factory RoutingState.pop({
    @required List<String> log,
  }) = _PopState;
  const factory RoutingState.resume({
    @required List<String> log,
    @required String salt,
  }) = _ResumeState;
  factory RoutingState.resumeS({@required List<String> log}) =>
      RoutingState.resume(log: log, salt: Uuid().v4());
}

extension $_RoutingState on RoutingState {
  String get route => this.log.last;
}

class RoutingBloc extends Bloc<RoutingEvent, RoutingState> {
  @override
  RoutingState get initialState => RoutingState.push(log: [Routes.home]);

  @override
  Stream<RoutingState> mapEventToState(RoutingEvent event) async* {
    yield event.when(
      push: (from, to) => RoutingState.push(log: [...state.log, to]),
      pop: (from) => RoutingState.pop(log: [...state.log]..removeLast()),
      resume: () => RoutingState.resumeS(log: state.log),
    );
  }
}
