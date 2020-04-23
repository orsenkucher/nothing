import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nothing/bloc/id/bloc.dart';
import 'package:nothing/domain/domain.dart';
import 'package:nothing/repository/ads.dart';

part 'bloc.freezed.dart';

@freezed
abstract class AdEvent with _$AdEvent {
  const factory AdEvent.register(String userid) = _Register;
  const factory AdEvent.report(AdType type) = _Report;
}

@freezed
abstract class AdState with _$AdState {
  const factory AdState(String userid, AdMode type) = _AdState;
  const factory AdState.empty() = _Empty;
}

class AdBloc extends Bloc<AdEvent, AdState> {
  AdRepo _adRepo;
  IdBloc _idBloc;
  AdBloc(this._adRepo, this._idBloc) {
    add(AdEvent.register(_idBloc.id));
  }

  @override
  AdState get initialState => AdState.empty();

  @override
  Stream<AdState> mapEventToState(AdEvent event) async* {
    yield await state.when((userId, mode) async {
      return await event.map(
        register: throw UnimplementedError,
        report: (r) async {
          await _adRepo.report(userId, r.type);
          return state;
        },
      );
    }, empty: () async {
      return await event.map(
          register: (r) async {
            final mode = await _adRepo.register(r.userid);
            return AdState(r.userid, mode);
          },
          report: throw UnimplementedError);
    });
  }
}
