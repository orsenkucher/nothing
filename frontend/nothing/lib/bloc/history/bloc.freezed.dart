// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters

part of 'bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

HistoryEvent _$HistoryEventFromJson(Map<String, dynamic> json) {
  return _Next.fromJson(json);
}

mixin _$HistoryEvent {
  SummaryAnswer get answer;

  HistoryEvent copyWith({SummaryAnswer answer});

  Map<String, dynamic> toJson();
}

@JsonSerializable()
class _$_Next with DiagnosticableTreeMixin implements _Next {
  const _$_Next(this.answer) : assert(answer != null);

  factory _$_Next.fromJson(Map<String, dynamic> json) =>
      _$_$_NextFromJson(json);

  @override
  final SummaryAnswer answer;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'HistoryEvent.next(answer: $answer)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'HistoryEvent.next'))
      ..add(DiagnosticsProperty('answer', answer));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Next &&
            (identical(other.answer, answer) ||
                const DeepCollectionEquality().equals(other.answer, answer)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(answer);

  @override
  _$_Next copyWith({
    Object answer = freezed,
  }) {
    return _$_Next(
      answer == freezed ? this.answer : answer as SummaryAnswer,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$_NextToJson(this);
  }
}

abstract class _Next implements HistoryEvent {
  const factory _Next(SummaryAnswer answer) = _$_Next;

  factory _Next.fromJson(Map<String, dynamic> json) = _$_Next.fromJson;

  @override
  SummaryAnswer get answer;

  @override
  _Next copyWith({SummaryAnswer answer});
}

mixin _$HistoryState {
  List<SummaryAnswer> get answers;

  HistoryState copyWith({List<SummaryAnswer> answers});
}

class _$_State with DiagnosticableTreeMixin implements _State {
  const _$_State(this.answers) : assert(answers != null);

  @override
  final List<SummaryAnswer> answers;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'HistoryState(answers: $answers)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'HistoryState'))
      ..add(DiagnosticsProperty('answers', answers));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _State &&
            (identical(other.answers, answers) ||
                const DeepCollectionEquality().equals(other.answers, answers)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(answers);

  @override
  _$_State copyWith({
    Object answers = freezed,
  }) {
    return _$_State(
      answers == freezed ? this.answers : answers as List<SummaryAnswer>,
    );
  }
}

abstract class _State implements HistoryState {
  const factory _State(List<SummaryAnswer> answers) = _$_State;

  @override
  List<SummaryAnswer> get answers;

  @override
  _State copyWith({List<SummaryAnswer> answers});
}
