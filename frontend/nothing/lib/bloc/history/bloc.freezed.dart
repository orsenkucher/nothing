// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$HistoryEventTearOff {
  const _$HistoryEventTearOff();

  _Next next(SummaryAnswer answer) {
    return _Next(
      answer,
    );
  }
}

// ignore: unused_element
const $HistoryEvent = _$HistoryEventTearOff();

mixin _$HistoryEvent {
  SummaryAnswer get answer;

  $HistoryEventCopyWith<HistoryEvent> get copyWith;
}

abstract class $HistoryEventCopyWith<$Res> {
  factory $HistoryEventCopyWith(
          HistoryEvent value, $Res Function(HistoryEvent) then) =
      _$HistoryEventCopyWithImpl<$Res>;
  $Res call({SummaryAnswer answer});

  $SummaryAnswerCopyWith<$Res> get answer;
}

class _$HistoryEventCopyWithImpl<$Res> implements $HistoryEventCopyWith<$Res> {
  _$HistoryEventCopyWithImpl(this._value, this._then);

  final HistoryEvent _value;
  // ignore: unused_field
  final $Res Function(HistoryEvent) _then;

  @override
  $Res call({
    Object answer = freezed,
  }) {
    return _then(_value.copyWith(
      answer: answer == freezed ? _value.answer : answer as SummaryAnswer,
    ));
  }

  @override
  $SummaryAnswerCopyWith<$Res> get answer {
    if (_value.answer == null) {
      return null;
    }
    return $SummaryAnswerCopyWith<$Res>(_value.answer, (value) {
      return _then(_value.copyWith(answer: value));
    });
  }
}

abstract class _$NextCopyWith<$Res> implements $HistoryEventCopyWith<$Res> {
  factory _$NextCopyWith(_Next value, $Res Function(_Next) then) =
      __$NextCopyWithImpl<$Res>;
  @override
  $Res call({SummaryAnswer answer});

  @override
  $SummaryAnswerCopyWith<$Res> get answer;
}

class __$NextCopyWithImpl<$Res> extends _$HistoryEventCopyWithImpl<$Res>
    implements _$NextCopyWith<$Res> {
  __$NextCopyWithImpl(_Next _value, $Res Function(_Next) _then)
      : super(_value, (v) => _then(v as _Next));

  @override
  _Next get _value => super._value as _Next;

  @override
  $Res call({
    Object answer = freezed,
  }) {
    return _then(_Next(
      answer == freezed ? _value.answer : answer as SummaryAnswer,
    ));
  }
}

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
  _$NextCopyWith<_Next> get copyWith =>
      __$NextCopyWithImpl<_Next>(this, _$identity);
}

abstract class _Next implements HistoryEvent {
  const factory _Next(SummaryAnswer answer) = _$_Next;

  @override
  SummaryAnswer get answer;
  @override
  _$NextCopyWith<_Next> get copyWith;
}

HistoryState _$HistoryStateFromJson(Map<String, dynamic> json) {
  return _State.fromJson(json);
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

// ignore: unused_element
const $HistoryState = _$HistoryStateTearOff();

mixin _$HistoryState {
  Map<int, bool> get ids;
  @JsonKey(toJson: _to)
  List<SummaryAnswer> get answers;

  Map<String, dynamic> toJson();
  $HistoryStateCopyWith<HistoryState> get copyWith;
}

abstract class $HistoryStateCopyWith<$Res> {
  factory $HistoryStateCopyWith(
          HistoryState value, $Res Function(HistoryState) then) =
      _$HistoryStateCopyWithImpl<$Res>;
  $Res call(
      {Map<int, bool> ids, @JsonKey(toJson: _to) List<SummaryAnswer> answers});
}

class _$HistoryStateCopyWithImpl<$Res> implements $HistoryStateCopyWith<$Res> {
  _$HistoryStateCopyWithImpl(this._value, this._then);

  final HistoryState _value;
  // ignore: unused_field
  final $Res Function(HistoryState) _then;

  @override
  $Res call({
    Object ids = freezed,
    Object answers = freezed,
  }) {
    return _then(_value.copyWith(
      ids: ids == freezed ? _value.ids : ids as Map<int, bool>,
      answers:
          answers == freezed ? _value.answers : answers as List<SummaryAnswer>,
    ));
  }
}

abstract class _$StateCopyWith<$Res> implements $HistoryStateCopyWith<$Res> {
  factory _$StateCopyWith(_State value, $Res Function(_State) then) =
      __$StateCopyWithImpl<$Res>;
  @override
  $Res call(
      {Map<int, bool> ids, @JsonKey(toJson: _to) List<SummaryAnswer> answers});
}

class __$StateCopyWithImpl<$Res> extends _$HistoryStateCopyWithImpl<$Res>
    implements _$StateCopyWith<$Res> {
  __$StateCopyWithImpl(_State _value, $Res Function(_State) _then)
      : super(_value, (v) => _then(v as _State));

  @override
  _State get _value => super._value as _State;

  @override
  $Res call({
    Object ids = freezed,
    Object answers = freezed,
  }) {
    return _then(_State(
      ids: ids == freezed ? _value.ids : ids as Map<int, bool>,
      answers:
          answers == freezed ? _value.answers : answers as List<SummaryAnswer>,
    ));
  }
}

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
  _$StateCopyWith<_State> get copyWith =>
      __$StateCopyWithImpl<_State>(this, _$identity);

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
  _$StateCopyWith<_State> get copyWith;
}
