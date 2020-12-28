import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:nothing/bloc/validation/bloc.dart';
import 'package:nothing/bloc/xp/bloc.dart';
import 'package:nothing/color/scheme.dart';
import 'package:nothing/ui/xp.dart';

class Label extends HookWidget {
  const Label({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final xpstate = useState(context.watch<XPBloc>().state);
    useEffect(() {
      final sub = context.watch<XPBloc>().asyncMap((state) {
        xpstate.value = state;
        print("HEH $state");
        return Future.delayed(const Duration(milliseconds: 800));
      }).listen((_) {});
      return () => sub.cancel();
    });
    final state = context.watch<ValidationBloc>().state;
    final child = state.when(
          just: (state) => state.maybeMap(
            correct: (_) => _xp(context, xpstate.value),
            orElse: () => null,
          ),
          nothing: () => null,
        ) ??
        _title(context);
    return BlocListener<XPBloc, XPState>(
      listener: (context, state) {
        // xpstate.value = state;
        // print("XPBLOC2 $state");
        // await Future.delayed(const Duration(milliseconds: 1800));
      },
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 220),
        child: child,
      ),
    );
  }

  Widget _xp(BuildContext context, XPState state) {
    return XP(
      state: state,
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
