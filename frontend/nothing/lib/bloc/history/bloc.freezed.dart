// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HistoryItem _$HistoryItemFromJson(Map<String, dynamic> json) {
  return _HistoryItem.fromJson(json);
}

/// @nodoc
class _$HistoryItemTearOff {
  const _$HistoryItemTearOff();

  _HistoryItem call(
      {required SummaryAnswer answer, required Question question}) {
    return _HistoryItem(
      answer: answer,
      question: question,
    );
  }

  HistoryItem fromJson(Map<String, Object> json) {
    return HistoryItem.fromJson(json);
  }
}

/// @nodoc
const $HistoryItem = _$HistoryItemTearOff();

/// @nodoc
mixin _$HistoryItem {
  SummaryAnswer get answer => throw _privateConstructorUsedError;
  Question get question => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HistoryItemCopyWith<HistoryItem> get copyWith =>
      throw _privateConstructorUsedError;
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
    Object? answer = freezed,
    Object? question = freezed,
  }) {
    return _then(_value.copyWith(
      answer: answer == freezed
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as SummaryAnswer,
      question: question == freezed
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as Question,
    ));
  }

  @override
  $SummaryAnswerCopyWith<$Res> get answer {
    return $SummaryAnswerCopyWith<$Res>(_value.answer, (value) {
      return _then(_value.copyWith(answer: value));
    });
  }

  @override
  $QuestionCopyWith<$Res> get question {
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
    Object? answer = freezed,
    Object? question = freezed,
  }) {
    return _then(_HistoryItem(
      answer: answer == freezed
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as SummaryAnswer,
      question: question == freezed
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as Question,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_HistoryItem extends _HistoryItem with DiagnosticableTreeMixin {
  const _$_HistoryItem({required this.answer, required this.question})
      : super._();

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
  const factory _HistoryItem(
      {required SummaryAnswer answer,
      required Question question}) = _$_HistoryItem;
  const _HistoryItem._() : super._();

  factory _HistoryItem.fromJson(Map<String, dynamic> json) =
      _$_HistoryItem.fromJson;

  @override
  SummaryAnswer get answer => throw _privateConstructorUsedError;
  @override
  Question get question => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$HistoryItemCopyWith<_HistoryItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$HistoryEventTearOff {
  const _$HistoryEventTearOff();

  _Next next(HistoryItem item) {
    return _Next(
      item,
    );
  }
}

/// @nodoc
const $HistoryEvent = _$HistoryEventTearOff();

/// @nodoc
mixin _$HistoryEvent {
  HistoryItem get item => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(HistoryItem item) next,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(HistoryItem item)? next,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Next value) next,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Next value)? next,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HistoryEventCopyWith<HistoryEvent> get copyWith =>
      throw _privateConstructorUsedError;
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
    Object? item = freezed,
  }) {
    return _then(_value.copyWith(
      item: item == freezed
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as HistoryItem,
    ));
  }

  @override
  $HistoryItemCopyWith<$Res> get item {
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
    Object? item = freezed,
  }) {
    return _then(_Next(
      item == freezed
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as HistoryItem,
    ));
  }
}

/// @nodoc
class _$_Next with DiagnosticableTreeMixin implements _Next {
  const _$_Next(this.item);

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
  TResult when<TResult extends Object?>({
    required TResult Function(HistoryItem item) next,
  }) {
    return next(item);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(HistoryItem item)? next,
    required TResult orElse(),
  }) {
    if (next != null) {
      return next(item);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Next value) next,
  }) {
    return next(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Next value)? next,
    required TResult orElse(),
  }) {
    if (next != null) {
      return next(this);
    }
    return orElse();
  }
}

abstract class _Next implements HistoryEvent {
  const factory _Next(HistoryItem item) = _$_Next;

  @override
  HistoryItem get item => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$NextCopyWith<_Next> get copyWith => throw _privateConstructorUsedError;
}

HistoryState _$HistoryStateFromJson(Map<String, dynamic> json) {
  return _State.fromJson(json);
}

/// @nodoc
class _$HistoryStateTearOff {
  const _$HistoryStateTearOff();

  _State call({required Map<int, bool> ids, required List<HistoryItem> items}) {
    return _State(
      ids: ids,
      items: items,
    );
  }

  HistoryState fromJson(Map<String, Object> json) {
    return HistoryState.fromJson(json);
  }
}

/// @nodoc
const $HistoryState = _$HistoryStateTearOff();

/// @nodoc
mixin _$HistoryState {
  Map<int, bool> get ids =>
      throw _privateConstructorUsedError; // HashSet with ids
  List<HistoryItem> get items => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HistoryStateCopyWith<HistoryState> get copyWith =>
      throw _privateConstructorUsedError;
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
    Object? ids = freezed,
    Object? items = freezed,
  }) {
    return _then(_value.copyWith(
      ids: ids == freezed
          ? _value.ids
          : ids // ignore: cast_nullable_to_non_nullable
              as Map<int, bool>,
      items: items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<HistoryItem>,
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
    Object? ids = freezed,
    Object? items = freezed,
  }) {
    return _then(_State(
      ids: ids == freezed
          ? _value.ids
          : ids // ignore: cast_nullable_to_non_nullable
              as Map<int, bool>,
      items: items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<HistoryItem>,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_State with DiagnosticableTreeMixin implements _State {
  const _$_State({required this.ids, required this.items});

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
      {required Map<int, bool> ids,
      required List<HistoryItem> items}) = _$_State;

  factory _State.fromJson(Map<String, dynamic> json) = _$_State.fromJson;

  @override
  Map<int, bool> get ids => throw _privateConstructorUsedError;
  @override // HashSet with ids
  List<HistoryItem> get items => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$StateCopyWith<_State> get copyWith => throw _privateConstructorUsedError;
}
