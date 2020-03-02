// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

FeedState _$FeedStateFromJson(Map<String, dynamic> json) {
  return _FeedState.fromJson(json);
}

mixin _$FeedState {
  @JsonKey(toJson: _toT)
  QTree get tree;

  FeedState copyWith({@JsonKey(toJson: _toT) QTree tree});

  Map<String, dynamic> toJson();
}

class _$FeedStateTearOff {
  const _$FeedStateTearOff();

  _FeedState call({@JsonKey(toJson: _toT) QTree tree}) {
    return _FeedState(
      tree: tree,
    );
  }
}

const $FeedState = _$FeedStateTearOff();

@JsonSerializable()
class _$_FeedState with DiagnosticableTreeMixin implements _FeedState {
  const _$_FeedState({@JsonKey(toJson: _toT) this.tree});

  factory _$_FeedState.fromJson(Map<String, dynamic> json) =>
      _$_$_FeedStateFromJson(json);

  @override
  @JsonKey(toJson: _toT)
  final QTree tree;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FeedState(tree: $tree)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FeedState'))
      ..add(DiagnosticsProperty('tree', tree));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _FeedState &&
            (identical(other.tree, tree) ||
                const DeepCollectionEquality().equals(other.tree, tree)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(tree);

  @override
  _$_FeedState copyWith({
    Object tree = freezed,
  }) {
    return _$_FeedState(
      tree: tree == freezed ? this.tree : tree as QTree,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$_FeedStateToJson(this);
  }
}

abstract class _FeedState implements FeedState {
  const factory _FeedState({@JsonKey(toJson: _toT) QTree tree}) = _$_FeedState;

  factory _FeedState.fromJson(Map<String, dynamic> json) =
      _$_FeedState.fromJson;

  @override
  @JsonKey(toJson: _toT)
  QTree get tree;

  @override
  _FeedState copyWith({@JsonKey(toJson: _toT) QTree tree});
}
