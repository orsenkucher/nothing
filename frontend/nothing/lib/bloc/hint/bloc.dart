import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:json_annotation/json_annotation.dart';

part 'bloc.freezed.dart';
part 'bloc.g.dart';

@freezed
abstract class HintState with _$HintState {
  const factory HintState(bool unlocked, Map<int, bool> memory) = _HintState;
  factory HintState.fromJson(Map<String, dynamic> json) => _$HintStateFromJson(json);
}

class HintBloc extends HydratedCubit<HintState> {
  HintBloc() : super(HintState(false, <int, bool>{}));
  int current;

  void lock(int id) {
    current = id;
    final unlocked = {...state.memory};
    if (unlocked[id] == null) {
      unlocked[id] = false;
    }
    if (unlocked[id]) {
      emit(state.copyWith(unlocked: true, memory: unlocked));
    } else {
      print("Locking hint for $id");
      emit(state.copyWith(unlocked: false, memory: unlocked));
    }
  }

  void unlock() {
    print("Unlocking hint for $current");
    final unlocked = {...state.memory};
    unlocked[current] = true;
    emit(state.copyWith(unlocked: true, memory: unlocked));
  }

  void unlockAnswered(int id) {
    print("Unlocking answered $id");
    final unlocked = {...state.memory};
    unlocked[id] = true;
    emit(state.copyWith(memory: unlocked));
  }

  @override
  HintState fromJson(Map<String, dynamic> json) => HintState.fromJson(json);

  @override
  Map<String, dynamic> toJson(HintState state) => state.toJson();
}
