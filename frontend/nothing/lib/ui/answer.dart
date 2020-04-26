import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:nothing/bloc/validation/bloc.dart';
import 'package:nothing/color/scheme.dart';
import 'package:nothing/model/text.dart';

class Answer extends HookWidget {
  const Answer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const duration = Duration(milliseconds: 600);
    final controller = useAnimationController(duration: duration);
    final scheme = NothingScheme.of(context);
    final color = ColorTween(
      begin: scheme.neutral,
      end: scheme.wrong,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.0, 0.1, curve: Curves.ease),
      ),
    );
    const shift = 8.0;
    final Animation<double> offsetAnimation = TweenSequence([
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 0.0, end: shift)
            .chain(CurveTween(curve: Curves.ease)),
        weight: 1,
      ),
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: shift, end: -shift)
            .chain(CurveTween(curve: Curves.ease)),
        weight: 2,
      ),
    ]).animate(CurvedAnimation(
      parent: controller,
      curve: Interval(0.0, 1.0, curve: Curves.easeIn),
    ));

    return BlocListener<ValidationBloc, ValidationState>(
      listener: (BuildContext context, state) {
        state.maybeWhen(
          just: (state) => state.maybeMap(
            wrong: (_) async {
              await controller.forward();
              await controller.reverse();
            },
            orElse: () {},
          ),
          orElse: () {},
        );
      },
      child: AnimatedBuilder(
        animation: controller,
        builder: (context, child) => Container(
          padding: EdgeInsets.only(
            left: offsetAnimation.value + shift,
            right: -offsetAnimation.value + shift,
            top: 8,
            bottom: 8,
          ),
          margin: const EdgeInsets.symmetric(horizontal: 32),
          child: Material(
            elevation: 6,
            shadowColor: color.value.tint,
            color: color.value,
            borderRadius: NothingScheme.of(context).answerBorder,
            clipBehavior: Clip.antiAlias,
            child: child,
          ),
        ),
        child: SizedBox.expand(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Center(
              child: AutoSizeText(
                TextModel.of(context).text ?? '',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: NothingScheme.of(context).answer,
                ),
                maxLines: 2,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
