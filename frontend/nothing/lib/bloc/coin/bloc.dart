import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:json_annotation/json_annotation.dart';

part 'bloc.freezed.dart';
part 'bloc.g.dart';

@freezed
abstract class CoinState with _$CoinState {
  const factory CoinState(int total) = _CoinState;
  factory CoinState.fromJson(Map<String, dynamic> json) => _$CoinStateFromJson(json);
}

class CoinBloc extends HydratedCubit<CoinState> {
  CoinBloc() : super(CoinState(10)) {
    inc(10);
  }

  void inc(int count) => emit(state.copyWith(total: state.total + count));
  void dec(int count) => emit(state.copyWith(total: state.total - count));

  @override
  CoinState fromJson(Map<String, dynamic> json) => CoinState.fromJson(json);

  @override
  Map<String, dynamic> toJson(CoinState state) => state.toJson();
}
