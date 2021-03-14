import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nothing/bloc/routing/bloc.dart';

class Navigatable extends StatelessWidget {
  final Widget child;
  final Routes route;
  const Navigatable({
    required this.route,
    required this.child,
  });
  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      child: child,
      listeners: [
        BlocListener<RoutingBloc, RoutingState>(
          listener: (context, state) => state.event.when(
            push: (from, to) => {
              if (from == route) Navigator.pushNamed(context, to.name),
            }, // did you know I'm returning a Set here? Spawned from {} literal?
            pop: (from) => {
              if (from == route) Navigator.pop(context),
            }, // omg what a language) Use only for side-effects!
            resume: () => {},
          ), // and this is empty Set
        ),
      ],
    );
  }
}
