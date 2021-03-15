import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nothing/bloc/history/bloc.dart';
import 'package:nothing/bloc/id/bloc.dart';
import 'package:nothing/bloc/summary/bloc.dart';
import 'package:nothing/error/cloud_error.dart';
import 'package:nothing/repository/questions.dart';
import 'package:nothing/domain/domain.dart';

part 'bloc.freezed.dart';

@freezed
class QuestionsEvent with _$QuestionsEvent {
  const factory QuestionsEvent.fetch([int? currentid, @Default(false) bool isRefetch]) = Fetch;
  const factory QuestionsEvent.refetch(int currentid) = Refetch;
}

@freezed
class QuestionsState with _$QuestionsState {
  const factory QuestionsState.loaded(QTree questions) = Loaded;
  static QuestionsState get empty => QuestionsState.loaded(QTree());
  const factory QuestionsState.loading() = Loading;
  const factory QuestionsState.reloading() = Reloading;
  const factory QuestionsState.error(CloudError error) = Error;
}

class QuestionsBloc extends Bloc<QuestionsEvent, QuestionsState> {
  final QuestionsRepo repo;
  final SummaryBloc summaryBloc;
  final IdBloc idBloc;
  final HistoryBloc historyBloc;

  QuestionsBloc({
    required this.repo,
    required this.summaryBloc,
    required this.idBloc,
    required this.historyBloc,
  }) : super(QuestionsState.empty);

  @override
  Stream<QuestionsState> mapEventToState(QuestionsEvent event) async* {
    yield* event.map(fetch: _mapFetch, refetch: _mapRefetch);
  }

  int? lastid;
  Stream<QuestionsState> _mapFetch(Fetch event) async* {
    if (event.currentid == null) {
      final curid = historyBloc.state.ids.isEmpty ? 1 : -1;
      add(QuestionsEvent.fetch(curid));
      return;
    }

    if (event.isRefetch && lastid != event.currentid) return;

    yield const QuestionsState.loading();
    try {
      lastid = event.currentid;
      print("LAST ID is: $lastid");
      final answered = [...summaryBloc.state.answers];
      var problems = await repo.fetchQuestions(
        userID: idBloc.state.id,
        currentID: event.currentid!,
        answers: answered,
      );
      summaryBloc.add(SummaryEvent.remove(answered));
      yield QuestionsState.loaded(problems);
    } on CloudError catch (error) {
      yield QuestionsState.error(error);
      add(QuestionsEvent.refetch(event.currentid!));
    }
  }

  Stream<QuestionsState> _mapRefetch(Refetch event) async* {
    const duration = Duration(seconds: 10);
    print("Retry in $duration");
    await Future.delayed(duration);
    if (lastid == event.currentid) {
      yield const QuestionsState.reloading();
      print("REFETCHING ID is: $lastid");
      add(QuestionsEvent.fetch(event.currentid, true));
    }
  }
}
