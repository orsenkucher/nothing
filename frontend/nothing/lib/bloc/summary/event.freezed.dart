// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$SummaryEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result reset(),
    @required
        Result answer(
            @required int qid, @required int tries, @required int seconds),
  });

  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result reset(),
    Result answer(
        @required int qid, @required int tries, @required int seconds),
    @required Result orElse(),
  });

  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result reset(Reset value),
    @required Result answer(NewAnswer value),
  });

  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result reset(Reset value),
    Result answer(NewAnswer value),
    @required Result orElse(),
  });
}

class _$SummaryEventTearOff {
  const _$SummaryEventTearOff();

  Reset reset() {
    return const Reset();
  }

  NewAnswer answer(
      {@required int qid, @required int tries, @required int seconds}) {
    return NewAnswer(
      qid: qid,
      tries: tries,
      seconds: seconds,
    );
  }
}

const $SummaryEvent = _$SummaryEventTearOff();

class _$Reset with DiagnosticableTreeMixin implements Reset {
  const _$Reset();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SummaryEvent.reset()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'SummaryEvent.reset'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Reset);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result reset(),
    @required
        Result answer(
            @required int qid, @required int tries, @required int seconds),
  }) {
    assert(reset != null);
    assert(answer != null);
    return reset();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result reset(),
    Result answer(
        @required int qid, @required int tries, @required int seconds),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (reset != null) {
      return reset();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result reset(Reset value),
    @required Result answer(NewAnswer value),
  }) {
    assert(reset != null);
    assert(answer != null);
    return reset(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result reset(Reset value),
    Result answer(NewAnswer value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (reset != null) {
      return reset(this);
    }
    return orElse();
  }
}

abstract class Reset implements SummaryEvent {
  const factory Reset() = _$Reset;
}

class _$NewAnswer with DiagnosticableTreeMixin implements NewAnswer {
  const _$NewAnswer(
      {@required this.qid, @required this.tries, @required this.seconds})
      : assert(qid != null),
        assert(tries != null),
        assert(seconds != null);

  @override
  final int qid;
  @override
  final int tries;
  @override
  final int seconds;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SummaryEvent.answer(qid: $qid, tries: $tries, seconds: $seconds)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SummaryEvent.answer'))
      ..add(DiagnosticsProperty('qid', qid))
      ..add(DiagnosticsProperty('tries', tries))
      ..add(DiagnosticsProperty('seconds', seconds));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is NewAnswer &&
            (identical(other.qid, qid) ||
                const DeepCollectionEquality().equals(other.qid, qid)) &&
            (identical(other.tries, tries) ||
                const DeepCollectionEquality().equals(other.tries, tries)) &&
            (identical(other.seconds, seconds) ||
                const DeepCollectionEquality().equals(other.seconds, seconds)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(qid) ^
      const DeepCollectionEquality().hash(tries) ^
      const DeepCollectionEquality().hash(seconds);

  @override
  _$NewAnswer copyWith({
    Object qid = freezed,
    Object tries = freezed,
    Object seconds = freezed,
  }) {
    return _$NewAnswer(
      qid: qid == freezed ? this.qid : qid as int,
      tries: tries == freezed ? this.tries : tries as int,
      seconds: seconds == freezed ? this.seconds : seconds as int,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result reset(),
    @required
        Result answer(
            @required int qid, @required int tries, @required int seconds),
  }) {
    assert(reset != null);
    assert(answer != null);
    return answer(qid, tries, seconds);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result reset(),
    Result answer(
        @required int qid, @required int tries, @required int seconds),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (answer != null) {
      return answer(qid, tries, seconds);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result reset(Reset value),
    @required Result answer(NewAnswer value),
  }) {
    assert(reset != null);
    assert(answer != null);
    return answer(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result reset(Reset value),
    Result answer(NewAnswer value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (answer != null) {
      return answer(this);
    }
    return orElse();
  }
}

abstract class NewAnswer implements SummaryEvent {
  const factory NewAnswer(
      {@required int qid,
      @required int tries,
      @required int seconds}) = _$NewAnswer;

  int get qid;
  int get tries;
  int get seconds;

  NewAnswer copyWith({int qid, int tries, int seconds});
}
