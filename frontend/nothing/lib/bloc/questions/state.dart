import 'package:flutter/foundation.dart';
import 'package:nothing/domain/domain.dart';
import 'package:nothing/error/cloud_error.dart';

part 'state.freezed.dart';

@immutable
abstract class QuestionsState with _$QuestionsState {
  const factory QuestionsState.loaded(QTree questions) = Loaded;
  // factory QuestionsState.empty() => _Loaded(QTree());
  const factory QuestionsState.loading() = Loading;
  const factory QuestionsState.reloading() = Reloading;
  const factory QuestionsState.error(CloudError error) = Error;
}
