import 'dart:async';

import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:nothing/bloc/summary/event.dart';
import 'package:nothing/bloc/summary/state.dart';

export 'event.dart';
export 'state.dart';

class SummaryBloc extends HydratedBloc<SummaryEvent, SummaryState> {
  @override
  SummaryState get initialState => super.initialState ?? SummaryState.empty();

  @override
  Stream<SummaryState> mapEventToState(
    SummaryEvent event,
  ) async* {
    yield event.map(
      reset: (_) => SummaryState.empty(),
      answer: (e) {
        final next = SummaryState(answers: [
          ...state.answers,
          SummaryAnswer(
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
  SummaryState fromJson(Map<String, dynamic> json) {
    try {
      final summary = SummaryState.fromJson(json);
      return summary;
    } catch (_) {
      print('Summary: fromJson error');
      return null;
    }
  }

  @override
  Map<String, dynamic> toJson(SummaryState summary) {
    try {
      final json = summary.toJson();
      return json;
    } catch (_) {
      print('Summary: toJson error');
      return null;
    }
  }
}
