// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$FeedEventTearOff {
  const _$FeedEventTearOff();

// ignore: unused_element
  NewArrived newArrived(QTree tree, [bool forced = false]) {
    return NewArrived(
      tree,
      forced,
    );
  }

// ignore: unused_element
  MoveNext moveNext(MoveDir dir) {
    return MoveNext(
      dir,
    );
  }

// ignore: unused_element
  Ground ground() {
    return const Ground();
  }
}

/// @nodoc
// ignore: unused_element
const $FeedEvent = _$FeedEventTearOff();

/// @nodoc
mixin _$FeedEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult newArrived(QTree tree, bool forced),
    @required TResult moveNext(MoveDir dir),
    @required TResult ground(),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult newArrived(QTree tree, bool forced),
    TResult moveNext(MoveDir dir),
    TResult ground(),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult newArrived(NewArrived value),
    @required TResult moveNext(MoveNext value),
    @required TResult ground(Ground value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult newArrived(NewArrived value),
    TResult moveNext(MoveNext value),
    TResult ground(Ground value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $FeedEventCopyWith<$Res> {
  factory $FeedEventCopyWith(FeedEvent value, $Res Function(FeedEvent) then) =
      _$FeedEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$FeedEventCopyWithImpl<$Res> implements $FeedEventCopyWith<$Res> {
  _$FeedEventCopyWithImpl(this._value, this._then);

  final FeedEvent _value;
  // ignore: unused_field
  final $Res Function(FeedEvent) _then;
}

/// @nodoc
abstract class $NewArrivedCopyWith<$Res> {
  factory $NewArrivedCopyWith(
          NewArrived value, $Res Function(NewArrived) then) =
      _$NewArrivedCopyWithImpl<$Res>;
  $Res call({QTree tree, bool forced});

  $QTreeCopyWith<$Res> get tree;
}

/// @nodoc
class _$NewArrivedCopyWithImpl<$Res> extends _$FeedEventCopyWithImpl<$Res>
    implements $NewArrivedCopyWith<$Res> {
  _$NewArrivedCopyWithImpl(NewArrived _value, $Res Function(NewArrived) _then)
      : super(_value, (v) => _then(v as NewArrived));

  @override
  NewArrived get _value => super._value as NewArrived;

  @override
  $Res call({
    Object tree = freezed,
    Object forced = freezed,
  }) {
    return _then(NewArrived(
      tree == freezed ? _value.tree : tree as QTree,
      forced == freezed ? _value.forced : forced as bool,
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

/// @nodoc
class _$NewArrived with DiagnosticableTreeMixin implements NewArrived {
  const _$NewArrived(this.tree, [this.forced = false])
      : assert(tree != null),
        assert(forced != null);

  @override
  final QTree tree;
  @JsonKey(defaultValue: false)
  @override
  final bool forced;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FeedEvent.newArrived(tree: $tree, forced: $forced)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FeedEvent.newArrived'))
      ..add(DiagnosticsProperty('tree', tree))
      ..add(DiagnosticsProperty('forced', forced));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is NewArrived &&
            (identical(other.tree, tree) ||
                const DeepCollectionEquality().equals(other.tree, tree)) &&
            (identical(other.forced, forced) ||
                const DeepCollectionEquality().equals(other.forced, forced)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(tree) ^
      const DeepCollectionEquality().hash(forced);

  @override
  $NewArrivedCopyWith<NewArrived> get copyWith =>
      _$NewArrivedCopyWithImpl<NewArrived>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult newArrived(QTree tree, bool forced),
    @required TResult moveNext(MoveDir dir),
    @required TResult ground(),
  }) {
    assert(newArrived != null);
    assert(moveNext != null);
    assert(ground != null);
    return newArrived(tree, forced);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult newArrived(QTree tree, bool forced),
    TResult moveNext(MoveDir dir),
    TResult ground(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (newArrived != null) {
      return newArrived(tree, forced);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult newArrived(NewArrived value),
    @required TResult moveNext(MoveNext value),
    @required TResult ground(Ground value),
  }) {
    assert(newArrived != null);
    assert(moveNext != null);
    assert(ground != null);
    return newArrived(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult newArrived(NewArrived value),
    TResult moveNext(MoveNext value),
    TResult ground(Ground value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (newArrived != null) {
      return newArrived(this);
    }
    return orElse();
  }
}

abstract class NewArrived implements FeedEvent {
  const factory NewArrived(QTree tree, [bool forced]) = _$NewArrived;

  QTree get tree;
  bool get forced;
  $NewArrivedCopyWith<NewArrived> get copyWith;
}

/// @nodoc
abstract class $MoveNextCopyWith<$Res> {
  factory $MoveNextCopyWith(MoveNext value, $Res Function(MoveNext) then) =
      _$MoveNextCopyWithImpl<$Res>;
  $Res call({MoveDir dir});

  $MoveDirCopyWith<$Res> get dir;
}

/// @nodoc
class _$MoveNextCopyWithImpl<$Res> extends _$FeedEventCopyWithImpl<$Res>
    implements $MoveNextCopyWith<$Res> {
  _$MoveNextCopyWithImpl(MoveNext _value, $Res Function(MoveNext) _then)
      : super(_value, (v) => _then(v as MoveNext));

  @override
  MoveNext get _value => super._value as MoveNext;

  @override
  $Res call({
    Object dir = freezed,
  }) {
    return _then(MoveNext(
      dir == freezed ? _value.dir : dir as MoveDir,
    ));
  }

  @override
  $MoveDirCopyWith<$Res> get dir {
    if (_value.dir == null) {
      return null;
    }
    return $MoveDirCopyWith<$Res>(_value.dir, (value) {
      return _then(_value.copyWith(dir: value));
    });
  }
}

/// @nodoc
class _$MoveNext with DiagnosticableTreeMixin implements MoveNext {
  const _$MoveNext(this.dir) : assert(dir != null);

  @override
  final MoveDir dir;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FeedEvent.moveNext(dir: $dir)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FeedEvent.moveNext'))
      ..add(DiagnosticsProperty('dir', dir));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is MoveNext &&
            (identical(other.dir, dir) ||
                const DeepCollectionEquality().equals(other.dir, dir)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(dir);

  @override
  $MoveNextCopyWith<MoveNext> get copyWith =>
      _$MoveNextCopyWithImpl<MoveNext>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult newArrived(QTree tree, bool forced),
    @required TResult moveNext(MoveDir dir),
    @required TResult ground(),
  }) {
    assert(newArrived != null);
    assert(moveNext != null);
    assert(ground != null);
    return moveNext(dir);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult newArrived(QTree tree, bool forced),
    TResult moveNext(MoveDir dir),
    TResult ground(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (moveNext != null) {
      return moveNext(dir);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult newArrived(NewArrived value),
    @required TResult moveNext(MoveNext value),
    @required TResult ground(Ground value),
  }) {
    assert(newArrived != null);
    assert(moveNext != null);
    assert(ground != null);
    return moveNext(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult newArrived(NewArrived value),
    TResult moveNext(MoveNext value),
    TResult ground(Ground value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (moveNext != null) {
      return moveNext(this);
    }
    return orElse();
  }
}

abstract class MoveNext implements FeedEvent {
  const factory MoveNext(MoveDir dir) = _$MoveNext;

  MoveDir get dir;
  $MoveNextCopyWith<MoveNext> get copyWith;
}

/// @nodoc
abstract class $GroundCopyWith<$Res> {
  factory $GroundCopyWith(Ground value, $Res Function(Ground) then) =
      _$GroundCopyWithImpl<$Res>;
}

/// @nodoc
class _$GroundCopyWithImpl<$Res> extends _$FeedEventCopyWithImpl<$Res>
    implements $GroundCopyWith<$Res> {
  _$GroundCopyWithImpl(Ground _value, $Res Function(Ground) _then)
      : super(_value, (v) => _then(v as Ground));

  @override
  Ground get _value => super._value as Ground;
}

/// @nodoc
class _$Ground with DiagnosticableTreeMixin implements Ground {
  const _$Ground();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FeedEvent.ground()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'FeedEvent.ground'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Ground);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult newArrived(QTree tree, bool forced),
    @required TResult moveNext(MoveDir dir),
    @required TResult ground(),
  }) {
    assert(newArrived != null);
    assert(moveNext != null);
    assert(ground != null);
    return ground();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult newArrived(QTree tree, bool forced),
    TResult moveNext(MoveDir dir),
    TResult ground(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (ground != null) {
      return ground();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult newArrived(NewArrived value),
    @required TResult moveNext(MoveNext value),
    @required TResult ground(Ground value),
  }) {
    assert(newArrived != null);
    assert(moveNext != null);
    assert(ground != null);
    return ground(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult newArrived(NewArrived value),
    TResult moveNext(MoveNext value),
    TResult ground(Ground value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (ground != null) {
      return ground(this);
    }
    return orElse();
  }
}

abstract class Ground implements FeedEvent {
  const factory Ground() = _$Ground;
}

/// @nodoc
class _$MoveDirTearOff {
  const _$MoveDirTearOff();

// ignore: unused_element
  _Left left() {
    return const _Left();
  }

// ignore: unused_element
  _Right right() {
    return const _Right();
  }
}

/// @nodoc
// ignore: unused_element
const $MoveDir = _$MoveDirTearOff();

/// @nodoc
mixin _$MoveDir {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult left(),
    @required TResult right(),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult left(),
    TResult right(),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult left(_Left value),
    @required TResult right(_Right value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult left(_Left value),
    TResult right(_Right value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $MoveDirCopyWith<$Res> {
  factory $MoveDirCopyWith(MoveDir value, $Res Function(MoveDir) then) =
      _$MoveDirCopyWithImpl<$Res>;
}

/// @nodoc
class _$MoveDirCopyWithImpl<$Res> implements $MoveDirCopyWith<$Res> {
  _$MoveDirCopyWithImpl(this._value, this._then);

  final MoveDir _value;
  // ignore: unused_field
  final $Res Function(MoveDir) _then;
}

/// @nodoc
abstract class _$LeftCopyWith<$Res> {
  factory _$LeftCopyWith(_Left value, $Res Function(_Left) then) =
      __$LeftCopyWithImpl<$Res>;
}

/// @nodoc
class __$LeftCopyWithImpl<$Res> extends _$MoveDirCopyWithImpl<$Res>
    implements _$LeftCopyWith<$Res> {
  __$LeftCopyWithImpl(_Left _value, $Res Function(_Left) _then)
      : super(_value, (v) => _then(v as _Left));

  @override
  _Left get _value => super._value as _Left;
}

/// @nodoc
class _$_Left with DiagnosticableTreeMixin implements _Left {
  const _$_Left();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MoveDir.left()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'MoveDir.left'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Left);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult left(),
    @required TResult right(),
  }) {
    assert(left != null);
    assert(right != null);
    return left();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult left(),
    TResult right(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (left != null) {
      return left();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult left(_Left value),
    @required TResult right(_Right value),
  }) {
    assert(left != null);
    assert(right != null);
    return left(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult left(_Left value),
    TResult right(_Right value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (left != null) {
      return left(this);
    }
    return orElse();
  }
}

abstract class _Left implements MoveDir {
  const factory _Left() = _$_Left;
}

/// @nodoc
abstract class _$RightCopyWith<$Res> {
  factory _$RightCopyWith(_Right value, $Res Function(_Right) then) =
      __$RightCopyWithImpl<$Res>;
}

/// @nodoc
class __$RightCopyWithImpl<$Res> extends _$MoveDirCopyWithImpl<$Res>
    implements _$RightCopyWith<$Res> {
  __$RightCopyWithImpl(_Right _value, $Res Function(_Right) _then)
      : super(_value, (v) => _then(v as _Right));

  @override
  _Right get _value => super._value as _Right;
}

/// @nodoc
class _$_Right with DiagnosticableTreeMixin implements _Right {
  const _$_Right();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MoveDir.right()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'MoveDir.right'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Right);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult left(),
    @required TResult right(),
  }) {
    assert(left != null);
    assert(right != null);
    return right();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult left(),
    TResult right(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (right != null) {
      return right();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult left(_Left value),
    @required TResult right(_Right value),
  }) {
    assert(left != null);
    assert(right != null);
    return right(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult left(_Left value),
    TResult right(_Right value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (right != null) {
      return right(this);
    }
    return orElse();
  }
}

abstract class _Right implements MoveDir {
  const factory _Right() = _$_Right;
}

FeedState _$FeedStateFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType'] as String) {
    case 'available':
      return Available.fromJson(json);
    case 'pending':
      return Pending.fromJson(json);
    case 'empty':
      return Empty.fromJson(json);

    default:
      throw FallThroughError();
  }
}

/// @nodoc
class _$FeedStateTearOff {
  const _$FeedStateTearOff();

// ignore: unused_element
  Available available({@required QTree tree}) {
    return Available(
      tree: tree,
    );
  }

// ignore: unused_element
  Pending pending({@required QTree oldTree, @required QTree newTree}) {
    return Pending(
      oldTree: oldTree,
      newTree: newTree,
    );
  }

// ignore: unused_element
  Empty empty([QTree oldTree]) {
    return Empty(
      oldTree,
    );
  }

// ignore: unused_element
  FeedState fromJson(Map<String, Object> json) {
    return FeedState.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $FeedState = _$FeedStateTearOff();

/// @nodoc
mixin _$FeedState {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult available(QTree tree),
    @required TResult pending(QTree oldTree, QTree newTree),
    @required TResult empty(QTree oldTree),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult available(QTree tree),
    TResult pending(QTree oldTree, QTree newTree),
    TResult empty(QTree oldTree),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult available(Available value),
    @required TResult pending(Pending value),
    @required TResult empty(Empty value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult available(Available value),
    TResult pending(Pending value),
    TResult empty(Empty value),
    @required TResult orElse(),
  });
  Map<String, dynamic> toJson();
}

/// @nodoc
abstract class $FeedStateCopyWith<$Res> {
  factory $FeedStateCopyWith(FeedState value, $Res Function(FeedState) then) =
      _$FeedStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$FeedStateCopyWithImpl<$Res> implements $FeedStateCopyWith<$Res> {
  _$FeedStateCopyWithImpl(this._value, this._then);

  final FeedState _value;
  // ignore: unused_field
  final $Res Function(FeedState) _then;
}

/// @nodoc
abstract class $AvailableCopyWith<$Res> {
  factory $AvailableCopyWith(Available value, $Res Function(Available) then) =
      _$AvailableCopyWithImpl<$Res>;
  $Res call({QTree tree});

  $QTreeCopyWith<$Res> get tree;
}

/// @nodoc
class _$AvailableCopyWithImpl<$Res> extends _$FeedStateCopyWithImpl<$Res>
    implements $AvailableCopyWith<$Res> {
  _$AvailableCopyWithImpl(Available _value, $Res Function(Available) _then)
      : super(_value, (v) => _then(v as Available));

  @override
  Available get _value => super._value as Available;

  @override
  $Res call({
    Object tree = freezed,
  }) {
    return _then(Available(
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

/// @nodoc
class _$Available with DiagnosticableTreeMixin implements Available {
  const _$Available({@required this.tree}) : assert(tree != null);

  factory _$Available.fromJson(Map<String, dynamic> json) =>
      _$_$AvailableFromJson(json);

  @override
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
        (other is Available &&
            (identical(other.tree, tree) ||
                const DeepCollectionEquality().equals(other.tree, tree)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(tree);

  @override
  $AvailableCopyWith<Available> get copyWith =>
      _$AvailableCopyWithImpl<Available>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult available(QTree tree),
    @required TResult pending(QTree oldTree, QTree newTree),
    @required TResult empty(QTree oldTree),
  }) {
    assert(available != null);
    assert(pending != null);
    assert(empty != null);
    return available(tree);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult available(QTree tree),
    TResult pending(QTree oldTree, QTree newTree),
    TResult empty(QTree oldTree),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (available != null) {
      return available(tree);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult available(Available value),
    @required TResult pending(Pending value),
    @required TResult empty(Empty value),
  }) {
    assert(available != null);
    assert(pending != null);
    assert(empty != null);
    return available(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult available(Available value),
    TResult pending(Pending value),
    TResult empty(Empty value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (available != null) {
      return available(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$AvailableToJson(this)..['runtimeType'] = 'available';
  }
}

abstract class Available implements FeedState {
  const factory Available({@required QTree tree}) = _$Available;

  factory Available.fromJson(Map<String, dynamic> json) = _$Available.fromJson;

  QTree get tree;
  $AvailableCopyWith<Available> get copyWith;
}

/// @nodoc
abstract class $PendingCopyWith<$Res> {
  factory $PendingCopyWith(Pending value, $Res Function(Pending) then) =
      _$PendingCopyWithImpl<$Res>;
  $Res call({QTree oldTree, QTree newTree});

  $QTreeCopyWith<$Res> get oldTree;
  $QTreeCopyWith<$Res> get newTree;
}

/// @nodoc
class _$PendingCopyWithImpl<$Res> extends _$FeedStateCopyWithImpl<$Res>
    implements $PendingCopyWith<$Res> {
  _$PendingCopyWithImpl(Pending _value, $Res Function(Pending) _then)
      : super(_value, (v) => _then(v as Pending));

  @override
  Pending get _value => super._value as Pending;

  @override
  $Res call({
    Object oldTree = freezed,
    Object newTree = freezed,
  }) {
    return _then(Pending(
      oldTree: oldTree == freezed ? _value.oldTree : oldTree as QTree,
      newTree: newTree == freezed ? _value.newTree : newTree as QTree,
    ));
  }

  @override
  $QTreeCopyWith<$Res> get oldTree {
    if (_value.oldTree == null) {
      return null;
    }
    return $QTreeCopyWith<$Res>(_value.oldTree, (value) {
      return _then(_value.copyWith(oldTree: value));
    });
  }

  @override
  $QTreeCopyWith<$Res> get newTree {
    if (_value.newTree == null) {
      return null;
    }
    return $QTreeCopyWith<$Res>(_value.newTree, (value) {
      return _then(_value.copyWith(newTree: value));
    });
  }
}

@JsonSerializable()

/// @nodoc
class _$Pending with DiagnosticableTreeMixin implements Pending {
  const _$Pending({@required this.oldTree, @required this.newTree})
      : assert(oldTree != null),
        assert(newTree != null);

  factory _$Pending.fromJson(Map<String, dynamic> json) =>
      _$_$PendingFromJson(json);

  @override
  final QTree oldTree;
  @override
  final QTree newTree;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FeedState.pending(oldTree: $oldTree, newTree: $newTree)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FeedState.pending'))
      ..add(DiagnosticsProperty('oldTree', oldTree))
      ..add(DiagnosticsProperty('newTree', newTree));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Pending &&
            (identical(other.oldTree, oldTree) ||
                const DeepCollectionEquality()
                    .equals(other.oldTree, oldTree)) &&
            (identical(other.newTree, newTree) ||
                const DeepCollectionEquality().equals(other.newTree, newTree)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(oldTree) ^
      const DeepCollectionEquality().hash(newTree);

  @override
  $PendingCopyWith<Pending> get copyWith =>
      _$PendingCopyWithImpl<Pending>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult available(QTree tree),
    @required TResult pending(QTree oldTree, QTree newTree),
    @required TResult empty(QTree oldTree),
  }) {
    assert(available != null);
    assert(pending != null);
    assert(empty != null);
    return pending(oldTree, newTree);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult available(QTree tree),
    TResult pending(QTree oldTree, QTree newTree),
    TResult empty(QTree oldTree),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (pending != null) {
      return pending(oldTree, newTree);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult available(Available value),
    @required TResult pending(Pending value),
    @required TResult empty(Empty value),
  }) {
    assert(available != null);
    assert(pending != null);
    assert(empty != null);
    return pending(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult available(Available value),
    TResult pending(Pending value),
    TResult empty(Empty value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (pending != null) {
      return pending(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$PendingToJson(this)..['runtimeType'] = 'pending';
  }
}

abstract class Pending implements FeedState {
  const factory Pending({@required QTree oldTree, @required QTree newTree}) =
      _$Pending;

  factory Pending.fromJson(Map<String, dynamic> json) = _$Pending.fromJson;

  QTree get oldTree;
  QTree get newTree;
  $PendingCopyWith<Pending> get copyWith;
}

/// @nodoc
abstract class $EmptyCopyWith<$Res> {
  factory $EmptyCopyWith(Empty value, $Res Function(Empty) then) =
      _$EmptyCopyWithImpl<$Res>;
  $Res call({QTree oldTree});

  $QTreeCopyWith<$Res> get oldTree;
}

/// @nodoc
class _$EmptyCopyWithImpl<$Res> extends _$FeedStateCopyWithImpl<$Res>
    implements $EmptyCopyWith<$Res> {
  _$EmptyCopyWithImpl(Empty _value, $Res Function(Empty) _then)
      : super(_value, (v) => _then(v as Empty));

  @override
  Empty get _value => super._value as Empty;

  @override
  $Res call({
    Object oldTree = freezed,
  }) {
    return _then(Empty(
      oldTree == freezed ? _value.oldTree : oldTree as QTree,
    ));
  }

  @override
  $QTreeCopyWith<$Res> get oldTree {
    if (_value.oldTree == null) {
      return null;
    }
    return $QTreeCopyWith<$Res>(_value.oldTree, (value) {
      return _then(_value.copyWith(oldTree: value));
    });
  }
}

@JsonSerializable()

/// @nodoc
class _$Empty with DiagnosticableTreeMixin implements Empty {
  const _$Empty([this.oldTree]);

  factory _$Empty.fromJson(Map<String, dynamic> json) =>
      _$_$EmptyFromJson(json);

  @override
  final QTree oldTree;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FeedState.empty(oldTree: $oldTree)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FeedState.empty'))
      ..add(DiagnosticsProperty('oldTree', oldTree));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Empty &&
            (identical(other.oldTree, oldTree) ||
                const DeepCollectionEquality().equals(other.oldTree, oldTree)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(oldTree);

  @override
  $EmptyCopyWith<Empty> get copyWith =>
      _$EmptyCopyWithImpl<Empty>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult available(QTree tree),
    @required TResult pending(QTree oldTree, QTree newTree),
    @required TResult empty(QTree oldTree),
  }) {
    assert(available != null);
    assert(pending != null);
    assert(empty != null);
    return empty(oldTree);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult available(QTree tree),
    TResult pending(QTree oldTree, QTree newTree),
    TResult empty(QTree oldTree),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (empty != null) {
      return empty(oldTree);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult available(Available value),
    @required TResult pending(Pending value),
    @required TResult empty(Empty value),
  }) {
    assert(available != null);
    assert(pending != null);
    assert(empty != null);
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult available(Available value),
    TResult pending(Pending value),
    TResult empty(Empty value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$EmptyToJson(this)..['runtimeType'] = 'empty';
  }
}

abstract class Empty implements FeedState {
  const factory Empty([QTree oldTree]) = _$Empty;

  factory Empty.fromJson(Map<String, dynamic> json) = _$Empty.fromJson;

  QTree get oldTree;
  $EmptyCopyWith<Empty> get copyWith;
}
