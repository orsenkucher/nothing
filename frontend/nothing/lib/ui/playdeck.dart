import 'dart:math';
import 'dart:ui';

import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nothing/bloc/questions/bloc.dart';
import 'package:nothing/data/model/question.dart';
import 'package:nothing/ui/dev/cards2.dart';

class PlayDeck extends StatefulWidget {
  final List<Question> qus;

  const PlayDeck({
    @required this.qus,
  });

  @override
  _PlayDeckState createState() => _PlayDeckState();
}

class _PlayDeckState extends State<PlayDeck> {
  InterstitialAd _myInterstitial;

  @override
  void initState() {
    super.initState();

    _initAd();
    _loadAd();
  }

  void _initAd() {
    MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
      // keywords: <String>['arcade', 'trivia', 'archero'],
      // contentUrl: 'https://flutter.io',
      childDirected: false,
      // testDevices: <String>["AB830EF6C4B9891477B08F050EED5DC1"],
    );
    _myInterstitial = InterstitialAd(
      // Replace the testAdUnitId with an ad unit id from the AdMob dash.
      // InterstitialAd.testAdUnitId,
      // "AB830EF6C4B9891477B08F050EED5DC1"
      //
      adUnitId: "ca-app-pub-3169956978186495/7272148845",
      // adUnitId: InterstitialAd.testAdUnitId,
      targetingInfo: targetingInfo,
      listener: (MobileAdEvent event) {
        print("InterstitialAd event is $event");
      },
    );
  }

  void _loadAd() {
    _myInterstitial.load();
  }

  void _showAd() {
    _myInterstitial
      // ..load()
      ..show(
        anchorType: AnchorType.bottom,
        anchorOffset: 0.0,
        horizontalCenterOffset: 0.0,
      );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<QuBloc, QusState>(
      listener: (context, state) {
        if (state is LoadedQus) {
          _loadAd();
        }
      },
      child: Cards2(
        stackCount: min(widget.qus.length, 3),
        totalCount: widget.qus.length,
        heightFactor: 0.60,
        widthFactor: 0.85,
        onSwipe: (context, idx, dr) {
          final text = 'Card $idx: ${dr < 0 ? "left" : "right"}';
          print(text);
          // final snackBar = SnackBar(content: Text(text));
          // Scaffold.of(context).hideCurrentSnackBar();
          // Scaffold.of(context).showSnackBar(snackBar);
        },
        onDone: (context) {
          print('Done');
          _showAd();
          BlocProvider.of<QuBloc>(context).add(
            FetchQus(),
          );
        },
        cardBuilder: (context, child, index, lerp) {
          // print(lerp);
          // var colors = Colors.primaries;
          // Color color = colors[(colors.length + index * 6) % colors.length];
          // color = Colors.white;
          return Material(
            shadowColor: Colors.black.withAlpha(60),
            borderRadius: BorderRadius.circular(28),
            elevation: lerpDouble(1, 7, lerp),
            // color: color,
            child: child,
          );
        },
        contentBuilder: (context, index, lerp) {
          // print(index);
          final qu = widget.qus[index];
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
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    '${qu.right}',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: colorRight,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    '${qu.left}',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: colorLeft,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    // 'Have you achieved any of your recent goals?',
                    '${qu.question}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                )
              ],
            ),
          );
        },
        // infinite: false,
      ),
    );
  }
}
