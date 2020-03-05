import 'dart:async';

import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:nothing/bloc/summary/event.dart';
import 'package:nothing/bloc/summary/state.dart';

export 'event.dart';
export 'state.dart';

class SummaryBloc extends HydratedBloc<SummaryEvent, Summary> {
  @override
  Summary get initialState => super.initialState ?? Summary.empty();

  @override
  Stream<Summary> mapEventToState(
    SummaryEvent event,
  ) async* {
    yield event.map(
      reset: (_) => Summary.empty(),
      answer: (e) {
        // TODO rm salt
        final next = state.copyWith(salt: state.salt + 1)
          //currentid: feed.state.tree.question.id)
          ..answers.add(
            SummaryAnswer(
              seconds: e.seconds,
              tries: e.tries,
              qid: e.qid,
            ),
          );
        return next;
        // return state.copyWith(currentid: )..summary.add();
      },
    );
  }

  @override
  Summary fromJson(Map<String, dynamic> json) {
    try {
      final summary = Summary.fromJson(json);
      return summary;
    } catch (_) {
      print('Summary: fromJson error');
      return null;
    }
  }

  @override
  Map<String, dynamic> toJson(Summary summary) {
    try {
      final json = summary.toJson();
      return json;
    } catch (_) {
      print('Summary: toJson error');
      return null;
    }
  }
}
