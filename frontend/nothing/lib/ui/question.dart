import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:nothing/bloc/feed/bloc.dart';
import 'package:nothing/color/scheme.dart';

class Question extends HookWidget {
  const Question(
    this.wait, {
    Key key,
  }) : super(key: key);

  final ValueNotifier<bool> wait;

  @override
  Widget build(BuildContext context) {
    final question = useState(context.bloc<FeedBloc>().state);
    useEffect(() {
      final listener = () {
        if (!wait.value) {
          question.value = context.bloc<FeedBloc>().state;
        }
      };
      final sub = context.bloc<FeedBloc>().listen((_) => listener());
      wait.addListener(listener);
      return () {
        wait.removeListener(listener);
        sub.cancel();
      };
    });
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 8,
      ),
      child: AutoSizeText(
        question.value.payload.when(
          available: (tree) => tree.question.question,
          pending: (oldTree, _) => oldTree.question.question,
          empty: () => '',
        ),
        maxLines: 7,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 44,
          fontWeight: FontWeight.bold,
          color: NothingScheme.of(context).question,
        ),
      ),
    );
  }
}
