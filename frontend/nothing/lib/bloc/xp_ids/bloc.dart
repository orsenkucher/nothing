import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:json_annotation/json_annotation.dart';

part 'bloc.freezed.dart';
part 'bloc.g.dart';

@freezed
class XPIDs with _$XPIDs {
  const factory XPIDs(List<int> ids) = _XPIDs;
  factory XPIDs.fromJson(Map<String, dynamic> json) => _$XPIDsFromJson(json);
}

class XPIDsBloc extends HydratedCubit<XPIDs> {
  XPIDsBloc() : super(XPIDs([]));

  void add(int id) {
    print('XPIDs: adding $id');
    emit(state.copyWith(ids: [...state.ids, id]));
  }

  @override
  XPIDs fromJson(Map<String, dynamic> json) => XPIDs.fromJson(json);

  @override
  Map<String, dynamic> toJson(XPIDs state) => state.toJson();
}
