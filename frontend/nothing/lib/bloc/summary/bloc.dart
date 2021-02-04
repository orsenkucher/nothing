import 'dart:async';

import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:nothing/bloc/summary/event.dart';
import 'package:nothing/bloc/summary/state.dart';

export 'event.dart';
export 'state.dart';

class SummaryBloc extends HydratedBloc<SummaryEvent, SummaryState> {
  SummaryBloc() : super(SummaryState.empty());

  @override
  Stream<SummaryState> mapEventToState(
    SummaryEvent event,
  ) async* {
    yield event.map(
      remove: (e) {
        final answers = [...state.answers];
        e.answers.forEach((ans) => answers.remove(ans));
        final next = SummaryState(answers: answers);
        return next;
      },
      answer: (e) {
        final next = SummaryState(answers: [
          ...state.answers,
          SummaryAnswer(
            answers: e.answers,
            seconds: e.seconds,
            tries: e.tries,
            qid: e.qid,
          ),
        ]);
        return next;
      },
    );
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    print(error);
    super.onError(error, stackTrace);
  }

  @override
  SummaryState fromJson(Map<String, dynamic> json) {
    final summary = SummaryState.fromJson(json);
    return summary;
  }

  @override
  Map<String, dynamic> toJson(SummaryState summary) {
    final json = summary.toJson();
    return json;
  }
}
