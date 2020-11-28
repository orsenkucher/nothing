import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:json_annotation/json_annotation.dart';

part 'bloc.freezed.dart';
part 'bloc.g.dart';

@freezed
abstract class HintState with _$HintState {
  const factory HintState(bool unlocked) = _HintState;
  factory HintState.fromJson(Map<String, dynamic> json) => _$HintStateFromJson(json);
}

class HintBloc extends HydratedCubit<HintState> {
  HintBloc() : super(HintState(false));

  void lock() => emit(state.copyWith(unlocked: false));
  void unlock() => emit(state.copyWith(unlocked: true));

  @override
  HintState fromJson(Map<String, dynamic> json) => HintState.fromJson(json);

  @override
  Map<String, dynamic> toJson(HintState state) => state.toJson();
}
