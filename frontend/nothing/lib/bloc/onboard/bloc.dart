import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:json_annotation/json_annotation.dart';

part 'bloc.freezed.dart';
part 'bloc.g.dart';

@freezed
abstract class OnboardState with _$OnboardState {
  const factory OnboardState(bool done) = _OnboardState;
  factory OnboardState.fromJson(Map<String, dynamic> json) => _$OnboardStateFromJson(json);
}

class OnboardBloc extends HydratedCubit<OnboardState> {
  OnboardBloc() : super(OnboardState(false)) {
    // reset();
  }

  void complete() => emit(state.copyWith(done: true));
  void reset() => emit(state.copyWith(done: false));

  @override
  OnboardState fromJson(Map<String, dynamic> json) => OnboardState.fromJson(json);

  @override
  Map<String, dynamic> toJson(OnboardState state) => state.toJson();
}
