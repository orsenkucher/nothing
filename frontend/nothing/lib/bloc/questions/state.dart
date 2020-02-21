import 'package:nothing/domain/domain.dart';
import 'package:nothing/error/cloud_error.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'state.freezed.dart';

@freezed
abstract class QuestionsState with _$QuestionsState {
  const factory QuestionsState.loaded(QTree questions) = Loaded;
  static QuestionsState get empty => QuestionsState.loaded(QTree());
  const factory QuestionsState.loading() = Loading;
  const factory QuestionsState.reloading() = Reloading;
  const factory QuestionsState.error(CloudError error) = Error;
}
