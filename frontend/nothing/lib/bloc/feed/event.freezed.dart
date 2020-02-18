// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package

part of 'event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$FeedEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result newArrived(QTree tree),
    @required Result moveNext(),
  });

  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result newArrived(QTree tree),
    Result moveNext(),
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

class _$NewArrived with DiagnosticableTreeMixin implements NewArrived {
  const _$NewArrived(this.tree);

  @override
  final QTree tree;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.debug}) {
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
    return other is NewArrived &&
        (identical(other.tree, tree) || other.tree == tree);
  }

  @override
  int get hashCode => runtimeType.hashCode ^ tree.hashCode;

  @override
  _$NewArrived copyWith({
    Object tree = immutable,
  }) {
    return _$NewArrived(
      tree == immutable ? this.tree : tree as QTree,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result newArrived(QTree tree),
    @required Result moveNext(),
  }) {
    assert(newArrived != null);
    assert(moveNext != null);
    return newArrived(tree);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result newArrived(QTree tree),
    Result moveNext(),
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

  NewArrived copyWith({QTree tree});
}

class _$MoveNext with DiagnosticableTreeMixin implements MoveNext {
  const _$MoveNext();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.debug}) {
    return 'FeedEvent.moveNext()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'FeedEvent.moveNext'));
  }

  @override
  bool operator ==(dynamic other) {
    return other is MoveNext;
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result newArrived(QTree tree),
    @required Result moveNext(),
  }) {
    assert(newArrived != null);
    assert(moveNext != null);
    return moveNext();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result newArrived(QTree tree),
    Result moveNext(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (moveNext != null) {
      return moveNext();
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
  const factory MoveNext() = _$MoveNext;
}
