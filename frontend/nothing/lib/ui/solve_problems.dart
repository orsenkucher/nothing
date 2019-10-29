import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nothing/bloc/problem/bloc.dart';
import 'package:nothing/bloc/problems/bloc.dart';
import 'package:nothing/data/model/problem.dart';

class SolveProblems extends StatefulWidget {
  final int count;

  const SolveProblems({
    @required this.count,
  });

  @override
  _SolveProblemsState createState() => _SolveProblemsState();
}

class _SolveProblemsState extends State<SolveProblems> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    BlocProvider.of<ProblemsBloc>(context).add(
      FetchProblems(
        count: widget.count,
      ),
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
        return Placeholder();
      },
    );
  }
}

class LoadingCircle extends StatelessWidget {
  const LoadingCircle({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 250,
        height: 250,
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
          strokeWidth: 12,
        ),
      ),
    );
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
  String currentText = "";
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
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: focusNode.unfocus,
                child: QuestionBox(),
              ),
            ),
            Flexible(
              flex: 54,
              child: AnswerBox(
                focusNode: focusNode,
                currentText: currentText,
              ),
            ),
          ],
        ),
        _spawnHiddenTextField(),
      ],
    );
  }

  Container _spawnHiddenTextField() {
    return Container(
      width: 1,
      height: 1,
      child: FittedBox(
        fit: BoxFit.none,
        child: Container(
          width: 200,
          height: 200,
          child: TextField(
            autocorrect: false,
            autofocus: false,
            onSubmitted: (s) {
              print(s);
              BlocProvider.of<ProblemBloc>(context).add(AnsweredProblem(
                id: 0,
                correct: true, // TODO: only for now
              ));
            },
            keyboardAppearance: Brightness.light,
            maxLength: 12,
            focusNode: focusNode,
            onChanged: (s) => setState(() {
              currentText = s;
            }),
            showCursor: false,
            textInputAction: TextInputAction.next,
          ),
        ),
      ),
    );
  }
}

class AnswerBox extends StatelessWidget {
  const AnswerBox({
    Key key,
    @required this.focusNode,
    @required this.currentText,
  }) : super(key: key);

  final FocusNode focusNode;
  final String currentText;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 60,
        vertical: 40,
      ),
      height: 78,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(28),
      ),
      child: Center(
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            focusNode.unfocus();
            focusNode.requestFocus();
          },
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                width: 215,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28),
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.black,
                    width: 4,
                  ),
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
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                  size: 35,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class QuestionBox extends StatelessWidget {
  const QuestionBox();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.vertical(
          top: Radius.zero,
          bottom: Radius.circular(28),
        ),
      ),
      child: Align(
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
    );
  }
}
