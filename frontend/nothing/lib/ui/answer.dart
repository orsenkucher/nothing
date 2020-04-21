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
            elevation: 7,
            shadowColor: color.tint,
            color: color,
            borderRadius: BorderRadius.circular(28),
            clipBehavior: Clip.antiAlias,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 4),
                    child: IconButton(
                      onPressed: () => print("Press"),
                      splashColor: Colors.red,
                      highlightColor: Colors.transparent,
                      icon: Icon(
                        Icons.lightbulb_outline,
                        color: NothingScheme.of(context).answer,
                        size: 32,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: AutoSizeText(
                    TextModel.of(context).text ?? '',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: NothingScheme.of(context).answer,
                    ),
                    maxLines: 2,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
