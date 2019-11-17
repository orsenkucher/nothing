import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:nothing/ui/cards.dart';
import 'package:nothing/ui/deck.dart';
import 'package:nothing/ui/powercard.dart';
import 'package:nothing/ui/solve_problems.dart';
import 'package:nothing/ui/swipecard.dart' as swp;
import 'package:nothing/ui/tinder.dart';
import 'package:nothing/ui/dev/cards.dart' as dev;

class Hub extends StatelessWidget {
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

    return Scaffold(
      body: Container(
        color: Colors.blue,
        child: dev.Cards(
          cardBuilder: (context, child, index, lerp) {
            return Material(
              shadowColor: Colors.black.withAlpha(60),
              borderRadius: BorderRadius.circular(28),
              elevation: lerpDouble(1, 7, lerp), //active ? 7 : 1,
              child: child,
            );
          },
          contentBuilder: (context, index) {
            return Center(
                child: Text('$index', style: TextStyle(fontSize: 180)));
          },
          stackCount: 3,
          totalCount: 10,
          heightFactor: 0.60,
          widthFactor: 0.85,
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

  // Widget _spawnContent() {
  //   return FlutterLogo(
  //     size: 100,
  //   );
  // }
}
