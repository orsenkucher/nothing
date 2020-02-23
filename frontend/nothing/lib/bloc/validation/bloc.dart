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
  const factory ValidationState.correct(int qid, int tries, Duration duration) =
      _Correct;
  const factory ValidationState.neutral(int qid, int tries, DateTime time) =
      _Neutral;
  const factory ValidationState.wrong(int qid, int tries, DateTime time) =
      _Wrong;
}

class ValidationBloc extends Bloc<ValidationEvent, ValidationState> {
  final FeedBloc feed;
  StreamSubscription _sub;

  ValidationBloc({@required this.feed}) {
    _sub = listen(
      (state) {
        state.maybeWhen<Function>(
          correct: (qid, tries, duration) => () {
            feed.add(
              FeedEvent.moveNext(
                  duration.inSeconds > 90 ? MoveDir.left() : MoveDir.right()),
            );
            Future.delayed(const Duration(seconds: 3), () {
              state.maybeMap(
                correct: (_) => add(ValidationEvent.purge()),
                orElse: () {},
              );
            });
          },
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
  ValidationState get initialState => ValidationState.neutral(
      feed.state?.tree?.question?.id ?? -1, 0, DateTime.now());

  @override
  Stream<ValidationState> mapEventToState(ValidationEvent event) async* {
    // Боже, это не фп, а какой-то бред))
    yield event.when(
        purge: () => state.maybeMap(
              correct: (_) => initialState,
              orElse: () => state,
            ),
        check: (ans) => (feed.state.tree?.question?.splitted
                    ?.map((s) => s.toLowerCase())
                    ?.contains(ans.toLowerCase()) ??
                false)
            ? ValidationState.correct(
                state.qid,
                state.tries,
                DateTime.now().difference(state.when(
                  correct: (_, __, ____) => DateTime.now(),
                  neutral: (_, __, t) => t,
                  wrong: (_, __, t) => t,
                )))
            : ValidationState.wrong(
                state.qid,
                state.tries + 1,
                state.when(
                  correct: (_, __, ___) => DateTime.now(),
                  neutral: (_, __, t) => t,
                  wrong: (_, __, t) => t,
                )));
  }
}
