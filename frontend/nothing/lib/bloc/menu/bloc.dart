import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:json_annotation/json_annotation.dart';

part 'bloc.freezed.dart';
part 'bloc.g.dart';

@freezed
abstract class MenuState with _$MenuState {
  const factory MenuState(bool vibration) = _MenuState;
  factory MenuState.fromJson(Map<String, dynamic> json) => _$MenuStateFromJson(json);
}

class MenuBloc extends HydratedCubit<MenuState> {
  MenuBloc() : super(MenuState(true));

  void flip() {
    emit(state.copyWith(vibration: !state.vibration));
  }

  @override
  MenuState fromJson(Map<String, dynamic> json) => MenuState.fromJson(json);

  @override
  Map<String, dynamic> toJson(MenuState state) => state.toJson();
}
