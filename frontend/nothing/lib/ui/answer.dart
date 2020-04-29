import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:nothing/bloc/validation/bloc.dart';
import 'package:nothing/color/scheme.dart';
import 'package:nothing/model/text.dart';
import 'package:vibrate/vibrate.dart';

class Answer extends HookWidget {
  const Answer(this.wait, {Key key}) : super(key: key);

  final ValueNotifier<bool> wait;

  @override
  Widget build(BuildContext context) {
    const duration = Duration(milliseconds: 300);
    final controller = useAnimationController(duration: duration);
    useEffect(() {
      final listener = () {
        if (!wait.value) {
          controller.reset();
        }
      };
      wait.addListener(listener);
      return () => wait.removeListener(listener);
    });
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

    return BlocConsumer<ValidationBloc, ValidationState>(
      buildWhen: (oldState, state) => state.when(
        just: (state) => state.map(
          correct: (_) => true,
          wrong: (_) => true,
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
              var type = FeedbackType.success;
              Vibrate.feedback(type);
              await controller.forward();
              // controller.reset();
            },
            neutral: (_) {},
          ),
          orElse: () {},
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

        Widget anim(Widget child) {
          return state.maybeWhen(
                  just: (state) => state.maybeMap(
                        wrong: (_) => true,
                        correct: (_) => false,
                        orElse: () => false,
                      ),
                  orElse: () => false)
              ? Transform.translate(
                  offset: Offset(offsetAnimation.value, 0),
                  child: child,
                )
              : child;
        }

        return AnimatedBuilder(
          animation: controller,
          builder: (context, child) => anim(
            Container(
              padding: const EdgeInsets.all(8),
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
        );
      },
    );
  }
}
