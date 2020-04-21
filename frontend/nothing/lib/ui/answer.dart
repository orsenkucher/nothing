import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nothing/bloc/validation/bloc.dart';
import 'package:nothing/color/scheme.dart';
import 'package:nothing/model/text.dart';

class Answer extends StatelessWidget {
  const Answer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scheme = NothingScheme.of(context);
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(horizontal: 32),
      child: BlocBuilder<ValidationBloc, ValidationState>(
        builder: (BuildContext context, state) {
          final color = state.when(
            just: (state) => state.map(
              correct: (_) => scheme.correct,
              neutral: (_) => scheme.neutral,
              wrong: (_) => scheme.wrong,
            ),
            nothing: () => scheme.neutral,
          );
          return Material(
            elevation: 6,
            shadowColor: color.tint,
            color: color,
            borderRadius: NothingScheme.of(context).answerBorder,
            clipBehavior: Clip.antiAlias,
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
      ),
    );
  }
}
