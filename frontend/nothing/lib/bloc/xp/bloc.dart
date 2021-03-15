import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:nothing/bloc/xp_ids/bloc.dart';

part 'bloc.freezed.dart';
part 'bloc.g.dart';

@freezed
class XPState with _$XPState {
  const XPState._();
  const factory XPState({
    required int totalxp,
    required int basexp,
    required int bonusxp,
    required int level,
  }) = _XPState;

  factory XPState.fromJson(Map<String, dynamic> json) => _$XPStateFromJson(json);

  static const _xpmult = 100;
  static const _xpbias = 300;
  int get levelxp => level * _xpmult + _xpbias;
  int get prevLevelxp => (level - 1) * _xpmult + _xpbias;
}

class XPBloc extends HydratedCubit<XPState> {
  XPBloc(this.xpids) : super(XPState(totalxp: 0, basexp: 0, bonusxp: 0, level: 1));
  XPIDsBloc xpids;

  void progress(int id, int basexp, int bonusxp) {
    if (xpids.state.ids.contains(id)) return;
    xpids.addId(id);
    print('XP: base: $basexp, bonus: $bonusxp');
    _handleBase(basexp);
    _handleBonus(bonusxp);
  }

  void _handleBase(int basexp) {
    var next = state.copyWith(basexp: basexp, bonusxp: 0);
    var current = next.totalxp + next.basexp;
    while (current >= next.levelxp) {
      current -= next.levelxp;
      next = next.copyWith(
        totalxp: 0,
        level: next.level + 1,
        basexp: next.levelxp - next.totalxp,
      );
      emit(next);
    }
    emit(next.copyWith(basexp: current - next.totalxp, totalxp: current));
  }

  void _handleBonus(int bonusxp) {
    var next = state.copyWith(basexp: 0, bonusxp: bonusxp);
    var current = next.totalxp + next.bonusxp;
    while (current >= next.levelxp) {
      current -= next.levelxp;
      next = next.copyWith(
        totalxp: 0,
        level: next.level + 1,
        bonusxp: next.levelxp - next.totalxp,
      );
      emit(next);
    }
    emit(next.copyWith(bonusxp: current - next.totalxp, totalxp: current));
  }

  @override
  XPState fromJson(Map<String, dynamic> json) => XPState.fromJson(json);

  @override
  Map<String, dynamic> toJson(XPState state) => state.toJson();
}
