// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$QuestionsEvent {
  int get currentid;

  QuestionsEvent copyWith({int currentid});

  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result fetch(int currentid),
    @required Result refetch(int currentid),
  });

  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result fetch(int currentid),
    Result refetch(int currentid),
    @required Result orElse(),
  });

  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result fetch(Fetch value),
    @required Result refetch(Refetch value),
  });

  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result fetch(Fetch value),
    Result refetch(Refetch value),
    @required Result orElse(),
  });
}

class _$QuestionsEventTearOff {
  const _$QuestionsEventTearOff();

  Fetch fetch([int currentid]) {
    return Fetch(
      currentid,
    );
  }

  Refetch refetch(int currentid) {
    return Refetch(
      currentid,
    );
  }
}

const $QuestionsEvent = _$QuestionsEventTearOff();

class _$Fetch with DiagnosticableTreeMixin implements Fetch {
  const _$Fetch([this.currentid]);

  @override
  final int currentid;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'QuestionsEvent.fetch(currentid: $currentid)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'QuestionsEvent.fetch'))
      ..add(DiagnosticsProperty('currentid', currentid));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Fetch &&
            (identical(other.currentid, currentid) ||
                const DeepCollectionEquality()
                    .equals(other.currentid, currentid)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(currentid);

  @override
  _$Fetch copyWith({
    Object currentid = freezed,
  }) {
    return _$Fetch(
      currentid == freezed ? this.currentid : currentid as int,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result fetch(int currentid),
    @required Result refetch(int currentid),
  }) {
    assert(fetch != null);
    assert(refetch != null);
    return fetch(currentid);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result fetch(int currentid),
    Result refetch(int currentid),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (fetch != null) {
      return fetch(currentid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result fetch(Fetch value),
    @required Result refetch(Refetch value),
  }) {
    assert(fetch != null);
    assert(refetch != null);
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result fetch(Fetch value),
    Result refetch(Refetch value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class Fetch implements QuestionsEvent {
  const factory Fetch([int currentid]) = _$Fetch;

  @override
  int get currentid;

  @override
  Fetch copyWith({int currentid});
}

class _$Refetch with DiagnosticableTreeMixin implements Refetch {
  const _$Refetch(this.currentid) : assert(currentid != null);

  @override
  final int currentid;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'QuestionsEvent.refetch(currentid: $currentid)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'QuestionsEvent.refetch'))
      ..add(DiagnosticsProperty('currentid', currentid));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Refetch &&
            (identical(other.currentid, currentid) ||
                const DeepCollectionEquality()
                    .equals(other.currentid, currentid)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(currentid);

  @override
  _$Refetch copyWith({
    Object currentid = freezed,
  }) {
    return _$Refetch(
      currentid == freezed ? this.currentid : currentid as int,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result fetch(int currentid),
    @required Result refetch(int currentid),
  }) {
    assert(fetch != null);
    assert(refetch != null);
    return refetch(currentid);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result fetch(int currentid),
    Result refetch(int currentid),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (refetch != null) {
      return refetch(currentid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result fetch(Fetch value),
    @required Result refetch(Refetch value),
  }) {
    assert(fetch != null);
    assert(refetch != null);
    return refetch(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result fetch(Fetch value),
    Result refetch(Refetch value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (refetch != null) {
      return refetch(this);
    }
    return orElse();
  }
}

abstract class Refetch implements QuestionsEvent {
  const factory Refetch(int currentid) = _$Refetch;

  @override
  int get currentid;

  @override
  Refetch copyWith({int currentid});
}
