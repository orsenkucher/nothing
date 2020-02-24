import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:nothing/bloc/summary/bloc.dart';

part 'bloc.freezed.dart';
part 'bloc.g.dart';

@freezed
abstract class HistoryEvent with _$HistoryEvent {
  const factory HistoryEvent.next(SummaryAnswer answer) = _Next;

  factory HistoryEvent.fromJson(Map<String, dynamic> json) =>
      _$HistoryEventFromJson(json);
}

@freezed
abstract class HistoryState with _$HistoryState {
  const factory HistoryState(List<SummaryAnswer> answers) = _State;
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
