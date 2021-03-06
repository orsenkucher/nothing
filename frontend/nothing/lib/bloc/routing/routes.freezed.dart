// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'routes.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$RoutesTearOff {
  const _$RoutesTearOff();

// ignore: unused_element
  _Home home() {
    return const _Home();
  }

// ignore: unused_element
  _History history() {
    return const _History();
  }
}

/// @nodoc
// ignore: unused_element
const $Routes = _$RoutesTearOff();

/// @nodoc
mixin _$Routes {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult home(),
    @required TResult history(),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult home(),
    TResult history(),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult home(_Home value),
    @required TResult history(_History value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult home(_Home value),
    TResult history(_History value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $RoutesCopyWith<$Res> {
  factory $RoutesCopyWith(Routes value, $Res Function(Routes) then) =
      _$RoutesCopyWithImpl<$Res>;
}

/// @nodoc
class _$RoutesCopyWithImpl<$Res> implements $RoutesCopyWith<$Res> {
  _$RoutesCopyWithImpl(this._value, this._then);

  final Routes _value;
  // ignore: unused_field
  final $Res Function(Routes) _then;
}

/// @nodoc
abstract class _$HomeCopyWith<$Res> {
  factory _$HomeCopyWith(_Home value, $Res Function(_Home) then) =
      __$HomeCopyWithImpl<$Res>;
}

/// @nodoc
class __$HomeCopyWithImpl<$Res> extends _$RoutesCopyWithImpl<$Res>
    implements _$HomeCopyWith<$Res> {
  __$HomeCopyWithImpl(_Home _value, $Res Function(_Home) _then)
      : super(_value, (v) => _then(v as _Home));

  @override
  _Home get _value => super._value as _Home;
}

/// @nodoc
class _$_Home with DiagnosticableTreeMixin implements _Home {
  const _$_Home();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Routes.home()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'Routes.home'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Home);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult home(),
    @required TResult history(),
  }) {
    assert(home != null);
    assert(history != null);
    return home();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult home(),
    TResult history(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (home != null) {
      return home();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult home(_Home value),
    @required TResult history(_History value),
  }) {
    assert(home != null);
    assert(history != null);
    return home(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult home(_Home value),
    TResult history(_History value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (home != null) {
      return home(this);
    }
    return orElse();
  }
}

abstract class _Home implements Routes {
  const factory _Home() = _$_Home;
}

/// @nodoc
abstract class _$HistoryCopyWith<$Res> {
  factory _$HistoryCopyWith(_History value, $Res Function(_History) then) =
      __$HistoryCopyWithImpl<$Res>;
}

/// @nodoc
class __$HistoryCopyWithImpl<$Res> extends _$RoutesCopyWithImpl<$Res>
    implements _$HistoryCopyWith<$Res> {
  __$HistoryCopyWithImpl(_History _value, $Res Function(_History) _then)
      : super(_value, (v) => _then(v as _History));

  @override
  _History get _value => super._value as _History;
}

/// @nodoc
class _$_History with DiagnosticableTreeMixin implements _History {
  const _$_History();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Routes.history()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'Routes.history'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _History);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult home(),
    @required TResult history(),
  }) {
    assert(home != null);
    assert(history != null);
    return history();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult home(),
    TResult history(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (history != null) {
      return history();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult home(_Home value),
    @required TResult history(_History value),
  }) {
    assert(home != null);
    assert(history != null);
    return history(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult home(_Home value),
    TResult history(_History value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (history != null) {
      return history(this);
    }
    return orElse();
  }
}

abstract class _History implements Routes {
  const factory _History() = _$_History;
}
