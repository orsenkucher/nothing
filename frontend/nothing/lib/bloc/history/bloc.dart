import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:nothing/bloc/summary/bloc.dart';
import 'package:nothing/domain/domain.dart';

part 'bloc.freezed.dart';
part 'bloc.g.dart';

@freezed
abstract class HistoryItem with _$HistoryItem {
  const factory HistoryItem({
    @required SummaryAnswer answer,
    @required Question question,
  }) = _HistoryItem;
  factory HistoryItem.fromJson(Map<String, dynamic> json) => _$HistoryItemFromJson(json);
}

@freezed
abstract class HistoryEvent with _$HistoryEvent {
  const factory HistoryEvent.next(HistoryItem item) = _Next;
}

@freezed
abstract class HistoryState with _$HistoryState {
  const factory HistoryState({
    @required Map<int, bool> ids, // HashSet with ids
    @required List<HistoryItem> items,
  }) = _State;

  factory HistoryState.fromJson(Map<String, dynamic> json) => _$HistoryStateFromJson(json);
}

class HistoryBloc extends HydratedBloc<HistoryEvent, HistoryState> {
  HistoryBloc() : super(HistoryState(ids: {}, items: []));

  @override
  Stream<HistoryState> mapEventToState(HistoryEvent event) async* {
    final id = event.item.answer.qid;
    if (state.ids.containsKey(id)) {
      final items = [...state.items];
      final index = items.indexWhere((it) => it.answer.qid == id);
      if (items[index].answer.tries < 1) {
        items[index] = event.item;
      }
      final next = state.copyWith(items: items);
      yield next;
    } else {
      final next = HistoryState(
        ids: {...state.ids, id: true},
        items: [...state.items, event.item],
      );
      yield next;
    }
  }

  @override
  HistoryState fromJson(Map<String, dynamic> json) {
    final history = HistoryState.fromJson(json);
    return history;
  }

  @override
  Map<String, dynamic> toJson(HistoryState state) {
    final json = state.toJson();
    return json;
  }
}
