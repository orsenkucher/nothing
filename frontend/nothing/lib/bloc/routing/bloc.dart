import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'bloc.freezed.dart';

@freezed
abstract class RoutingEvent with _$RoutingEvent {
  const factory RoutingEvent.change({@required String screen}) = _Change;
  const factory RoutingEvent.resume() = _Resume;
}

@freezed
abstract class RoutingState with _$RoutingState {
  const factory RoutingState._({
    @required String screen,
    @required String salt,
  }) = _RoutingState;

  factory RoutingState.salted({@required String screen}) =>
      RoutingState._(screen: screen, salt: Uuid().v4());
}

class RoutingBloc extends Bloc<RoutingEvent, RoutingState> {
  @override
  RoutingState get initialState => RoutingState.salted(screen: 'home');

  @override
  Stream<RoutingState> mapEventToState(RoutingEvent event) async* {
    yield RoutingState.salted(
        screen: event.when(
      change: (s) => s,
      resume: () => state.screen,
    ));
  }
}
