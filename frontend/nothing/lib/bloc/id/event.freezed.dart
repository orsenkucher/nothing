// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package

part of 'event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$IdEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result revoke(),
    @required Result issue(IdState state),
  });

  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result revoke(),
    Result issue(IdState state),
    @required Result orElse(),
  });

  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result revoke(_RevokeID value),
    @required Result issue(_IssueID value),
  });

  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result revoke(_RevokeID value),
    Result issue(_IssueID value),
    @required Result orElse(),
  });
}

class _$_RevokeID with DiagnosticableTreeMixin implements _RevokeID {
  const _$_RevokeID();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'IdEvent.revoke()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'IdEvent.revoke'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _RevokeID);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result revoke(),
    @required Result issue(IdState state),
  }) {
    assert(revoke != null);
    assert(issue != null);
    return revoke();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result revoke(),
    Result issue(IdState state),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (revoke != null) {
      return revoke();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result revoke(_RevokeID value),
    @required Result issue(_IssueID value),
  }) {
    assert(revoke != null);
    assert(issue != null);
    return revoke(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result revoke(_RevokeID value),
    Result issue(_IssueID value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (revoke != null) {
      return revoke(this);
    }
    return orElse();
  }
}

abstract class _RevokeID implements IdEvent {
  const factory _RevokeID() = _$_RevokeID;
}

class _$_IssueID with DiagnosticableTreeMixin implements _IssueID {
  const _$_IssueID(this.state) : assert(state != null);

  @override
  final IdState state;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'IdEvent.issue(state: $state)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'IdEvent.issue'))
      ..add(DiagnosticsProperty('state', state));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _IssueID &&
            (identical(other.state, state) ||
                const DeepCollectionEquality().equals(other.state, state)));
  }

  @override
  int get hashCode => runtimeType.hashCode ^ state.hashCode;

  @override
  _$_IssueID copyWith({
    Object state = freezed,
  }) {
    assert(state != null);
    return _$_IssueID(
      state == freezed ? this.state : state as IdState,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result revoke(),
    @required Result issue(IdState state),
  }) {
    assert(revoke != null);
    assert(issue != null);
    return issue(state);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result revoke(),
    Result issue(IdState state),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (issue != null) {
      return issue(state);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result revoke(_RevokeID value),
    @required Result issue(_IssueID value),
  }) {
    assert(revoke != null);
    assert(issue != null);
    return issue(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result revoke(_RevokeID value),
    Result issue(_IssueID value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (issue != null) {
      return issue(this);
    }
    return orElse();
  }
}

abstract class _IssueID implements IdEvent {
  const factory _IssueID(IdState state) = _$_IssueID;

  IdState get state;

  _IssueID copyWith({IdState state});
}
