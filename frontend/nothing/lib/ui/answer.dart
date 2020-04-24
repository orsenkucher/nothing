import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nothing/bloc/validation/bloc.dart';
import 'package:nothing/color/scheme.dart';
import 'package:nothing/model/text.dart';

class Answer extends StatefulWidget {
  const Answer({Key key}) : super(key: key);

  @override
  _AnswerState createState() => _AnswerState();
}

class _AnswerState extends State<Answer> with SingleTickerProviderStateMixin {
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
    final Animation<double> offsetAnimation = Tween(begin: 0.0, end: 8.0)
        .chain(CurveTween(curve: Curves.elasticIn))
        .animate(controller);

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
            left: offsetAnimation.value + 8.0,
            right: -offsetAnimation.value + 8.0,
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
