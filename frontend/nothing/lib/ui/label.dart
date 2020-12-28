import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nothing/bloc/validation/bloc.dart';
import 'package:nothing/bloc/xp/bloc.dart';
import 'package:nothing/color/scheme.dart';
import 'package:nothing/ui/xp.dart';

class Label extends StatelessWidget {
  const Label({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<XPBloc>();
    final state = context.watch<ValidationBloc>().state;
    final child = state.when(
          just: (state) => state.maybeMap(
            correct: (_) => _xp(context, bloc),
            orElse: () => null,
          ),
          nothing: () => null,
        ) ??
        _title(context);
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 220),
      child: child,
    );
  }

  Widget _xp(BuildContext context, XPBloc bloc) {
    return XP(
      bloc: bloc,
      sliderHeight: 8.0,
      sliderPadding: const EdgeInsets.symmetric(horizontal: 100.0),
    );
  }

  Widget _title(BuildContext context) {
    return Center(
      child: Text(
        "NOTHING PUZZLE 2",
        style: TextStyle(
          fontSize: 20,
          color: NothingScheme.of(context).label,
        ),
      ),
    );
  }
}
