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
    final answerText = useState('');
    useEffect(() {
      final textModel = TextModel.of(context);
      final textListener = () {
        if (!wait.value) {
          answerText.value = textModel.text ?? '';
        }
      };
      textModel.addListener(textListener);

      final waitListener = () {
        if (!wait.value) {
          controller.reset();
          textListener();
        }
      };
      wait.addListener(waitListener);

      return () {
        textModel.removeListener(textListener);
        wait.removeListener(waitListener);
      };
    });

    useEffect(() {
      final textModel = TextModel.of(context);
      final listener = () {
        if (!wait.value) {
          answerText.value = textModel.text ?? '';
        }
      };
      textModel.addListener(listener);
      return () => textModel.removeListener(listener);
    });

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

    return BlocConsumer<ValidationBloc, ValidationState>(
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
              var type = FeedbackType.success;
              Vibrate.feedback(type);
              await controller.forward();
              // controller.reset();
            },
            neutral: (_) {},
            skip: (_) {},
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
                child: animCorrect(child),
              ),
            ),
          ),
          child: SizedBox.expand(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Center(
                child: AutoSizeText(
                  answerText.value,
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
