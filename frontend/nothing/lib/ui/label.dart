import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nothing/bloc/validation/bloc.dart';
import 'package:nothing/bloc/xp/bloc.dart';
import 'package:nothing/bloc/xp_queue/bloc.dart';
import 'package:nothing/ui/xp.dart';

class Label extends StatefulWidget {
  const Label({
    Key key,
  }) : super(key: key);

  @override
  _LabelState createState() => _LabelState();
}

class _LabelState extends State<Label> {
  Key xpKey = UniqueKey();

  @override
  Widget build(BuildContext context) {
    final queueBloc = context.watch<XPQueueBloc>();
    final xpBloc = context.watch<XPBloc>();
    final state = context.watch<ValidationBloc>().state;

    state.when(
      just: (state) => state.maybeMap(
        correct: (_) => xpKey = ObjectKey(state),
        orElse: () => null,
      ),
      nothing: () => null,
    );

    return _xp(context, xpKey, queueBloc, xpBloc);
  }

  Widget _xp(
    BuildContext context,
    Key key,
    XPQueueBloc queueBloc,
    XPBloc xpBloc,
  ) {
    return XP(
      key: key,
      sliderHeight: 8.0,
      sliderPadding: const EdgeInsets.symmetric(horizontal: 100.0),
      queueBloc: queueBloc,
      xpBloc: xpBloc,
    );
  }
}
