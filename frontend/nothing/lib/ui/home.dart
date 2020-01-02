import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nothing/bloc/feed/bloc.dart';
import 'package:nothing/bloc/questions/bloc.dart';
import 'package:nothing/color/scheme.dart';
import 'package:nothing/ui/playdeck.dart';
import 'package:nothing/ui/statsbar.dart';

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
            Padding(
              padding: EdgeInsets.only(top: 50, right: 30, left: 30),
              child: BlocBuilder<FeedBloc, Feed>(builder: (context, state) {
                if (state is Feed && state.prevBatch.length > 0) {
                  final q = state.prevBatch.first;
                  print(
                      '${q.leftn} / (${q.leftn + q.rightn}) = ${q.leftn / (q.leftn + q.rightn)}');
                  return StatsBar(
                    value: q.leftn + q.rightn != 0
                        ? q.leftn / (q.leftn + q.rightn)
                        : 0,
                    height: 50,
                    left: q.left,
                    right: q.right,
                  );
                }
                return StatsBar(
                  value: 0,
                  height: 50,
                );
              }),
            ),
            PlayDeck(),
            // BlocBuilder<FeedBloc, Feed>(
            //   builder: (context, state) {
            //     if (state is Feed && state.batch.length > 0) {
            //       // TODO: fix length check
            //       print(state.batch.length);
            //       return PlayDeck(
            //         qus: state.batch,
            //       );
            //       // return GestureDetector(
            //       //   onTap: () =>
            //       //       BlocProvider.of<FeedBloc>(context).add(MoveNext()),
            //       //   child: Container(
            //       //     color: Colors.white,
            //       //     child: ListView(
            //       //       children:
            //       //           state.batch.map((q) => Text(q.question)).toList(),
            //       //     ),
            //       //   ),
            //       // );
            //     } else {
            //       return Container();
            //     }
            //   },
            // ),
          ],
        ),
      ),
      // Container(
      //   color: Color(0xff1d2021), //Colors.blue,
      //   // child: dev.Cards(
      //   child: Stack(
      //     children: [

      //       BlocBuilder<QuestionsBloc, QuestionsState>(
      //         builder: (context, state) {
      //           return state is LoadingQuestions
      //               ? LoadingCircle()
      //               : state is LoadedQuestions
      //                   ? PlayDeck(qus: state.qus)
      //                   : Container();
      //         },
      //       ),
      //     ],
      //   ),
      // )
    );
  }
}
