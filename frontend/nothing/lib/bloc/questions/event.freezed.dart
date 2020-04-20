// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

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

// ignore: unused_element
const $QuestionsEvent = _$QuestionsEventTearOff();

mixin _$QuestionsEvent {
  int get currentid;

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

  $QuestionsEventCopyWith<QuestionsEvent> get copyWith;
}

abstract class $QuestionsEventCopyWith<$Res> {
  factory $QuestionsEventCopyWith(
          QuestionsEvent value, $Res Function(QuestionsEvent) then) =
      _$QuestionsEventCopyWithImpl<$Res>;
  $Res call({int currentid});
}

class _$QuestionsEventCopyWithImpl<$Res>
    implements $QuestionsEventCopyWith<$Res> {
  _$QuestionsEventCopyWithImpl(this._value, this._then);

  final QuestionsEvent _value;
  // ignore: unused_field
  final $Res Function(QuestionsEvent) _then;

  @override
  $Res call({
    Object currentid = freezed,
  }) {
    return _then(_value.copyWith(
      currentid: currentid == freezed ? _value.currentid : currentid as int,
    ));
  }
}

abstract class $FetchCopyWith<$Res> implements $QuestionsEventCopyWith<$Res> {
  factory $FetchCopyWith(Fetch value, $Res Function(Fetch) then) =
      _$FetchCopyWithImpl<$Res>;
  @override
  $Res call({int currentid});
}

class _$FetchCopyWithImpl<$Res> extends _$QuestionsEventCopyWithImpl<$Res>
    implements $FetchCopyWith<$Res> {
  _$FetchCopyWithImpl(Fetch _value, $Res Function(Fetch) _then)
      : super(_value, (v) => _then(v as Fetch));

  @override
  Fetch get _value => super._value as Fetch;

  @override
  $Res call({
    Object currentid = freezed,
  }) {
    return _then(Fetch(
      currentid == freezed ? _value.currentid : currentid as int,
    ));
  }
}

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
  $FetchCopyWith<Fetch> get copyWith =>
      _$FetchCopyWithImpl<Fetch>(this, _$identity);

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
  $FetchCopyWith<Fetch> get copyWith;
}

abstract class $RefetchCopyWith<$Res> implements $QuestionsEventCopyWith<$Res> {
  factory $RefetchCopyWith(Refetch value, $Res Function(Refetch) then) =
      _$RefetchCopyWithImpl<$Res>;
  @override
  $Res call({int currentid});
}

class _$RefetchCopyWithImpl<$Res> extends _$QuestionsEventCopyWithImpl<$Res>
    implements $RefetchCopyWith<$Res> {
  _$RefetchCopyWithImpl(Refetch _value, $Res Function(Refetch) _then)
      : super(_value, (v) => _then(v as Refetch));

  @override
  Refetch get _value => super._value as Refetch;

  @override
  $Res call({
    Object currentid = freezed,
  }) {
    return _then(Refetch(
      currentid == freezed ? _value.currentid : currentid as int,
    ));
  }
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
  $RefetchCopyWith<Refetch> get copyWith =>
      _$RefetchCopyWithImpl<Refetch>(this, _$identity);

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
  $RefetchCopyWith<Refetch> get copyWith;
}
