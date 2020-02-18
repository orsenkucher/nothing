// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package

part of 'event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$SummaryEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result reset(),
    @required Result answer(@required int id, @required bool answer),
  });

  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result reset(),
    Result answer(@required int id, @required bool answer),
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

class _$Reset with DiagnosticableTreeMixin implements Reset {
  const _$Reset();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.debug}) {
    return 'SummaryEvent.reset()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'SummaryEvent.reset'));
  }

  @override
  bool operator ==(dynamic other) {
    return other is Reset;
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result reset(),
    @required Result answer(@required int id, @required bool answer),
  }) {
    assert(reset != null);
    assert(answer != null);
    return reset();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result reset(),
    Result answer(@required int id, @required bool answer),
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
  const _$NewAnswer({@required this.id, @required this.answer});

  @override
  final int id;
  @override
  final bool answer;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.debug}) {
    return 'SummaryEvent.answer(id: $id, answer: $answer)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SummaryEvent.answer'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('answer', answer));
  }

  @override
  bool operator ==(dynamic other) {
    return other is NewAnswer &&
        (identical(other.id, id) || other.id == id) &&
        (identical(other.answer, answer) || other.answer == answer);
  }

  @override
  int get hashCode => runtimeType.hashCode ^ id.hashCode ^ answer.hashCode;

  @override
  _$NewAnswer copyWith({
    Object id = immutable,
    Object answer = immutable,
  }) {
    return _$NewAnswer(
      id: id == immutable ? this.id : id as int,
      answer: answer == immutable ? this.answer : answer as bool,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result reset(),
    @required Result answer(@required int id, @required bool answer),
  }) {
    assert(reset != null);
    assert(answer != null);
    return answer(id, this.answer);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result reset(),
    Result answer(@required int id, @required bool answer),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (answer != null) {
      return answer(id, this.answer);
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
  const factory NewAnswer({@required int id, @required bool answer}) =
      _$NewAnswer;

  int get id;
  bool get answer;

  NewAnswer copyWith({int id, bool answer});
}
