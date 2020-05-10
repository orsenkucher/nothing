// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$FeedEventTearOff {
  const _$FeedEventTearOff();

  NewArrived newArrived(QTree tree) {
    return NewArrived(
      tree,
    );
  }

  MoveNext moveNext(MoveDir dir) {
    return MoveNext(
      dir,
    );
  }
}

// ignore: unused_element
const $FeedEvent = _$FeedEventTearOff();

mixin _$FeedEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result newArrived(QTree tree),
    @required Result moveNext(MoveDir dir),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result newArrived(QTree tree),
    Result moveNext(MoveDir dir),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result newArrived(NewArrived value),
    @required Result moveNext(MoveNext value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result newArrived(NewArrived value),
    Result moveNext(MoveNext value),
    @required Result orElse(),
  });
}

abstract class $FeedEventCopyWith<$Res> {
  factory $FeedEventCopyWith(FeedEvent value, $Res Function(FeedEvent) then) =
      _$FeedEventCopyWithImpl<$Res>;
}

class _$FeedEventCopyWithImpl<$Res> implements $FeedEventCopyWith<$Res> {
  _$FeedEventCopyWithImpl(this._value, this._then);

  final FeedEvent _value;
  // ignore: unused_field
  final $Res Function(FeedEvent) _then;
}

abstract class $NewArrivedCopyWith<$Res> {
  factory $NewArrivedCopyWith(
          NewArrived value, $Res Function(NewArrived) then) =
      _$NewArrivedCopyWithImpl<$Res>;
  $Res call({QTree tree});

  $QTreeCopyWith<$Res> get tree;
}

class _$NewArrivedCopyWithImpl<$Res> extends _$FeedEventCopyWithImpl<$Res>
    implements $NewArrivedCopyWith<$Res> {
  _$NewArrivedCopyWithImpl(NewArrived _value, $Res Function(NewArrived) _then)
      : super(_value, (v) => _then(v as NewArrived));

  @override
  NewArrived get _value => super._value as NewArrived;

  @override
  $Res call({
    Object tree = freezed,
  }) {
    return _then(NewArrived(
      tree == freezed ? _value.tree : tree as QTree,
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

class _$NewArrived with DiagnosticableTreeMixin implements NewArrived {
  const _$NewArrived(this.tree) : assert(tree != null);

  @override
  final QTree tree;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FeedEvent.newArrived(tree: $tree)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FeedEvent.newArrived'))
      ..add(DiagnosticsProperty('tree', tree));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is NewArrived &&
            (identical(other.tree, tree) ||
                const DeepCollectionEquality().equals(other.tree, tree)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(tree);

  @override
  $NewArrivedCopyWith<NewArrived> get copyWith =>
      _$NewArrivedCopyWithImpl<NewArrived>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result newArrived(QTree tree),
    @required Result moveNext(MoveDir dir),
  }) {
    assert(newArrived != null);
    assert(moveNext != null);
    return newArrived(tree);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result newArrived(QTree tree),
    Result moveNext(MoveDir dir),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (newArrived != null) {
      return newArrived(tree);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result newArrived(NewArrived value),
    @required Result moveNext(MoveNext value),
  }) {
    assert(newArrived != null);
    assert(moveNext != null);
    return newArrived(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result newArrived(NewArrived value),
    Result moveNext(MoveNext value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (newArrived != null) {
      return newArrived(this);
    }
    return orElse();
  }
}

abstract class NewArrived implements FeedEvent {
  const factory NewArrived(QTree tree) = _$NewArrived;

  QTree get tree;
  $NewArrivedCopyWith<NewArrived> get copyWith;
}

abstract class $MoveNextCopyWith<$Res> {
  factory $MoveNextCopyWith(MoveNext value, $Res Function(MoveNext) then) =
      _$MoveNextCopyWithImpl<$Res>;
  $Res call({MoveDir dir});

  $MoveDirCopyWith<$Res> get dir;
}

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
  Result when<Result extends Object>({
    @required Result newArrived(QTree tree),
    @required Result moveNext(MoveDir dir),
  }) {
    assert(newArrived != null);
    assert(moveNext != null);
    return moveNext(dir);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result newArrived(QTree tree),
    Result moveNext(MoveDir dir),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (moveNext != null) {
      return moveNext(dir);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result newArrived(NewArrived value),
    @required Result moveNext(MoveNext value),
  }) {
    assert(newArrived != null);
    assert(moveNext != null);
    return moveNext(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result newArrived(NewArrived value),
    Result moveNext(MoveNext value),
    @required Result orElse(),
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

class _$MoveDirTearOff {
  const _$MoveDirTearOff();

  _Left left() {
    return const _Left();
  }

  _Right right() {
    return const _Right();
  }
}

// ignore: unused_element
const $MoveDir = _$MoveDirTearOff();

mixin _$MoveDir {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result left(),
    @required Result right(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result left(),
    Result right(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result left(_Left value),
    @required Result right(_Right value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result left(_Left value),
    Result right(_Right value),
    @required Result orElse(),
  });
}

abstract class $MoveDirCopyWith<$Res> {
  factory $MoveDirCopyWith(MoveDir value, $Res Function(MoveDir) then) =
      _$MoveDirCopyWithImpl<$Res>;
}

class _$MoveDirCopyWithImpl<$Res> implements $MoveDirCopyWith<$Res> {
  _$MoveDirCopyWithImpl(this._value, this._then);

  final MoveDir _value;
  // ignore: unused_field
  final $Res Function(MoveDir) _then;
}

abstract class _$LeftCopyWith<$Res> {
  factory _$LeftCopyWith(_Left value, $Res Function(_Left) then) =
      __$LeftCopyWithImpl<$Res>;
}

class __$LeftCopyWithImpl<$Res> extends _$MoveDirCopyWithImpl<$Res>
    implements _$LeftCopyWith<$Res> {
  __$LeftCopyWithImpl(_Left _value, $Res Function(_Left) _then)
      : super(_value, (v) => _then(v as _Left));

  @override
  _Left get _value => super._value as _Left;
}

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
  Result when<Result extends Object>({
    @required Result left(),
    @required Result right(),
  }) {
    assert(left != null);
    assert(right != null);
    return left();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result left(),
    Result right(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (left != null) {
      return left();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result left(_Left value),
    @required Result right(_Right value),
  }) {
    assert(left != null);
    assert(right != null);
    return left(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result left(_Left value),
    Result right(_Right value),
    @required Result orElse(),
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

abstract class _$RightCopyWith<$Res> {
  factory _$RightCopyWith(_Right value, $Res Function(_Right) then) =
      __$RightCopyWithImpl<$Res>;
}

class __$RightCopyWithImpl<$Res> extends _$MoveDirCopyWithImpl<$Res>
    implements _$RightCopyWith<$Res> {
  __$RightCopyWithImpl(_Right _value, $Res Function(_Right) _then)
      : super(_value, (v) => _then(v as _Right));

  @override
  _Right get _value => super._value as _Right;
}

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
  Result when<Result extends Object>({
    @required Result left(),
    @required Result right(),
  }) {
    assert(left != null);
    assert(right != null);
    return right();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result left(),
    Result right(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (right != null) {
      return right();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result left(_Left value),
    @required Result right(_Right value),
  }) {
    assert(left != null);
    assert(right != null);
    return right(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result left(_Left value),
    Result right(_Right value),
    @required Result orElse(),
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
