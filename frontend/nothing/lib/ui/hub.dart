// import 'dart:ui';
// import 'dart:ui' as prefix0;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nothing/bloc/questions/bloc.dart';
// import 'package:nothing/ui/cards.dart';
// import 'package:nothing/ui/deck.dart';
// import 'package:nothing/ui/powercard.dart';
// import 'package:nothing/ui/solve_problems.dart';
// import 'package:nothing/ui/swipecard.dart' as swp;
// import 'package:nothing/ui/tinder.dart';
// import 'package:nothing/ui/dev/cards.dart' as dev;

// import 'package:nothing/ui/dev/cards2.dart';
import 'package:nothing/ui/playdeck.dart';
import 'package:nothing/ui/solve_problems.dart';
import 'package:firebase_admob/firebase_admob.dart';

class Hub extends StatefulWidget {
  @override
  _HubState createState() => _HubState();
}

class _HubState extends State<Hub> {
  final String adId = 'ca-app-pub-3169956978186495~8308569350';
  @override
  void initState() {
    super.initState();
    FirebaseAdMob.instance.initialize(appId: adId);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    BlocProvider.of<QuBloc>(context).add(
      FetchQus(),
    );
  }

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    // CardController controller;
    // List<String> welcomeImages = [
    //   "assets/welcome0.png",
    //   "assets/welcome1.png",
    //   "assets/welcome2.png",
    //   "assets/welcome2.png",
    //   "assets/welcome1.png",
    //   "assets/welcome1.png"
    // ];
// child: BlocBuilder<ProblemsBloc, ProblemsState>(
//           builder: (context, state) => state is LoadedProblems
//               ? Question(state$: state)
//               : state is LoadingProblems
//                   ? LoadingCircle()
//                   : state is LoadingError
//                       ? ErrorMessage(state: state)
//                       : Container(),
    return Scaffold(
      body: Container(
        color: Colors.blue,
        // child: dev.Cards(
        child: BlocBuilder<QuBloc, QusState>(
          builder: (context, state) {
            return state is LoadingQus
                ? LoadingCircle()
                : state is LoadedQus ? PlayDeck(qus: state.qus) : Container();
          },
        ),
      ),

      // body: CardDeck(
      //   totalCount: 10,
      //   stackCount: 4,
      //   cardBuilder: (context, idx, isActive) {
      //     return Card(
      //       elevation: isActive ? 7 : 1,
      //       child: FractionallySizedBox(
      //         widthFactor: 0.85,
      //         heightFactor: 0.85,
      //         child: Center(
      //           child: Text(
      //             "$idx",
      //             style: TextStyle(
      //               fontSize: 180,
      //               fontWeight: FontWeight.bold,
      //             ),
      //           ),
      //         ),
      //       ),
      //     );
      //   },
      // ),

      // body: swp.SwipeCard(
      //   horizontalMultiplier: 0.7, //1.25
      //   verticalMultiplier: 0.0,
      //   child: FractionallySizedBox(
      //     widthFactor: 0.9,
      //     heightFactor: 0.9,
      //     child: _spawnContent(),
      //   ),
      // ),

      // body: Cards(
      //   cardSize: Size(
      //     size.width * .8,
      //     size.height * .8,
      //   ),
      //   children: <Widget>[
      //     _spawnContent(),
      //     _spawnContent(),
      //     _spawnContent(),
      //   ],
      // ),

      // body: TinderSwapCard(
      //     orientation: AmassOrientation.BOTTOM,
      //     totalNum: 6,
      //     stackNum: 3,
      //     swipeEdge: 4.0,
      //     maxWidth: MediaQuery.of(context).size.width * 0.9,
      //     maxHeight: MediaQuery.of(context).size.width * 0.9,
      //     minWidth: MediaQuery.of(context).size.width * 0.8,
      //     minHeight: MediaQuery.of(context).size.width * 0.8,
      //     cardBuilder: (context, index) => Card(
      //           child: Text('${welcomeImages[index]}'),
      //         ),
      //     cardController: controller = CardController(),
      //     swipeUpdateCallback: (DragUpdateDetails details, Alignment align) {
      //       /// Get swiping card's alignment
      //       if (align.x < 0) {
      //         //Card is LEFT swiping
      //       } else if (align.x > 0) {
      //         //Card is RIGHT swiping
      //       }
      //     },
      //     swipeCompleteCallback: (CardSwipeOrientation orientation, int index) {
      //       /// Get orientation & index of swiped card!
      //     }),
    );
  }
}
