import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:nothing/bloc/feed/bloc.dart';
import 'package:nothing/bloc/validation/bloc.dart';
import 'package:nothing/color/scheme.dart';
import 'package:nothing/domain/domain.dart';
import 'package:nothing/model/text.dart';

class Answer extends HookWidget {
  const Answer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const duration = Duration(milliseconds: 300);
    final controllerInitial =
        context.bloc<FeedBloc>().state.when<double>(available: (_) => 0, pending: (_, __) => 1, empty: (_) => 0);
    final controller = useAnimationController(duration: duration, initialValue: controllerInitial);
    const shift = 8.0;
    final offsetWrongX = TweenSequence([
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 0.0, end: shift).chain(CurveTween(curve: Curves.ease)),
        weight: 1,
      ),
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: shift, end: -shift).chain(CurveTween(curve: Curves.ease)),
        weight: 2,
      ),
    ]).animate(CurvedAnimation(
      parent: controller,
      curve: Interval(0.0, 1.0, curve: Curves.easeIn),
    ));

    final offsetCorrect = Tween<Offset>(begin: Offset.zero, end: const Offset(0, -50)).animate(CurvedAnimation(
      parent: controller,
      curve: Interval(0.0, 1.0, curve: Curves.easeIn),
    ));

    final offsetRight = Tween<Offset>(begin: const Offset(0, 50), end: Offset.zero).animate(CurvedAnimation(
      parent: controller,
      curve: Interval(0.0, 1.0, curve: Curves.easeIn),
    ));

    final opacityCorrect = Tween<double>(begin: 1, end: 0).animate(controller);
    final opacityRight = Tween<double>(begin: 0, end: 1).animate(controller);

    return BlocListener<FeedBloc, FeedState>(
      listener: (context, state) {
        if (state is Available) {
          controller.reset();
        }
      },
      child: BlocConsumer<ValidationBloc, ValidationState>(
        buildWhen: (oldState, state) => state.when(
          just: (state) => state.map(
            correct: (_) => true,
            wrong: (_) => true,
            skip: (_) => true,
            neutral: (_) => false,
          ),
          nothing: () => false,
        ),
        listener: (BuildContext context, state) {
          state.maybeWhen(
            just: (state) => state.map(
              wrong: (_) async {
                await controller.forward();
                await controller.reverse();
              },
              correct: (_) async {
                if (Platform.isIOS) {
                  Vibrate.feedback(FeedbackType.success);
                }
                await controller.forward();
                // controller.reset();
              },
              neutral: (_) => void$(),
              skip: (_) => void$(),
            ),
            orElse: () => void$(),
          );
        },
        builder: (context, state) {
          final scheme = NothingScheme.of(context);
          final color = ColorTween(
            begin: scheme.neutral,
            end: state.maybeWhen(
              just: (state) => state.maybeMap(
                wrong: (_) => scheme.wrong,
                correct: (_) => scheme.correct,
                orElse: () => scheme.neutral,
              ),
              orElse: () => scheme.neutral,
            ),
          ).animate(
            CurvedAnimation(
              parent: controller,
              curve: Interval(0.0, 0.1, curve: Curves.ease),
            ),
          );

          final isWrong = state.maybeWhen(
              just: (state) => state.maybeMap(
                    wrong: (_) => true,
                    correct: (_) => false,
                    orElse: () => false,
                  ),
              orElse: () => false);

          Widget animWrong(Widget child) {
            return isWrong
                ? Transform.translate(
                    offset: Offset(offsetWrongX.value, 0),
                    child: child,
                  )
                : child;
          }

          Widget animCorrect(Widget child) {
            return !isWrong
                ? Stack(children: [
                    Transform.translate(
                      offset: offsetCorrect.value,
                      child: Opacity(
                        opacity: opacityCorrect.value,
                        child: child,
                      ),
                    ),
                    Transform.translate(
                      offset: offsetRight.value,
                      child: Opacity(
                        opacity: opacityRight.value,
                        child: Center(
                          child: Text('Right',
                              style: TextStyle(
                                fontSize: 28,
                                color: Colors.white,
                              )),
                        ),
                      ),
                    ),
                  ])
                : child;
          }

          return AnimatedBuilder(
            animation: controller,
            builder: (context, child) => animWrong(
              Container(
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.symmetric(horizontal: 32),
                child: Material(
                  elevation: 6,
                  shadowColor: color.value.tint,
                  color: color.value,
                  borderRadius: NothingScheme.of(context).answerBorder,
                  clipBehavior: Clip.antiAlias,
                  child: isWrong && controller.isAnimating ? Container() : animCorrect(child),
                ),
              ),
            ),
            child: SizedBox.expand(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: AutoSizeText(
                          TextModel.of(context).text ?? '',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: NothingScheme.of(context).answer,
                          ),
                          maxLines: 1,
                        ),
                      ),
                      Align(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 1),
                          child: Blinker(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class Blinker extends HookWidget {
  @override
  Widget build(BuildContext context) {
    const dur = Duration(milliseconds: 500);
    const cur = Curves.easeInOut;
    final contr = useAnimationController(duration: dur);
    final anim = CurvedAnimation(curve: cur, parent: contr);
    useEffect(() {
      contr.repeat(reverse: true);
      return null;
    });
    return AnimatedBuilder(
      animation: contr,
      builder: (context, child) => Opacity(opacity: anim.value, child: child),
      child: Container(
        width: 2.5,
        color: NothingScheme.of(context).answer,
      ),
    );
  }
}
