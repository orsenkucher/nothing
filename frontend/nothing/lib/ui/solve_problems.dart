import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nothing/bloc/problem/bloc.dart';
import 'package:nothing/bloc/problems/bloc.dart';

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
          color: Colors.white,
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
    final side = 120.0;
    final stroke = 8.0;
    return Stack(children: <Widget>[
      Center(
        child: SizedBox(
          width: side,
          height: side,
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            strokeWidth: stroke,
          ),
        ),
      ),
      Center(
        child: SizedBox(
          width: side - stroke * 3.0,
          height: side - stroke * 3.0,
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            strokeWidth: stroke,
            value: 1.1,
          ),
        ),
      ),
    ]);
  }
}

class SolveProblems extends StatefulWidget {
  const SolveProblems();

  @override
  _SolveProblemsState createState() => _SolveProblemsState();
}

class _SolveProblemsState extends State<SolveProblems> {
  FocusNode focusNode;
  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    BlocProvider.of<ProblemsBloc>(context).add(
      FetchProblems(),
    );
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

  final radius = 28.0;
  final gap = 4.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 60,
        vertical: 50,
      ),
      height: 78,
      child: Material(
        color: Colors.black,
        borderRadius: BorderRadius.circular(radius),
        elevation: 0,
        child: InkWell(
          borderRadius: BorderRadius.circular(radius),
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
      padding: EdgeInsets.all(12),
      child: Icon(
        Icons.arrow_forward,
        color: Colors.white,
        size: 30,
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
        width: 190,
        margin: EdgeInsets.all(gap),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius - gap),
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
            keyboardAppearance: Brightness.dark,
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

  const QuestionBox({
    @required this.focusNode,
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
        child: BlocBuilder<ProblemsBloc, ProblemsState>(
          builder: (context, state) => state is LoadedProblems
              ? Question(state$: state)
              : state is LoadingProblems
                  ? LoadingCircle()
                  : state is LoadingError
                      ? ErrorMessage(state: state)
                      : Container(),
        ),
      ),
    );
  }
}

class Question extends StatelessWidget {
  final LoadedProblems state$;

  const Question({
    this.state$,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
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
        Align(
          child:
              BlocBuilder<ProblemBloc, ProblemState>(builder: (context, state) {
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
          left: 20,
          child: BlocBuilder<ProblemBloc, ProblemState>(
            builder: (context, state) {
              if (state is NewProblem) {
                return Text(
                  "${state.index} of ${state$.problems.length}",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                );
              }
              return Container();
            },
          ),
        ),
      ],
    );
  }
}
