import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:nothing/bloc/id/event.dart';
import 'package:nothing/bloc/id/state.dart';
import 'package:uuid/uuid.dart';

export 'event.dart';
export 'state.dart';

class IdBloc extends HydratedBloc<IdEvent, IdState> {
  IdState get revoke => IdState(Uuid().v4());

  @override
  IdState get initialState => super.initialState ?? revoke;
  @override
  Stream<IdState> mapEventToState(IdEvent event) async* {
    yield revoke;
  }

  // @override
  // IdState fromJson(Map<String, dynamic> json) => IdState.fromJson(json);
  // @override
  // Map<String, dynamic> toJson(IdState state) => state.toJson();

  @override
  Map<String, dynamic> toJson(IdState state) {
    try {
      return state.toJson();
    } catch (_) {
      print('Summary: toJson error');
      return null;
    }
  }

  @override
  IdState fromJson(Map<String, dynamic> json) {
    try {
      return IdState.fromJson(json);
    } catch (_) {
      print('Summary: toJson error');
      return null;
    }
  }
}
