import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:nothing/bloc/summary/bloc.dart';
import 'package:nothing/bloc/validation/bloc.dart';

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

  factory HistoryState.fromJson(Map<String, dynamic> json) =>
      _$HistoryStateFromJson(json);
}

List<dynamic> _to(List<SummaryAnswer> ss) =>
    ss?.map((s) => s.toJson())?.toList();

class HistoryBloc extends HydratedBloc<HistoryEvent, HistoryState> {
  final ValidationBloc validation;
  StreamSubscription _sub;

  HistoryBloc({@required this.validation}) {
    _sub = validation.listen((s) {
      print('%%% HISTORY: $s');
      add(HistoryEvent.next(SummaryAnswer(
          qid: s.question.id,
          tries: s.tries,
          seconds: s.maybeMap(
            correct: (x) => x.duration.inSeconds,
            orElse: () => 0,
          ))));
    });
  }

  @override
  Future<void> close() {
    _sub.cancel();
    return super.close();
  }

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
    try {
      final history = HistoryState.fromJson(json);
      return history;
    } on dynamic catch (_) {
      print('History: fromJson error');
      return null;
    }
  }

  @override
  Map<String, dynamic> toJson(HistoryState state) {
    try {
      final json = state.toJson();
      return json;
    } catch (_) {
      print('History: toJson error');
      return null;
    }
  }
}

// Bro, is this theme a very scecial kind of sause for your day?
// I think I today had very tiny microdose, about something*10^-6, without any visuals all day long.
// BUT few minutes I've opened vscode I started tripping so hard on my code, with moving layers and warping screen
// So gotcha bro
// I have explored hidden abstraction under this theme bro

// I have explored hidden sense under your theme bro
// With very tiny md without any visuals all day long,
// With very tiny md and no visuals all day long,
// When I opended vscode, I have started tripping so hard on it
// I have passed a critical point
// I have started tripping so hard on my code, with screen wraping and layers moving
// Very good color choise, like it.
