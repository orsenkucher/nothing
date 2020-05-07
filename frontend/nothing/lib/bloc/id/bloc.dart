import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

part 'bloc.freezed.dart';
part 'bloc.g.dart';

@freezed
abstract class IdEvent with _$IdEvent {
  const factory IdEvent.revoke() = _RevokeID;
}

@freezed
abstract class IdState with _$IdState {
  const factory IdState(String id) = _IdState;
  factory IdState.unique() => IdState(Uuid().v4());
  factory IdState.fromJson(Map<String, dynamic> json) =>
      _$IdStateFromJson(json);
}

class IdBloc extends HydratedBloc<IdEvent, IdState> {
  IdBloc() {
    //  clear();
  }

  IdState revoke() => IdState.unique();

  @override
  IdState get initialState => super.initialState ?? revoke();

  @override
  Stream<IdState> mapEventToState(IdEvent event) async* {
    yield revoke();
  }

  @override
  IdState fromJson(Map<String, dynamic> json) => IdState.fromJson(json);
  @override
  Map<String, dynamic> toJson(IdState state) => state.toJson();
}
