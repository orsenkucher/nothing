// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
FeedState _$FeedStateFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType'] as String) {
    case 'available':
      return _Available.fromJson(json);
    case 'empty':
      return _Empty.fromJson(json);

    default:
      throw FallThroughError();
  }
}

class _$FeedStateTearOff {
  const _$FeedStateTearOff();

  _Available available({@required @JsonKey(toJson: _toT) QTree tree}) {
    return _Available(
      tree: tree,
    );
  }

  _Empty empty() {
    return const _Empty();
  }
}

// ignore: unused_element
const $FeedState = _$FeedStateTearOff();

mixin _$FeedState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result available(@JsonKey(toJson: _toT) QTree tree),
    @required Result empty(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result available(@JsonKey(toJson: _toT) QTree tree),
    Result empty(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result available(_Available value),
    @required Result empty(_Empty value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result available(_Available value),
    Result empty(_Empty value),
    @required Result orElse(),
  });
  Map<String, dynamic> toJson();
}

abstract class $FeedStateCopyWith<$Res> {
  factory $FeedStateCopyWith(FeedState value, $Res Function(FeedState) then) =
      _$FeedStateCopyWithImpl<$Res>;
}

class _$FeedStateCopyWithImpl<$Res> implements $FeedStateCopyWith<$Res> {
  _$FeedStateCopyWithImpl(this._value, this._then);

  final FeedState _value;
  // ignore: unused_field
  final $Res Function(FeedState) _then;
}

abstract class _$AvailableCopyWith<$Res> {
  factory _$AvailableCopyWith(
          _Available value, $Res Function(_Available) then) =
      __$AvailableCopyWithImpl<$Res>;
  $Res call({@JsonKey(toJson: _toT) QTree tree});

  $QTreeCopyWith<$Res> get tree;
}

class __$AvailableCopyWithImpl<$Res> extends _$FeedStateCopyWithImpl<$Res>
    implements _$AvailableCopyWith<$Res> {
  __$AvailableCopyWithImpl(_Available _value, $Res Function(_Available) _then)
      : super(_value, (v) => _then(v as _Available));

  @override
  _Available get _value => super._value as _Available;

  @override
  $Res call({
    Object tree = freezed,
  }) {
    return _then(_Available(
      tree: tree == freezed ? _value.tree : tree as QTree,
    ));
  }

  @override
  $QTreeCopyWith<$Res> get tree {
    if (_value.tree == null) {
      return null;
    }
    return $QTreeCopyWith<$Res>(_value.tree, (value) {
      return _then(_value.copyWith(tree: value));
    });
  }
}

@JsonSerializable()
class _$_Available with DiagnosticableTreeMixin implements _Available {
  const _$_Available({@required @JsonKey(toJson: _toT) this.tree})
      : assert(tree != null);

  factory _$_Available.fromJson(Map<String, dynamic> json) =>
      _$_$_AvailableFromJson(json);

  @override
  @JsonKey(toJson: _toT)
  final QTree tree;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FeedState.available(tree: $tree)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FeedState.available'))
      ..add(DiagnosticsProperty('tree', tree));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Available &&
            (identical(other.tree, tree) ||
                const DeepCollectionEquality().equals(other.tree, tree)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(tree);

  @override
  _$AvailableCopyWith<_Available> get copyWith =>
      __$AvailableCopyWithImpl<_Available>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result available(@JsonKey(toJson: _toT) QTree tree),
    @required Result empty(),
  }) {
    assert(available != null);
    assert(empty != null);
    return available(tree);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result available(@JsonKey(toJson: _toT) QTree tree),
    Result empty(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (available != null) {
      return available(tree);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result available(_Available value),
    @required Result empty(_Empty value),
  }) {
    assert(available != null);
    assert(empty != null);
    return available(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result available(_Available value),
    Result empty(_Empty value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (available != null) {
      return available(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$_AvailableToJson(this)..['runtimeType'] = 'available';
  }
}

abstract class _Available implements FeedState {
  const factory _Available({@required @JsonKey(toJson: _toT) QTree tree}) =
      _$_Available;

  factory _Available.fromJson(Map<String, dynamic> json) =
      _$_Available.fromJson;

  @JsonKey(toJson: _toT)
  QTree get tree;
  _$AvailableCopyWith<_Available> get copyWith;
}

abstract class _$EmptyCopyWith<$Res> {
  factory _$EmptyCopyWith(_Empty value, $Res Function(_Empty) then) =
      __$EmptyCopyWithImpl<$Res>;
}

class __$EmptyCopyWithImpl<$Res> extends _$FeedStateCopyWithImpl<$Res>
    implements _$EmptyCopyWith<$Res> {
  __$EmptyCopyWithImpl(_Empty _value, $Res Function(_Empty) _then)
      : super(_value, (v) => _then(v as _Empty));

  @override
  _Empty get _value => super._value as _Empty;
}

@JsonSerializable()
class _$_Empty with DiagnosticableTreeMixin implements _Empty {
  const _$_Empty();

  factory _$_Empty.fromJson(Map<String, dynamic> json) =>
      _$_$_EmptyFromJson(json);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FeedState.empty()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'FeedState.empty'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Empty);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result available(@JsonKey(toJson: _toT) QTree tree),
    @required Result empty(),
  }) {
    assert(available != null);
    assert(empty != null);
    return empty();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result available(@JsonKey(toJson: _toT) QTree tree),
    Result empty(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (empty != null) {
      return empty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result available(_Available value),
    @required Result empty(_Empty value),
  }) {
    assert(available != null);
    assert(empty != null);
    return empty(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result available(_Available value),
    Result empty(_Empty value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$_EmptyToJson(this)..['runtimeType'] = 'empty';
  }
}

abstract class _Empty implements FeedState {
  const factory _Empty() = _$_Empty;

  factory _Empty.fromJson(Map<String, dynamic> json) = _$_Empty.fromJson;
}
