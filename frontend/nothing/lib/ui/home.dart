import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nothing/bloc/feed/bloc.dart';
import 'package:nothing/bloc/questions/bloc.dart';
import 'package:nothing/color/scheme.dart';

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
        child: Stack(
          children: [
            BlocBuilder<FeedBloc, Feed>(
              builder: (context, state) {
                if (state is Feed) {
                  print(state.batch.length);
                  return GestureDetector(
                    onTap: () =>
                        BlocProvider.of<FeedBloc>(context).add(MoveNext()),
                    child: Container(
                      color: Colors.white,
                      child: ListView(
                        children:
                            state.batch.map((q) => Text(q.question)).toList(),
                      ),
                    ),
                  );
                } else {
                  return Container();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
