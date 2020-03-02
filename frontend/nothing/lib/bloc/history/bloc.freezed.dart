// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$HistoryEvent {
  SummaryAnswer get answer;

  HistoryEvent copyWith({SummaryAnswer answer});
}

class _$HistoryEventTearOff {
  const _$HistoryEventTearOff();

  _Next next(SummaryAnswer answer) {
    return _Next(
      answer,
    );
  }
}

const $HistoryEvent = _$HistoryEventTearOff();

class _$_Next with DiagnosticableTreeMixin implements _Next {
  const _$_Next(this.answer) : assert(answer != null);

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
}

abstract class _Next implements HistoryEvent {
  const factory _Next(SummaryAnswer answer) = _$_Next;

  @override
  SummaryAnswer get answer;

  @override
  _Next copyWith({SummaryAnswer answer});
}

HistoryState _$HistoryStateFromJson(Map<String, dynamic> json) {
  return _State.fromJson(json);
}

mixin _$HistoryState {
  Map<int, bool> get ids;
  @JsonKey(toJson: _to)
  List<SummaryAnswer> get answers;

  HistoryState copyWith(
      {Map<int, bool> ids, @JsonKey(toJson: _to) List<SummaryAnswer> answers});

  Map<String, dynamic> toJson();
}

class _$HistoryStateTearOff {
  const _$HistoryStateTearOff();

  _State call(
      {@required Map<int, bool> ids,
      @required @JsonKey(toJson: _to) List<SummaryAnswer> answers}) {
    return _State(
      ids: ids,
      answers: answers,
    );
  }
}

const $HistoryState = _$HistoryStateTearOff();

@JsonSerializable()
class _$_State with DiagnosticableTreeMixin implements _State {
  const _$_State(
      {@required this.ids, @required @JsonKey(toJson: _to) this.answers})
      : assert(ids != null),
        assert(answers != null);

  factory _$_State.fromJson(Map<String, dynamic> json) =>
      _$_$_StateFromJson(json);

  @override
  final Map<int, bool> ids;
  @override
  @JsonKey(toJson: _to)
  final List<SummaryAnswer> answers;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'HistoryState(ids: $ids, answers: $answers)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'HistoryState'))
      ..add(DiagnosticsProperty('ids', ids))
      ..add(DiagnosticsProperty('answers', answers));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _State &&
            (identical(other.ids, ids) ||
                const DeepCollectionEquality().equals(other.ids, ids)) &&
            (identical(other.answers, answers) ||
                const DeepCollectionEquality().equals(other.answers, answers)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(ids) ^
      const DeepCollectionEquality().hash(answers);

  @override
  _$_State copyWith({
    Object ids = freezed,
    Object answers = freezed,
  }) {
    return _$_State(
      ids: ids == freezed ? this.ids : ids as Map<int, bool>,
      answers:
          answers == freezed ? this.answers : answers as List<SummaryAnswer>,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$_StateToJson(this);
  }
}

abstract class _State implements HistoryState {
  const factory _State(
      {@required Map<int, bool> ids,
      @required @JsonKey(toJson: _to) List<SummaryAnswer> answers}) = _$_State;

  factory _State.fromJson(Map<String, dynamic> json) = _$_State.fromJson;

  @override
  Map<int, bool> get ids;
  @override
  @JsonKey(toJson: _to)
  List<SummaryAnswer> get answers;

  @override
  _State copyWith(
      {Map<int, bool> ids, @JsonKey(toJson: _to) List<SummaryAnswer> answers});
}
