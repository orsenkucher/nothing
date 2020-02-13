// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package

part of 'domain.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

Question _$QuestionFromJson(Map<String, dynamic> json) {
  return _Question.fromJson(json);
}

mixin _$Question {
  List<String> get qs;
  @JsonKey(toJson: _to)
  List<Question> get tree;

  Question copyWith(
      {List<String> qs, @JsonKey(toJson: _to) List<Question> tree});

  Map<String, dynamic> toJson();
}

@JsonSerializable()
class _$_Question with DiagnosticableTreeMixin implements _Question {
  const _$_Question(this.qs, @JsonKey(toJson: _to) this.tree);

  factory _$_Question.fromJson(Map<String, dynamic> json) =>
      _$_$_QuestionFromJson(json);

  @override
  final List<String> qs;
  @override
  @JsonKey(toJson: _to)
  final List<Question> tree;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.debug}) {
    return 'Question(qs: $qs, tree: $tree)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Question'))
      ..add(DiagnosticsProperty('qs', qs))
      ..add(DiagnosticsProperty('tree', tree));
  }

  @override
  bool operator ==(dynamic other) {
    return other is _Question &&
        (identical(other.qs, qs) || other.qs == qs) &&
        (identical(other.tree, tree) || other.tree == tree);
  }

  @override
  int get hashCode => runtimeType.hashCode ^ qs.hashCode ^ tree.hashCode;

  @override
  _$_Question copyWith({
    Object qs = immutable,
    Object tree = immutable,
  }) {
    return _$_Question(
      qs == immutable ? this.qs : qs as List<String>,
      tree == immutable ? this.tree : tree as List<Question>,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$_QuestionToJson(this);
  }
}

abstract class _Question implements Question {
  const factory _Question(
      List<String> qs, @JsonKey(toJson: _to) List<Question> tree) = _$_Question;

  factory _Question.fromJson(Map<String, dynamic> json) = _$_Question.fromJson;

  @override
  List<String> get qs;
  @override
  @JsonKey(toJson: _to)
  List<Question> get tree;

  @override
  _Question copyWith(
      {List<String> qs, @JsonKey(toJson: _to) List<Question> tree});
}
