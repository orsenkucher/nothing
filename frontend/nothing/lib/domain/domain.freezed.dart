// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'domain.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Question _$QuestionFromJson(Map<String, dynamic> json) {
  return _Question.fromJson(json);
}

/// @nodoc
class _$QuestionTearOff {
  const _$QuestionTearOff();

  _Question call(
      {required int id,
      required String question,
      required String explanation,
      required String answers,
      required int mmr}) {
    return _Question(
      id: id,
      question: question,
      explanation: explanation,
      answers: answers,
      mmr: mmr,
    );
  }

  Question fromJson(Map<String, Object> json) {
    return Question.fromJson(json);
  }
}

/// @nodoc
const $Question = _$QuestionTearOff();

/// @nodoc
mixin _$Question {
  int get id => throw _privateConstructorUsedError;
  String get question => throw _privateConstructorUsedError;
  String get explanation => throw _privateConstructorUsedError;
  String get answers => throw _privateConstructorUsedError;
  int get mmr => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuestionCopyWith<Question> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionCopyWith<$Res> {
  factory $QuestionCopyWith(Question value, $Res Function(Question) then) =
      _$QuestionCopyWithImpl<$Res>;
  $Res call(
      {int id, String question, String explanation, String answers, int mmr});
}

/// @nodoc
class _$QuestionCopyWithImpl<$Res> implements $QuestionCopyWith<$Res> {
  _$QuestionCopyWithImpl(this._value, this._then);

  final Question _value;
  // ignore: unused_field
  final $Res Function(Question) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? question = freezed,
    Object? explanation = freezed,
    Object? answers = freezed,
    Object? mmr = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      question: question == freezed
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      explanation: explanation == freezed
          ? _value.explanation
          : explanation // ignore: cast_nullable_to_non_nullable
              as String,
      answers: answers == freezed
          ? _value.answers
          : answers // ignore: cast_nullable_to_non_nullable
              as String,
      mmr: mmr == freezed
          ? _value.mmr
          : mmr // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$QuestionCopyWith<$Res> implements $QuestionCopyWith<$Res> {
  factory _$QuestionCopyWith(_Question value, $Res Function(_Question) then) =
      __$QuestionCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id, String question, String explanation, String answers, int mmr});
}

/// @nodoc
class __$QuestionCopyWithImpl<$Res> extends _$QuestionCopyWithImpl<$Res>
    implements _$QuestionCopyWith<$Res> {
  __$QuestionCopyWithImpl(_Question _value, $Res Function(_Question) _then)
      : super(_value, (v) => _then(v as _Question));

  @override
  _Question get _value => super._value as _Question;

  @override
  $Res call({
    Object? id = freezed,
    Object? question = freezed,
    Object? explanation = freezed,
    Object? answers = freezed,
    Object? mmr = freezed,
  }) {
    return _then(_Question(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      question: question == freezed
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      explanation: explanation == freezed
          ? _value.explanation
          : explanation // ignore: cast_nullable_to_non_nullable
              as String,
      answers: answers == freezed
          ? _value.answers
          : answers // ignore: cast_nullable_to_non_nullable
              as String,
      mmr: mmr == freezed
          ? _value.mmr
          : mmr // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_Question extends _Question with DiagnosticableTreeMixin {
  _$_Question(
      {required this.id,
      required this.question,
      required this.explanation,
      required this.answers,
      required this.mmr})
      : super._();

  factory _$_Question.fromJson(Map<String, dynamic> json) =>
      _$_$_QuestionFromJson(json);

  @override
  final int id;
  @override
  final String question;
  @override
  final String explanation;
  @override
  final String answers;
  @override
  final int mmr;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Question(id: $id, question: $question, explanation: $explanation, answers: $answers, mmr: $mmr)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Question'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('question', question))
      ..add(DiagnosticsProperty('explanation', explanation))
      ..add(DiagnosticsProperty('answers', answers))
      ..add(DiagnosticsProperty('mmr', mmr));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Question &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.question, question) ||
                const DeepCollectionEquality()
                    .equals(other.question, question)) &&
            (identical(other.explanation, explanation) ||
                const DeepCollectionEquality()
                    .equals(other.explanation, explanation)) &&
            (identical(other.answers, answers) ||
                const DeepCollectionEquality()
                    .equals(other.answers, answers)) &&
            (identical(other.mmr, mmr) ||
                const DeepCollectionEquality().equals(other.mmr, mmr)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(question) ^
      const DeepCollectionEquality().hash(explanation) ^
      const DeepCollectionEquality().hash(answers) ^
      const DeepCollectionEquality().hash(mmr);

  @JsonKey(ignore: true)
  @override
  _$QuestionCopyWith<_Question> get copyWith =>
      __$QuestionCopyWithImpl<_Question>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_QuestionToJson(this);
  }
}

abstract class _Question extends Question {
  factory _Question(
      {required int id,
      required String question,
      required String explanation,
      required String answers,
      required int mmr}) = _$_Question;
  _Question._() : super._();

  factory _Question.fromJson(Map<String, dynamic> json) = _$_Question.fromJson;

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  String get question => throw _privateConstructorUsedError;
  @override
  String get explanation => throw _privateConstructorUsedError;
  @override
  String get answers => throw _privateConstructorUsedError;
  @override
  int get mmr => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$QuestionCopyWith<_Question> get copyWith =>
      throw _privateConstructorUsedError;
}

QTree _$QTreeFromJson(Map<String, dynamic> json) {
  return _QTree.fromJson(json);
}

/// @nodoc
class _$QTreeTearOff {
  const _$QTreeTearOff();

  _QTree call({required Question question, QTree? left, QTree? right}) {
    return _QTree(
      question: question,
      left: left,
      right: right,
    );
  }

  QTree fromJson(Map<String, Object> json) {
    return QTree.fromJson(json);
  }
}

/// @nodoc
const $QTree = _$QTreeTearOff();

/// @nodoc
mixin _$QTree {
  Question get question => throw _privateConstructorUsedError;
  QTree? get left => throw _privateConstructorUsedError;
  QTree? get right => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QTreeCopyWith<QTree> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QTreeCopyWith<$Res> {
  factory $QTreeCopyWith(QTree value, $Res Function(QTree) then) =
      _$QTreeCopyWithImpl<$Res>;
  $Res call({Question question, QTree? left, QTree? right});

  $QuestionCopyWith<$Res> get question;
  $QTreeCopyWith<$Res>? get left;
  $QTreeCopyWith<$Res>? get right;
}

/// @nodoc
class _$QTreeCopyWithImpl<$Res> implements $QTreeCopyWith<$Res> {
  _$QTreeCopyWithImpl(this._value, this._then);

  final QTree _value;
  // ignore: unused_field
  final $Res Function(QTree) _then;

  @override
  $Res call({
    Object? question = freezed,
    Object? left = freezed,
    Object? right = freezed,
  }) {
    return _then(_value.copyWith(
      question: question == freezed
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as Question,
      left: left == freezed
          ? _value.left
          : left // ignore: cast_nullable_to_non_nullable
              as QTree?,
      right: right == freezed
          ? _value.right
          : right // ignore: cast_nullable_to_non_nullable
              as QTree?,
    ));
  }

  @override
  $QuestionCopyWith<$Res> get question {
    return $QuestionCopyWith<$Res>(_value.question, (value) {
      return _then(_value.copyWith(question: value));
    });
  }

  @override
  $QTreeCopyWith<$Res>? get left {
    if (_value.left == null) {
      return null;
    }

    return $QTreeCopyWith<$Res>(_value.left!, (value) {
      return _then(_value.copyWith(left: value));
    });
  }

  @override
  $QTreeCopyWith<$Res>? get right {
    if (_value.right == null) {
      return null;
    }

    return $QTreeCopyWith<$Res>(_value.right!, (value) {
      return _then(_value.copyWith(right: value));
    });
  }
}

/// @nodoc
abstract class _$QTreeCopyWith<$Res> implements $QTreeCopyWith<$Res> {
  factory _$QTreeCopyWith(_QTree value, $Res Function(_QTree) then) =
      __$QTreeCopyWithImpl<$Res>;
  @override
  $Res call({Question question, QTree? left, QTree? right});

  @override
  $QuestionCopyWith<$Res> get question;
  @override
  $QTreeCopyWith<$Res>? get left;
  @override
  $QTreeCopyWith<$Res>? get right;
}

/// @nodoc
class __$QTreeCopyWithImpl<$Res> extends _$QTreeCopyWithImpl<$Res>
    implements _$QTreeCopyWith<$Res> {
  __$QTreeCopyWithImpl(_QTree _value, $Res Function(_QTree) _then)
      : super(_value, (v) => _then(v as _QTree));

  @override
  _QTree get _value => super._value as _QTree;

  @override
  $Res call({
    Object? question = freezed,
    Object? left = freezed,
    Object? right = freezed,
  }) {
    return _then(_QTree(
      question: question == freezed
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as Question,
      left: left == freezed
          ? _value.left
          : left // ignore: cast_nullable_to_non_nullable
              as QTree?,
      right: right == freezed
          ? _value.right
          : right // ignore: cast_nullable_to_non_nullable
              as QTree?,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_QTree with DiagnosticableTreeMixin implements _QTree {
  const _$_QTree({required this.question, this.left, this.right});

  factory _$_QTree.fromJson(Map<String, dynamic> json) =>
      _$_$_QTreeFromJson(json);

  @override
  final Question question;
  @override
  final QTree? left;
  @override
  final QTree? right;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'QTree(question: $question, left: $left, right: $right)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'QTree'))
      ..add(DiagnosticsProperty('question', question))
      ..add(DiagnosticsProperty('left', left))
      ..add(DiagnosticsProperty('right', right));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _QTree &&
            (identical(other.question, question) ||
                const DeepCollectionEquality()
                    .equals(other.question, question)) &&
            (identical(other.left, left) ||
                const DeepCollectionEquality().equals(other.left, left)) &&
            (identical(other.right, right) ||
                const DeepCollectionEquality().equals(other.right, right)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(question) ^
      const DeepCollectionEquality().hash(left) ^
      const DeepCollectionEquality().hash(right);

  @JsonKey(ignore: true)
  @override
  _$QTreeCopyWith<_QTree> get copyWith =>
      __$QTreeCopyWithImpl<_QTree>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_QTreeToJson(this);
  }
}

abstract class _QTree implements QTree {
  const factory _QTree(
      {required Question question, QTree? left, QTree? right}) = _$_QTree;

  factory _QTree.fromJson(Map<String, dynamic> json) = _$_QTree.fromJson;

  @override
  Question get question => throw _privateConstructorUsedError;
  @override
  QTree? get left => throw _privateConstructorUsedError;
  @override
  QTree? get right => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$QTreeCopyWith<_QTree> get copyWith => throw _privateConstructorUsedError;
}
