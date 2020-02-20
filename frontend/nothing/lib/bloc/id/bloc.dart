import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:nothing/bloc/id/event.dart';
import 'package:nothing/bloc/id/state.dart';

export 'event.dart';
export 'state.dart';

class IdBloc extends HydratedBloc<IdEvent, IdState> {
  IdBloc() {
    add(IdEvent.issue(state));
  }

  IdState revoke() => IdState.unique();

  @override
  IdState get initialState => super.initialState ?? revoke();

  @override
  Stream<IdState> mapEventToState(IdEvent event) async* {
    yield event.when<IdState>(
      revoke: revoke,
      issue: (s) => IdState.salted(s.id),
    );
  }

  @override
  IdState fromJson(Map<String, dynamic> json) => IdState.fromJson(json);
  @override
  Map<String, dynamic> toJson(IdState state) => state.toJson();
}
