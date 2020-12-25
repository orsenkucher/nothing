import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nothing/bloc/menu/bloc.dart';
import 'package:nothing/color/scheme.dart';

class Toggle extends StatefulWidget {
  @override
  _ToggleState createState() => _ToggleState();
}

class _ToggleState extends State<Toggle> {
  @override
  Widget build(BuildContext context) {
    final vib = context.watch<MenuBloc>().state.vibration;
    return Container(
      width: 48,
      height: 24,
      decoration: BoxDecoration(
        color: vib ? NothingScheme.of(context).knob : Colors.grey,
        borderRadius: NothingScheme.of(context).toggleBorder,
      ),
      padding: const EdgeInsets.all(2.0),
      child: AnimatedContainer(
        margin: vib ? EdgeInsets.only(left: 12.0) : EdgeInsets.only(right: 12.0),
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeOutCirc,
        // width: 18,
        // height: 18,
        decoration: BoxDecoration(
          color: NothingScheme.of(context).background,
          borderRadius: NothingScheme.of(context).toggleBorder,
        ),
      ),
    );
  }
}
