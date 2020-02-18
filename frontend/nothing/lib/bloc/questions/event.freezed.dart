// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package

part of 'event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$QuestionsEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result fetch(),
    @required Result refetch(),
  });

  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result fetch(),
    Result refetch(),
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

class _$Fetch with DiagnosticableTreeMixin implements Fetch {
  const _$Fetch();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.debug}) {
    return 'QuestionsEvent.fetch()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'QuestionsEvent.fetch'));
  }

  @override
  bool operator ==(dynamic other) {
    return other is Fetch;
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result fetch(),
    @required Result refetch(),
  }) {
    assert(fetch != null);
    assert(refetch != null);
    return fetch();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result fetch(),
    Result refetch(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (fetch != null) {
      return fetch();
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
  const factory Fetch() = _$Fetch;
}

class _$Refetch with DiagnosticableTreeMixin implements Refetch {
  const _$Refetch();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.debug}) {
    return 'QuestionsEvent.refetch()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'QuestionsEvent.refetch'));
  }

  @override
  bool operator ==(dynamic other) {
    return other is Refetch;
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result fetch(),
    @required Result refetch(),
  }) {
    assert(fetch != null);
    assert(refetch != null);
    return refetch();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result fetch(),
    Result refetch(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (refetch != null) {
      return refetch();
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
  const factory Refetch() = _$Refetch;
}
