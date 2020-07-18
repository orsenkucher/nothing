import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:nothing/bloc/summary/bloc.dart';

part 'bloc.freezed.dart';
part 'bloc.g.dart';

@freezed
abstract class HistoryEvent with _$HistoryEvent {
  const factory HistoryEvent.next(SummaryAnswer answer) = _Next;
}

@freezed
abstract class HistoryState with _$HistoryState {
  const factory HistoryState({
    @required Map<int, bool> ids, // HashSet with ids
    @required @JsonKey(toJson: _to) List<SummaryAnswer> answers,
  }) = _State;

  factory HistoryState.fromJson(Map<String, dynamic> json) => _$HistoryStateFromJson(json);
}

List<dynamic> _to(List<SummaryAnswer> ss) => ss?.map((s) => s.toJson())?.toList();

class HistoryBloc extends HydratedBloc<HistoryEvent, HistoryState> {
  HistoryBloc() : super(HistoryState(ids: {}, answers: []));

  @override
  Stream<HistoryState> mapEventToState(HistoryEvent event) async* {
    final id = event.answer.qid;
    if (state.ids.containsKey(id)) {
      final answers = [...state.answers];
      answers[answers.indexWhere((x) => x.qid == id)] = event.answer;
      final next = state.copyWith(answers: answers);
      yield next;
    } else {
      final next = HistoryState(
        ids: {...state.ids, id: true},
        answers: [...state.answers, event.answer],
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
