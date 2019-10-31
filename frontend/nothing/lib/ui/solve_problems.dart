import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nothing/bloc/problem/bloc.dart';
import 'package:nothing/bloc/problems/bloc.dart';
import 'package:nothing/data/model/problem.dart';

class SolveProblems extends StatefulWidget {
  const SolveProblems();

  @override
  _SolveProblemsState createState() => _SolveProblemsState();
}

class _SolveProblemsState extends State<SolveProblems> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    BlocProvider.of<ProblemsBloc>(context).add(
      FetchProblems(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProblemsBloc, ProblemsState>(
      builder: (context, state) {
        if (state is LoadingProblems) {
          return LoadingCircle();
        }
        if (state is LoadedProblems) {
          return _SolveProblems(state.problems);
        }
        if (state is LoadingError) {
          return ErrorMessage(state: state);
        }
        return Container();
      },
    );
  }
}

class ErrorMessage extends StatelessWidget {
  final LoadingError state;

  const ErrorMessage({
    @required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        state.error.error,
        style: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class LoadingCircle extends StatelessWidget {
  const LoadingCircle({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Center(
        child: SizedBox(
          width: 250,
          height: 250,
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
            strokeWidth: 12,
          ),
        ),
      ),
      Center(
        child: SizedBox(
          width: 250 - 12 * 3.0,
          height: 250 - 12 * 3.0,
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
            strokeWidth: 12,
            value: 1.1,
          ),
        ),
      ),
    ]);
  }
}

class _SolveProblems extends StatefulWidget {
  final List<Problem> problems;
  const _SolveProblems(this.problems);

  @override
  __SolveProblemsState createState() => __SolveProblemsState();
}

class __SolveProblemsState extends State<_SolveProblems> {
  FocusNode focusNode;
  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: Colors.white, // 0xAAffcc33
          ),
        ),
        Column(
          children: <Widget>[
            Flexible(
              flex: 46,
              child: QuestionBox(
                focusNode: focusNode,
                questionCount: widget.problems.length,
              ),
            ),
            Flexible(
              flex: 54,
              child: AnswerBox(
                focusNode: focusNode,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class AnswerBox extends StatefulWidget {
  const AnswerBox({
    @required this.focusNode,
  });

  final FocusNode focusNode;

  @override
  _AnswerBoxState createState() => _AnswerBoxState();
}

class _AnswerBoxState extends State<AnswerBox> {
  final textController = TextEditingController();
  String currentText = "";

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  final borderRadius = 28.0;
  final gapWidth = 4.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 60,
        vertical: 40,
      ),
      height: 78,
      child: Material(
        color: Colors.black,
        borderRadius: BorderRadius.circular(borderRadius),
        elevation: 0,
        child: InkWell(
          borderRadius: BorderRadius.circular(borderRadius),
          splashColor: Color(0xFF2ecc71),
          highlightColor: Colors.transparent,
          onTap: () => _submit(textController.text),
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                _spawnHiddenTextField(),
                _spawnTextArea(),
                _spawnArrow(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding _spawnArrow() {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Icon(
        Icons.arrow_forward,
        color: Colors.white,
        size: 35,
      ),
    );
  }

  GestureDetector _spawnTextArea() {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        widget.focusNode.unfocus();
        widget.focusNode.requestFocus();
      },
      child: Container(
        width: 215,
        margin: EdgeInsets.all(gapWidth),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius - gapWidth),
          color: Colors.white,
        ),
        child: Center(
          child: Text(
            currentText,
            style: TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _spawnHiddenTextField() {
    return Container(
      width: 1,
      height: 1,
      child: FittedBox(
        fit: BoxFit.none,
        child: Container(
          width: 200,
          height: 200,
          child: TextField(
            controller: textController,
            autocorrect: false,
            autofocus: false,
            onSubmitted: _submit,
            keyboardAppearance: Brightness.light,
            maxLength: 12,
            focusNode: widget.focusNode,
            onChanged: (s) => setState(() => currentText = s),
            showCursor: false,
            textInputAction: TextInputAction.next,
          ),
        ),
      ),
    );
  }

  void _submit(String s) {
    if (s.trim().isEmpty) {
      return;
    }
    print(s);
    textController.clear();
    setState(() => currentText = "");
    BlocProvider.of<ProblemBloc>(context).add(
      AnsweredProblem(answer: s),
    );
  }
}

class QuestionBox extends StatelessWidget {
  final FocusNode focusNode;
  final int questionCount;

  const QuestionBox({
    @required this.focusNode,
    @required this.questionCount,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: focusNode.unfocus,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.vertical(
            top: Radius.zero,
            bottom: Radius.circular(28),
          ),
        ),
        child: Stack(
          children: <Widget>[
            Align(
              child: BlocBuilder<ProblemBloc, ProblemState>(
                  builder: (context, state) {
                if (state is NewProblem) {
                  return Text(
                    state.problem.question,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                }
                return Container();
              }),
            ),
            Positioned(
              bottom: 10,
              right: 20,
              child: Row(
                children: <Widget>[
                  Text(
                    "Tap to hide ",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(
                    Icons.keyboard,
                    color: Colors.white,
                  )
                ],
              ),
            ),
            Positioned(
              bottom: 10,
              left: 20,
              child: BlocBuilder<ProblemBloc, ProblemState>(
                builder: (context, state) {
                  if (state is NewProblem) {
                    return Text(
                      "${state.index} of $questionCount",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  }
                  return Container();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
