import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nothing/bloc/feed/bloc.dart';
import 'package:nothing/bloc/questions/bloc.dart';
import 'package:nothing/ui/cardsmaster.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

const backimg = "assets/back.png";

class _HomeState extends State<Home> {
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
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (BlocProvider.of<FeedBloc>(context).state.len < 36) {
      BlocProvider.of<QuestionsBloc>(context).add(const FetchQuestions());
    }
    focusNode.unfocus();
    focusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: ExactAssetImage(backimg),
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              TextField(
                autofocus: true,
                focusNode: focusNode,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: SizedBox.expand(
                      child: const CardsMaster(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
