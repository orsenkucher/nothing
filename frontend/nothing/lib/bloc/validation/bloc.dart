import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:bloc/bloc.dart';
import 'package:nothing/bloc/feed/bloc.dart';

part 'bloc.freezed.dart';

@freezed
abstract class ValidationEvent with _$ValidationEvent {
  const factory ValidationEvent.check(String answer) = _Check;
  const factory ValidationEvent.purge() = _Purge;
}

@freezed
abstract class ValidationState with _$ValidationState {
  const factory ValidationState.correct() = _Correct;
  const factory ValidationState.neutral() = _Neutral;
  const factory ValidationState.wrong() = _Wrong;
}

class ValidationBloc extends Bloc<ValidationEvent, ValidationState> {
  final FeedBloc feed;
  StreamSubscription _sub;

  ValidationBloc({@required this.feed}) {
    _sub = listen(
      (state) {
        state.maybeWhen<Function>(
          correct: () => () => feed.add(
                FeedEvent.moveNext(true ? MoveDir.left() : MoveDir.right()),
              ),
          orElse: () => () {},
        )();
      },
    );
  }

  @override
  Future<void> close() async {
    await _sub.cancel();
    return super.close();
  }

  @override
  ValidationState get initialState => ValidationState.neutral();

  @override
  Stream<ValidationState> mapEventToState(ValidationEvent event) async* {
    yield event.when(
      purge: () => ValidationState.neutral(),
      check: (ans) => (feed.state.tree?.question?.splitted
                  ?.map((s) => s.toLowerCase())
                  ?.contains(ans.toLowerCase()) ??
              false)
          ? ValidationState.correct()
          : ValidationState.wrong(),
    );
  }
}
