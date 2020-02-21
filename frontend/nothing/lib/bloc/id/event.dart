import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:nothing/bloc/id/bloc.dart';

part 'event.freezed.dart';

@freezed
abstract class IdEvent with _$IdEvent {
  const factory IdEvent.revoke() = _RevokeID;
  const factory IdEvent.issue(IdState state) = _IssueID;
}
