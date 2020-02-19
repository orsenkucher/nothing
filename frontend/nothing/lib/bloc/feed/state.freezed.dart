// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package

part of 'state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

Feed _$FeedFromJson(Map<String, dynamic> json) {
  return _Feed.fromJson(json);
}

mixin _$Feed {
  QTree get tree;
  int get current;

  Feed copyWith({QTree tree, int current});

  Map<String, dynamic> toJson();
}

@JsonSerializable()
class _$_Feed with DiagnosticableTreeMixin implements _Feed {
  const _$_Feed({this.tree, this.current});

  factory _$_Feed.fromJson(Map<String, dynamic> json) =>
      _$_$_FeedFromJson(json);

  @override
  final QTree tree;
  @override
  final int current;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Feed(tree: $tree, current: $current)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Feed'))
      ..add(DiagnosticsProperty('tree', tree))
      ..add(DiagnosticsProperty('current', current));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Feed &&
            (identical(other.tree, tree) ||
                const DeepCollectionEquality().equals(other.tree, tree)) &&
            (identical(other.current, current) ||
                const DeepCollectionEquality().equals(other.current, current)));
  }

  @override
  int get hashCode => runtimeType.hashCode ^ tree.hashCode ^ current.hashCode;

  @override
  _$_Feed copyWith({
    Object tree = freezed,
    Object current = freezed,
  }) {
    return _$_Feed(
      tree: tree == freezed ? this.tree : tree as QTree,
      current: current == freezed ? this.current : current as int,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$_FeedToJson(this);
  }
}

abstract class _Feed implements Feed {
  const factory _Feed({QTree tree, int current}) = _$_Feed;

  factory _Feed.fromJson(Map<String, dynamic> json) = _$_Feed.fromJson;

  @override
  QTree get tree;
  @override
  int get current;

  @override
  _Feed copyWith({QTree tree, int current});
}
