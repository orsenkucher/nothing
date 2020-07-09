import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:json_annotation/json_annotation.dart';

part 'bloc.freezed.dart';
part 'bloc.g.dart';

@freezed
abstract class CoinEvent with _$CoinEvent {
  const factory CoinEvent.inc(int count) = _Increase;
  const factory CoinEvent.dec(int count) = _Decrease;
}

@freezed
abstract class CoinState with _$CoinState {
  const factory CoinState(int total) = _CoinState;
  factory CoinState.fromJson(Map<String, dynamic> json) => _$CoinStateFromJson(json);
}

class CoinBloc extends HydratedBloc<CoinEvent, CoinState> {
  CoinBloc() : super(CoinState(10)) {
    add(CoinEvent.inc(10));
  }

  @override
  Stream<CoinState> mapEventToState(CoinEvent event) async* {
    yield event.when(
      inc: (count) => state.copyWith(total: state.total + count),
      dec: (count) => state.copyWith(total: state.total - count),
    );
  }

  @override
  CoinState fromJson(Map<String, dynamic> json) => CoinState.fromJson(json);

  @override
  Map<String, dynamic> toJson(CoinState state) => state.toJson();
}
