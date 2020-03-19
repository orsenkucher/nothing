// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$FeedEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result ignite(QTree tree),
    @required Result newArrived(QTree tree),
    @required Result moveNext(MoveDir dir),
  });

  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result ignite(QTree tree),
    Result newArrived(QTree tree),
    Result moveNext(MoveDir dir),
    @required Result orElse(),
  });

  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result ignite(Ignite value),
    @required Result newArrived(NewArrived value),
    @required Result moveNext(MoveNext value),
  });

  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result ignite(Ignite value),
    Result newArrived(NewArrived value),
    Result moveNext(MoveNext value),
    @required Result orElse(),
  });
}

class _$FeedEventTearOff {
  const _$FeedEventTearOff();

  Ignite ignite(QTree tree) {
    return Ignite(
      tree,
    );
  }

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

const $FeedEvent = _$FeedEventTearOff();

class _$Ignite with DiagnosticableTreeMixin implements Ignite {
  const _$Ignite(this.tree) : assert(tree != null);

  @override
  final QTree tree;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FeedEvent.ignite(tree: $tree)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FeedEvent.ignite'))
      ..add(DiagnosticsProperty('tree', tree));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Ignite &&
            (identical(other.tree, tree) ||
                const DeepCollectionEquality().equals(other.tree, tree)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(tree);

  @override
  _$Ignite copyWith({
    Object tree = freezed,
  }) {
    return _$Ignite(
      tree == freezed ? this.tree : tree as QTree,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result ignite(QTree tree),
    @required Result newArrived(QTree tree),
    @required Result moveNext(MoveDir dir),
  }) {
    assert(ignite != null);
    assert(newArrived != null);
    assert(moveNext != null);
    return ignite(tree);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result ignite(QTree tree),
    Result newArrived(QTree tree),
    Result moveNext(MoveDir dir),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (ignite != null) {
      return ignite(tree);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result ignite(Ignite value),
    @required Result newArrived(NewArrived value),
    @required Result moveNext(MoveNext value),
  }) {
    assert(ignite != null);
    assert(newArrived != null);
    assert(moveNext != null);
    return ignite(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result ignite(Ignite value),
    Result newArrived(NewArrived value),
    Result moveNext(MoveNext value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (ignite != null) {
      return ignite(this);
    }
    return orElse();
  }
}

abstract class Ignite implements FeedEvent {
  const factory Ignite(QTree tree) = _$Ignite;

  QTree get tree;

  Ignite copyWith({QTree tree});
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
  _$NewArrived copyWith({
    Object tree = freezed,
  }) {
    return _$NewArrived(
      tree == freezed ? this.tree : tree as QTree,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result ignite(QTree tree),
    @required Result newArrived(QTree tree),
    @required Result moveNext(MoveDir dir),
  }) {
    assert(ignite != null);
    assert(newArrived != null);
    assert(moveNext != null);
    return newArrived(tree);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result ignite(QTree tree),
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
    @required Result ignite(Ignite value),
    @required Result newArrived(NewArrived value),
    @required Result moveNext(MoveNext value),
  }) {
    assert(ignite != null);
    assert(newArrived != null);
    assert(moveNext != null);
    return newArrived(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result ignite(Ignite value),
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

  NewArrived copyWith({QTree tree});
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
  _$MoveNext copyWith({
    Object dir = freezed,
  }) {
    return _$MoveNext(
      dir == freezed ? this.dir : dir as MoveDir,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result ignite(QTree tree),
    @required Result newArrived(QTree tree),
    @required Result moveNext(MoveDir dir),
  }) {
    assert(ignite != null);
    assert(newArrived != null);
    assert(moveNext != null);
    return moveNext(dir);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result ignite(QTree tree),
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
    @required Result ignite(Ignite value),
    @required Result newArrived(NewArrived value),
    @required Result moveNext(MoveNext value),
  }) {
    assert(ignite != null);
    assert(newArrived != null);
    assert(moveNext != null);
    return moveNext(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result ignite(Ignite value),
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

  MoveNext copyWith({MoveDir dir});
}

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

class _$MoveDirTearOff {
  const _$MoveDirTearOff();

  _Left left() {
    return const _Left();
  }

  _Right right() {
    return const _Right();
  }
}

const $MoveDir = _$MoveDirTearOff();

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
