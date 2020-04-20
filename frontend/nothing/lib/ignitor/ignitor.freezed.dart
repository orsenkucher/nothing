// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'ignitor.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$IgnitableTearOff {
  const _$IgnitableTearOff();

  Ignited<S> ignited<S>(S payload) {
    return Ignited<S>(
      payload,
    );
  }

  Pending<S> pending<S>(S payload) {
    return Pending<S>(
      payload,
    );
  }
}

// ignore: unused_element
const $Ignitable = _$IgnitableTearOff();

mixin _$Ignitable<S> {
  S get payload;

  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result ignited(S payload),
    @required Result pending(S payload),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result ignited(S payload),
    Result pending(S payload),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result ignited(Ignited<S> value),
    @required Result pending(Pending<S> value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result ignited(Ignited<S> value),
    Result pending(Pending<S> value),
    @required Result orElse(),
  });

  $IgnitableCopyWith<S, Ignitable<S>> get copyWith;
}

abstract class $IgnitableCopyWith<S, $Res> {
  factory $IgnitableCopyWith(
          Ignitable<S> value, $Res Function(Ignitable<S>) then) =
      _$IgnitableCopyWithImpl<S, $Res>;
  $Res call({S payload});
}

class _$IgnitableCopyWithImpl<S, $Res> implements $IgnitableCopyWith<S, $Res> {
  _$IgnitableCopyWithImpl(this._value, this._then);

  final Ignitable<S> _value;
  // ignore: unused_field
  final $Res Function(Ignitable<S>) _then;

  @override
  $Res call({
    Object payload = freezed,
  }) {
    return _then(_value.copyWith(
      payload: payload == freezed ? _value.payload : payload as S,
    ));
  }
}

abstract class $IgnitedCopyWith<S, $Res>
    implements $IgnitableCopyWith<S, $Res> {
  factory $IgnitedCopyWith(Ignited<S> value, $Res Function(Ignited<S>) then) =
      _$IgnitedCopyWithImpl<S, $Res>;
  @override
  $Res call({S payload});
}

class _$IgnitedCopyWithImpl<S, $Res> extends _$IgnitableCopyWithImpl<S, $Res>
    implements $IgnitedCopyWith<S, $Res> {
  _$IgnitedCopyWithImpl(Ignited<S> _value, $Res Function(Ignited<S>) _then)
      : super(_value, (v) => _then(v as Ignited<S>));

  @override
  Ignited<S> get _value => super._value as Ignited<S>;

  @override
  $Res call({
    Object payload = freezed,
  }) {
    return _then(Ignited<S>(
      payload == freezed ? _value.payload : payload as S,
    ));
  }
}

class _$Ignited<S> with DiagnosticableTreeMixin implements Ignited<S> {
  _$Ignited(this.payload) : assert(payload != null);

  @override
  final S payload;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Ignitable<$S>.ignited(payload: $payload)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Ignitable<$S>.ignited'))
      ..add(DiagnosticsProperty('payload', payload));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Ignited<S> &&
            (identical(other.payload, payload) ||
                const DeepCollectionEquality().equals(other.payload, payload)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(payload);

  @override
  $IgnitedCopyWith<S, Ignited<S>> get copyWith =>
      _$IgnitedCopyWithImpl<S, Ignited<S>>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result ignited(S payload),
    @required Result pending(S payload),
  }) {
    assert(ignited != null);
    assert(pending != null);
    return ignited(payload);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result ignited(S payload),
    Result pending(S payload),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (ignited != null) {
      return ignited(payload);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result ignited(Ignited<S> value),
    @required Result pending(Pending<S> value),
  }) {
    assert(ignited != null);
    assert(pending != null);
    return ignited(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result ignited(Ignited<S> value),
    Result pending(Pending<S> value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (ignited != null) {
      return ignited(this);
    }
    return orElse();
  }
}

abstract class Ignited<S> implements Ignitable<S> {
  factory Ignited(S payload) = _$Ignited<S>;

  @override
  S get payload;
  @override
  $IgnitedCopyWith<S, Ignited<S>> get copyWith;
}

abstract class $PendingCopyWith<S, $Res>
    implements $IgnitableCopyWith<S, $Res> {
  factory $PendingCopyWith(Pending<S> value, $Res Function(Pending<S>) then) =
      _$PendingCopyWithImpl<S, $Res>;
  @override
  $Res call({S payload});
}

class _$PendingCopyWithImpl<S, $Res> extends _$IgnitableCopyWithImpl<S, $Res>
    implements $PendingCopyWith<S, $Res> {
  _$PendingCopyWithImpl(Pending<S> _value, $Res Function(Pending<S>) _then)
      : super(_value, (v) => _then(v as Pending<S>));

  @override
  Pending<S> get _value => super._value as Pending<S>;

  @override
  $Res call({
    Object payload = freezed,
  }) {
    return _then(Pending<S>(
      payload == freezed ? _value.payload : payload as S,
    ));
  }
}

class _$Pending<S> with DiagnosticableTreeMixin implements Pending<S> {
  _$Pending(this.payload) : assert(payload != null);

  @override
  final S payload;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Ignitable<$S>.pending(payload: $payload)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Ignitable<$S>.pending'))
      ..add(DiagnosticsProperty('payload', payload));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Pending<S> &&
            (identical(other.payload, payload) ||
                const DeepCollectionEquality().equals(other.payload, payload)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(payload);

  @override
  $PendingCopyWith<S, Pending<S>> get copyWith =>
      _$PendingCopyWithImpl<S, Pending<S>>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result ignited(S payload),
    @required Result pending(S payload),
  }) {
    assert(ignited != null);
    assert(pending != null);
    return pending(payload);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result ignited(S payload),
    Result pending(S payload),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (pending != null) {
      return pending(payload);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result ignited(Ignited<S> value),
    @required Result pending(Pending<S> value),
  }) {
    assert(ignited != null);
    assert(pending != null);
    return pending(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result ignited(Ignited<S> value),
    Result pending(Pending<S> value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (pending != null) {
      return pending(this);
    }
    return orElse();
  }
}

abstract class Pending<S> implements Ignitable<S> {
  factory Pending(S payload) = _$Pending<S>;

  @override
  S get payload;
  @override
  $PendingCopyWith<S, Pending<S>> get copyWith;
}
