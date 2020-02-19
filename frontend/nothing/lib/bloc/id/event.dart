import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'event.freezed.dart';

@freezed
abstract class IdEvent with _$IdEvent {
  const factory IdEvent.revoke() = IdRevoke;
}
