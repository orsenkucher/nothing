// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
HistoryItem _$HistoryItemFromJson(Map<String, dynamic> json) {
  return _HistoryItem.fromJson(json);
}

/// @nodoc
class _$HistoryItemTearOff {
  const _$HistoryItemTearOff();

// ignore: unused_element
  _HistoryItem call(
      {@required SummaryAnswer answer, @required Question question}) {
    return _HistoryItem(
      answer: answer,
      question: question,
    );
  }

// ignore: unused_element
  HistoryItem fromJson(Map<String, Object> json) {
    return HistoryItem.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $HistoryItem = _$HistoryItemTearOff();

/// @nodoc
mixin _$HistoryItem {
  SummaryAnswer get answer;
  Question get question;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $HistoryItemCopyWith<HistoryItem> get copyWith;
}

/// @nodoc
abstract class $HistoryItemCopyWith<$Res> {
  factory $HistoryItemCopyWith(
          HistoryItem value, $Res Function(HistoryItem) then) =
      _$HistoryItemCopyWithImpl<$Res>;
  $Res call({SummaryAnswer answer, Question question});

  $SummaryAnswerCopyWith<$Res> get answer;
  $QuestionCopyWith<$Res> get question;
}

/// @nodoc
class _$HistoryItemCopyWithImpl<$Res> implements $HistoryItemCopyWith<$Res> {
  _$HistoryItemCopyWithImpl(this._value, this._then);

  final HistoryItem _value;
  // ignore: unused_field
  final $Res Function(HistoryItem) _then;

  @override
  $Res call({
    Object answer = freezed,
    Object question = freezed,
  }) {
    return _then(_value.copyWith(
      answer: answer == freezed ? _value.answer : answer as SummaryAnswer,
      question: question == freezed ? _value.question : question as Question,
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

  @override
  $QuestionCopyWith<$Res> get question {
    if (_value.question == null) {
      return null;
    }
    return $QuestionCopyWith<$Res>(_value.question, (value) {
      return _then(_value.copyWith(question: value));
    });
  }
}

/// @nodoc
abstract class _$HistoryItemCopyWith<$Res>
    implements $HistoryItemCopyWith<$Res> {
  factory _$HistoryItemCopyWith(
          _HistoryItem value, $Res Function(_HistoryItem) then) =
      __$HistoryItemCopyWithImpl<$Res>;
  @override
  $Res call({SummaryAnswer answer, Question question});

  @override
  $SummaryAnswerCopyWith<$Res> get answer;
  @override
  $QuestionCopyWith<$Res> get question;
}

/// @nodoc
class __$HistoryItemCopyWithImpl<$Res> extends _$HistoryItemCopyWithImpl<$Res>
    implements _$HistoryItemCopyWith<$Res> {
  __$HistoryItemCopyWithImpl(
      _HistoryItem _value, $Res Function(_HistoryItem) _then)
      : super(_value, (v) => _then(v as _HistoryItem));

  @override
  _HistoryItem get _value => super._value as _HistoryItem;

  @override
  $Res call({
    Object answer = freezed,
    Object question = freezed,
  }) {
    return _then(_HistoryItem(
      answer: answer == freezed ? _value.answer : answer as SummaryAnswer,
      question: question == freezed ? _value.question : question as Question,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_HistoryItem extends _HistoryItem with DiagnosticableTreeMixin {
  const _$_HistoryItem({@required this.answer, @required this.question})
      : assert(answer != null),
        assert(question != null),
        super._();

  factory _$_HistoryItem.fromJson(Map<String, dynamic> json) =>
      _$_$_HistoryItemFromJson(json);

  @override
  final SummaryAnswer answer;
  @override
  final Question question;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'HistoryItem(answer: $answer, question: $question)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'HistoryItem'))
      ..add(DiagnosticsProperty('answer', answer))
      ..add(DiagnosticsProperty('question', question));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _HistoryItem &&
            (identical(other.answer, answer) ||
                const DeepCollectionEquality().equals(other.answer, answer)) &&
            (identical(other.question, question) ||
                const DeepCollectionEquality()
                    .equals(other.question, question)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(answer) ^
      const DeepCollectionEquality().hash(question);

  @JsonKey(ignore: true)
  @override
  _$HistoryItemCopyWith<_HistoryItem> get copyWith =>
      __$HistoryItemCopyWithImpl<_HistoryItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_HistoryItemToJson(this);
  }
}

abstract class _HistoryItem extends HistoryItem {
  const _HistoryItem._() : super._();
  const factory _HistoryItem(
      {@required SummaryAnswer answer,
      @required Question question}) = _$_HistoryItem;

  factory _HistoryItem.fromJson(Map<String, dynamic> json) =
      _$_HistoryItem.fromJson;

  @override
  SummaryAnswer get answer;
  @override
  Question get question;
  @override
  @JsonKey(ignore: true)
  _$HistoryItemCopyWith<_HistoryItem> get copyWith;
}

/// @nodoc
class _$HistoryEventTearOff {
  const _$HistoryEventTearOff();

// ignore: unused_element
  _Next next(HistoryItem item) {
    return _Next(
      item,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $HistoryEvent = _$HistoryEventTearOff();

/// @nodoc
mixin _$HistoryEvent {
  HistoryItem get item;

  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult next(HistoryItem item),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult next(HistoryItem item),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult next(_Next value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult next(_Next value),
    @required TResult orElse(),
  });

  @JsonKey(ignore: true)
  $HistoryEventCopyWith<HistoryEvent> get copyWith;
}

/// @nodoc
abstract class $HistoryEventCopyWith<$Res> {
  factory $HistoryEventCopyWith(
          HistoryEvent value, $Res Function(HistoryEvent) then) =
      _$HistoryEventCopyWithImpl<$Res>;
  $Res call({HistoryItem item});

  $HistoryItemCopyWith<$Res> get item;
}

/// @nodoc
class _$HistoryEventCopyWithImpl<$Res> implements $HistoryEventCopyWith<$Res> {
  _$HistoryEventCopyWithImpl(this._value, this._then);

  final HistoryEvent _value;
  // ignore: unused_field
  final $Res Function(HistoryEvent) _then;

  @override
  $Res call({
    Object item = freezed,
  }) {
    return _then(_value.copyWith(
      item: item == freezed ? _value.item : item as HistoryItem,
    ));
  }

  @override
  $HistoryItemCopyWith<$Res> get item {
    if (_value.item == null) {
      return null;
    }
    return $HistoryItemCopyWith<$Res>(_value.item, (value) {
      return _then(_value.copyWith(item: value));
    });
  }
}

/// @nodoc
abstract class _$NextCopyWith<$Res> implements $HistoryEventCopyWith<$Res> {
  factory _$NextCopyWith(_Next value, $Res Function(_Next) then) =
      __$NextCopyWithImpl<$Res>;
  @override
  $Res call({HistoryItem item});

  @override
  $HistoryItemCopyWith<$Res> get item;
}

/// @nodoc
class __$NextCopyWithImpl<$Res> extends _$HistoryEventCopyWithImpl<$Res>
    implements _$NextCopyWith<$Res> {
  __$NextCopyWithImpl(_Next _value, $Res Function(_Next) _then)
      : super(_value, (v) => _then(v as _Next));

  @override
  _Next get _value => super._value as _Next;

  @override
  $Res call({
    Object item = freezed,
  }) {
    return _then(_Next(
      item == freezed ? _value.item : item as HistoryItem,
    ));
  }
}

/// @nodoc
class _$_Next with DiagnosticableTreeMixin implements _Next {
  const _$_Next(this.item) : assert(item != null);

  @override
  final HistoryItem item;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'HistoryEvent.next(item: $item)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'HistoryEvent.next'))
      ..add(DiagnosticsProperty('item', item));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Next &&
            (identical(other.item, item) ||
                const DeepCollectionEquality().equals(other.item, item)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(item);

  @JsonKey(ignore: true)
  @override
  _$NextCopyWith<_Next> get copyWith =>
      __$NextCopyWithImpl<_Next>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult next(HistoryItem item),
  }) {
    assert(next != null);
    return next(item);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult next(HistoryItem item),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (next != null) {
      return next(item);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult next(_Next value),
  }) {
    assert(next != null);
    return next(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult next(_Next value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (next != null) {
      return next(this);
    }
    return orElse();
  }
}

abstract class _Next implements HistoryEvent {
  const factory _Next(HistoryItem item) = _$_Next;

  @override
  HistoryItem get item;
  @override
  @JsonKey(ignore: true)
  _$NextCopyWith<_Next> get copyWith;
}

HistoryState _$HistoryStateFromJson(Map<String, dynamic> json) {
  return _State.fromJson(json);
}

/// @nodoc
class _$HistoryStateTearOff {
  const _$HistoryStateTearOff();

// ignore: unused_element
  _State call(
      {@required Map<int, bool> ids, @required List<HistoryItem> items}) {
    return _State(
      ids: ids,
      items: items,
    );
  }

// ignore: unused_element
  HistoryState fromJson(Map<String, Object> json) {
    return HistoryState.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $HistoryState = _$HistoryStateTearOff();

/// @nodoc
mixin _$HistoryState {
  Map<int, bool> get ids; // HashSet with ids
  List<HistoryItem> get items;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $HistoryStateCopyWith<HistoryState> get copyWith;
}

/// @nodoc
abstract class $HistoryStateCopyWith<$Res> {
  factory $HistoryStateCopyWith(
          HistoryState value, $Res Function(HistoryState) then) =
      _$HistoryStateCopyWithImpl<$Res>;
  $Res call({Map<int, bool> ids, List<HistoryItem> items});
}

/// @nodoc
class _$HistoryStateCopyWithImpl<$Res> implements $HistoryStateCopyWith<$Res> {
  _$HistoryStateCopyWithImpl(this._value, this._then);

  final HistoryState _value;
  // ignore: unused_field
  final $Res Function(HistoryState) _then;

  @override
  $Res call({
    Object ids = freezed,
    Object items = freezed,
  }) {
    return _then(_value.copyWith(
      ids: ids == freezed ? _value.ids : ids as Map<int, bool>,
      items: items == freezed ? _value.items : items as List<HistoryItem>,
    ));
  }
}

/// @nodoc
abstract class _$StateCopyWith<$Res> implements $HistoryStateCopyWith<$Res> {
  factory _$StateCopyWith(_State value, $Res Function(_State) then) =
      __$StateCopyWithImpl<$Res>;
  @override
  $Res call({Map<int, bool> ids, List<HistoryItem> items});
}

/// @nodoc
class __$StateCopyWithImpl<$Res> extends _$HistoryStateCopyWithImpl<$Res>
    implements _$StateCopyWith<$Res> {
  __$StateCopyWithImpl(_State _value, $Res Function(_State) _then)
      : super(_value, (v) => _then(v as _State));

  @override
  _State get _value => super._value as _State;

  @override
  $Res call({
    Object ids = freezed,
    Object items = freezed,
  }) {
    return _then(_State(
      ids: ids == freezed ? _value.ids : ids as Map<int, bool>,
      items: items == freezed ? _value.items : items as List<HistoryItem>,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_State with DiagnosticableTreeMixin implements _State {
  const _$_State({@required this.ids, @required this.items})
      : assert(ids != null),
        assert(items != null);

  factory _$_State.fromJson(Map<String, dynamic> json) =>
      _$_$_StateFromJson(json);

  @override
  final Map<int, bool> ids;
  @override // HashSet with ids
  final List<HistoryItem> items;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'HistoryState(ids: $ids, items: $items)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'HistoryState'))
      ..add(DiagnosticsProperty('ids', ids))
      ..add(DiagnosticsProperty('items', items));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _State &&
            (identical(other.ids, ids) ||
                const DeepCollectionEquality().equals(other.ids, ids)) &&
            (identical(other.items, items) ||
                const DeepCollectionEquality().equals(other.items, items)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(ids) ^
      const DeepCollectionEquality().hash(items);

  @JsonKey(ignore: true)
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
      @required List<HistoryItem> items}) = _$_State;

  factory _State.fromJson(Map<String, dynamic> json) = _$_State.fromJson;

  @override
  Map<int, bool> get ids;
  @override // HashSet with ids
  List<HistoryItem> get items;
  @override
  @JsonKey(ignore: true)
  _$StateCopyWith<_State> get copyWith;
}
