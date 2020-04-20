import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nothing/bloc/feed/bloc.dart';
import 'package:nothing/color/scheme.dart';
import 'package:nothing/ignitor/ignitor.dart';

class Question extends StatelessWidget {
  const Question({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 8,
      ),
      child: BlocBuilder<FeedBloc, Ignitable<FeedState>>(
        builder: (context, state) => AutoSizeText(
          state.payload.when(
            available: (tree) => tree.question.question,
            empty: () => '',
          ),
          maxLines: 6,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 44,
            fontWeight: FontWeight.bold,
            color: NothingScheme.of(context).question,
          ),
        ),
      ),
    );
  }
}
