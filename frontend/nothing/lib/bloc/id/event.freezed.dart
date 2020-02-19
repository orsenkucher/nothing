// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package

part of 'event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$IdEvent {}

class _$IdRevoke with DiagnosticableTreeMixin implements IdRevoke {
  const _$IdRevoke();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'IdEvent.revoke()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'IdEvent.revoke'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is IdRevoke);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class IdRevoke implements IdEvent {
  const factory IdRevoke() = _$IdRevoke;
}
