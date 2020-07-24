// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'domain.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Question _$QuestionFromJson(Map<String, dynamic> json) {
  return _Question.fromJson(json);
}

class _$QuestionTearOff {
  const _$QuestionTearOff();

// ignore: unused_element
  _Question call(
      {int id, String question, String explanation, String answers, int mmr}) {
    return _Question(
      id: id,
      question: question,
      explanation: explanation,
      answers: answers,
      mmr: mmr,
    );
  }
}

// ignore: unused_element
const $Question = _$QuestionTearOff();

mixin _$Question {
  int get id;
  String get question;
  String get explanation;
  String get answers;
  int get mmr;

  Map<String, dynamic> toJson();
  $QuestionCopyWith<Question> get copyWith;
}

abstract class $QuestionCopyWith<$Res> {
  factory $QuestionCopyWith(Question value, $Res Function(Question) then) =
      _$QuestionCopyWithImpl<$Res>;
  $Res call(
      {int id, String question, String explanation, String answers, int mmr});
}

class _$QuestionCopyWithImpl<$Res> implements $QuestionCopyWith<$Res> {
  _$QuestionCopyWithImpl(this._value, this._then);

  final Question _value;
  // ignore: unused_field
  final $Res Function(Question) _then;

  @override
  $Res call({
    Object id = freezed,
    Object question = freezed,
    Object explanation = freezed,
    Object answers = freezed,
    Object mmr = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as int,
      question: question == freezed ? _value.question : question as String,
      explanation:
          explanation == freezed ? _value.explanation : explanation as String,
      answers: answers == freezed ? _value.answers : answers as String,
      mmr: mmr == freezed ? _value.mmr : mmr as int,
    ));
  }
}

abstract class _$QuestionCopyWith<$Res> implements $QuestionCopyWith<$Res> {
  factory _$QuestionCopyWith(_Question value, $Res Function(_Question) then) =
      __$QuestionCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id, String question, String explanation, String answers, int mmr});
}

class __$QuestionCopyWithImpl<$Res> extends _$QuestionCopyWithImpl<$Res>
    implements _$QuestionCopyWith<$Res> {
  __$QuestionCopyWithImpl(_Question _value, $Res Function(_Question) _then)
      : super(_value, (v) => _then(v as _Question));

  @override
  _Question get _value => super._value as _Question;

  @override
  $Res call({
    Object id = freezed,
    Object question = freezed,
    Object explanation = freezed,
    Object answers = freezed,
    Object mmr = freezed,
  }) {
    return _then(_Question(
      id: id == freezed ? _value.id : id as int,
      question: question == freezed ? _value.question : question as String,
      explanation:
          explanation == freezed ? _value.explanation : explanation as String,
      answers: answers == freezed ? _value.answers : answers as String,
      mmr: mmr == freezed ? _value.mmr : mmr as int,
    ));
  }
}

@JsonSerializable()
class _$_Question with DiagnosticableTreeMixin implements _Question {
  _$_Question(
      {this.id, this.question, this.explanation, this.answers, this.mmr});

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

  bool _didsplitted = false;
  List<String> _splitted;

  @override
  List<String> get splitted {
    if (_didsplitted == false) {
      _didsplitted = true;
      _splitted = answers.split(r'<$>');
    }
    return _splitted;
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Question(id: $id, question: $question, explanation: $explanation, answers: $answers, mmr: $mmr, splitted: $splitted)';
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
      ..add(DiagnosticsProperty('mmr', mmr))
      ..add(DiagnosticsProperty('splitted', splitted));
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

  @override
  _$QuestionCopyWith<_Question> get copyWith =>
      __$QuestionCopyWithImpl<_Question>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_QuestionToJson(this);
  }
}

abstract class _Question implements Question {
  factory _Question(
      {int id,
      String question,
      String explanation,
      String answers,
      int mmr}) = _$_Question;

  factory _Question.fromJson(Map<String, dynamic> json) = _$_Question.fromJson;

  @override
  int get id;
  @override
  String get question;
  @override
  String get explanation;
  @override
  String get answers;
  @override
  int get mmr;
  @override
  _$QuestionCopyWith<_Question> get copyWith;
}

QTree _$QTreeFromJson(Map<String, dynamic> json) {
  return _QTree.fromJson(json);
}

class _$QTreeTearOff {
  const _$QTreeTearOff();

// ignore: unused_element
  _QTree call({Question question, QTree left, QTree right}) {
    return _QTree(
      question: question,
      left: left,
      right: right,
    );
  }
}

// ignore: unused_element
const $QTree = _$QTreeTearOff();

mixin _$QTree {
  Question get question;
  QTree get left;
  QTree get right;

  Map<String, dynamic> toJson();
  $QTreeCopyWith<QTree> get copyWith;
}

abstract class $QTreeCopyWith<$Res> {
  factory $QTreeCopyWith(QTree value, $Res Function(QTree) then) =
      _$QTreeCopyWithImpl<$Res>;
  $Res call({Question question, QTree left, QTree right});

  $QuestionCopyWith<$Res> get question;
}

class _$QTreeCopyWithImpl<$Res> implements $QTreeCopyWith<$Res> {
  _$QTreeCopyWithImpl(this._value, this._then);

  final QTree _value;
  // ignore: unused_field
  final $Res Function(QTree) _then;

  @override
  $Res call({
    Object question = freezed,
    Object left = freezed,
    Object right = freezed,
  }) {
    return _then(_value.copyWith(
      question: question == freezed ? _value.question : question as Question,
      left: left == freezed ? _value.left : left as QTree,
      right: right == freezed ? _value.right : right as QTree,
    ));
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

abstract class _$QTreeCopyWith<$Res> implements $QTreeCopyWith<$Res> {
  factory _$QTreeCopyWith(_QTree value, $Res Function(_QTree) then) =
      __$QTreeCopyWithImpl<$Res>;
  @override
  $Res call({Question question, QTree left, QTree right});

  @override
  $QuestionCopyWith<$Res> get question;
}

class __$QTreeCopyWithImpl<$Res> extends _$QTreeCopyWithImpl<$Res>
    implements _$QTreeCopyWith<$Res> {
  __$QTreeCopyWithImpl(_QTree _value, $Res Function(_QTree) _then)
      : super(_value, (v) => _then(v as _QTree));

  @override
  _QTree get _value => super._value as _QTree;

  @override
  $Res call({
    Object question = freezed,
    Object left = freezed,
    Object right = freezed,
  }) {
    return _then(_QTree(
      question: question == freezed ? _value.question : question as Question,
      left: left == freezed ? _value.left : left as QTree,
      right: right == freezed ? _value.right : right as QTree,
    ));
  }
}

@JsonSerializable()
class _$_QTree with DiagnosticableTreeMixin implements _QTree {
  const _$_QTree({this.question, this.left, this.right});

  factory _$_QTree.fromJson(Map<String, dynamic> json) =>
      _$_$_QTreeFromJson(json);

  @override
  final Question question;
  @override
  final QTree left;
  @override
  final QTree right;

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

  @override
  _$QTreeCopyWith<_QTree> get copyWith =>
      __$QTreeCopyWithImpl<_QTree>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_QTreeToJson(this);
  }
}

abstract class _QTree implements QTree {
  const factory _QTree({Question question, QTree left, QTree right}) = _$_QTree;

  factory _QTree.fromJson(Map<String, dynamic> json) = _$_QTree.fromJson;

  @override
  Question get question;
  @override
  QTree get left;
  @override
  QTree get right;
  @override
  _$QTreeCopyWith<_QTree> get copyWith;
}
