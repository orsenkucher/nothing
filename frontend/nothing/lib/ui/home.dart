import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nothing/bloc/feed/bloc.dart';
import 'package:nothing/bloc/questions/bloc.dart';
import 'package:nothing/bloc/summary/bloc.dart';
import 'package:nothing/color/scheme.dart';
import 'package:nothing/ui/cardsmaster.dart';

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
        child: Column(
          children: [
            // Slider placeholder
            Placeholder(
              color: Colors.red,
              fallbackHeight: 50,
            ),
            Expanded(
              child: CardsMaster(),
            ),
            // FeedWidget(),
          ],
        ),
      ),
    );
  }
}

class FeedWidget extends StatelessWidget {
  const FeedWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeedBloc, Feed>(
      builder: (context, state) {
        if (state is Feed) {
          return GestureDetector(
            onTap: () => BlocProvider.of<SummaryBloc>(context).add(
              NewAnswer(
                idx: state.batch[state.current].id,
                answer: true,
              ),
            ),
            child: Container(
              color: Colors.white,
              child: ListView(
                children: [
                  for (int i = 0; i < state.batch.length; i++)
                    Text(
                      '${i + 1}. ${state.batch[i].question}',
                      key: UniqueKey(),
                      style: TextStyle(
                        color: state.current == i ? Colors.green : Colors.black,
                      ),
                    ),
                ],
              ),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
