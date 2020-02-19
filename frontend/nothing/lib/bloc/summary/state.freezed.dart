// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package

part of 'state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

Summary _$SummaryFromJson(Map<String, dynamic> json) {
  return _Summary.fromJson(json);
}

mixin _$Summary {
  int get id;
  Map<int, bool> get summary;

  Summary copyWith({int id, Map<int, bool> summary});

  Map<String, dynamic> toJson();
}

@JsonSerializable()
class _$_Summary with DiagnosticableTreeMixin implements _Summary {
  const _$_Summary({@required this.id, @required this.summary})
      : assert(id != null),
        assert(summary != null);

  factory _$_Summary.fromJson(Map<String, dynamic> json) =>
      _$_$_SummaryFromJson(json);

  @override
  final int id;
  @override
  final Map<int, bool> summary;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Summary(id: $id, summary: $summary)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Summary'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('summary', summary));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Summary &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.summary, summary) ||
                const DeepCollectionEquality().equals(other.summary, summary)));
  }

  @override
  int get hashCode => runtimeType.hashCode ^ id.hashCode ^ summary.hashCode;

  @override
  _$_Summary copyWith({
    Object id = freezed,
    Object summary = freezed,
  }) {
    assert(id != null);
    assert(summary != null);
    return _$_Summary(
      id: id == freezed ? this.id : id as int,
      summary: summary == freezed ? this.summary : summary as Map<int, bool>,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SummaryToJson(this);
  }
}

abstract class _Summary implements Summary {
  const factory _Summary({@required int id, @required Map<int, bool> summary}) =
      _$_Summary;

  factory _Summary.fromJson(Map<String, dynamic> json) = _$_Summary.fromJson;

  @override
  int get id;
  @override
  Map<int, bool> get summary;

  @override
  _Summary copyWith({int id, Map<int, bool> summary});
}
