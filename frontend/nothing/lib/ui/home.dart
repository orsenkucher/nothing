import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nothing/bloc/questions/bloc.dart';
import 'package:nothing/color/scheme.dart';
import 'package:nothing/ui/cardsmaster.dart';
import 'package:nothing/ui/previous.dart';
import 'package:nothing/ui/slidermaster.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    BlocProvider.of<QuestionsBloc>(context).add(FetchQuestions());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: NothingScheme.of(context).background,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.max,
            children: [
              Previous(height: 80),
              const SliderMaster(height: 12),
              Expanded(
                child: SizedBox.expand(
                  child: const CardsMaster(),
                ),
              ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
