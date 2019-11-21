import 'dart:ui';
import 'dart:ui' as prefix0;

import 'package:flutter/material.dart';
import 'package:nothing/ui/cards.dart';
import 'package:nothing/ui/deck.dart';
import 'package:nothing/ui/powercard.dart';
import 'package:nothing/ui/solve_problems.dart';
import 'package:nothing/ui/swipecard.dart' as swp;
import 'package:nothing/ui/tinder.dart';
import 'package:nothing/ui/dev/cards.dart' as dev;

import 'package:nothing/ui/dev/cards2.dart';

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
        // child: dev.Cards(
        child: Cards2(
          cardBuilder: (context, child, index, lerp) {
            // print(lerp);
            var colors = Colors.primaries;
            Color color = colors[(colors.length + index * 6) % colors.length];
            color = Colors.white;
            return Material(
              shadowColor: Colors.black.withAlpha(60),
              borderRadius: BorderRadius.circular(28),
              elevation: lerpDouble(1, 7, lerp),
              color: color,
              child: child,
            );
          },
          contentBuilder: (context, index, lerp) {
            lerp = (lerp * 6).clamp(-1.0, 1.0);
            var colorRight = Color(0xffEAEAEA);
            var colorLeft = Color(0xffEAEAEA);
            if (lerp > 0)
              colorRight = Color.lerp(
                Color(0xffEAEAEA),
                Color(0xff56D16C),
                lerp.abs(),
              );
            if (lerp < 0)
              colorLeft = Color.lerp(
                Color(0xffEAEAEA),
                Colors.red,
                lerp.abs(),
              );
            return Padding(
              padding: EdgeInsets.all(20),
              child: Container(
                  color: Colors.white,
                  child: Stack(
                    children: [
                      Align(
                          alignment: Alignment.topRight,
                          child: Text('True',
                              style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                  color: colorRight))),
                      Align(
                          alignment: Alignment.bottomLeft,
                          child: Text('False',
                              style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                  color: colorLeft))),
                      Align(
                          alignment: Alignment.center,
                          child: Text(
                              'Have you achieved any of your recent goals?',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)))
                    ],
                  )),
            );
          },
          stackCount: 3,
          totalCount: 24,
          heightFactor: 0.60,
          widthFactor: 0.85,
          // infinite: false,
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
