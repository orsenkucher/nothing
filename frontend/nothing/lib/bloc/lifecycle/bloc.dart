import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'bloc.freezed.dart';

@freezed
abstract class LifecycleEvent with _$LifecycleEvent {
  const factory LifecycleEvent.change({@required String screen}) = _Change;
  const factory LifecycleEvent.resume() = _Resume;
}

@freezed
abstract class LifecycleState with _$LifecycleState {
  const factory LifecycleState._({
    @required String screen,
    @required String salt,
  }) = _LifecycleState;

  factory LifecycleState.salted({@required String screen}) => LifecycleState._(
        screen: screen,
        salt: Uuid().v4(),
      );
}

class LifecycleBloc extends Bloc<LifecycleEvent, LifecycleState> {
  @override
  LifecycleState get initialState => LifecycleState.salted(screen: 'home');

  @override
  Stream<LifecycleState> mapEventToState(LifecycleEvent event) async* {
    yield LifecycleState.salted(
        screen: event.when(
      change: (s) => s,
      resume: () => state.screen,
    ));
  }
}
