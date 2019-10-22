import 'package:crystalpuzzle/src/ui/curvebar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nothing',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Nothing Puzzle 2.0'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _pageIdx = 0;
  GlobalKey<CurvedNavigationBarState> _curveBarKey = GlobalKey();
  int _isAnimating = 0;

  void _setPageIdx(int idx) {
    setState(() {
      _pageIdx = idx;
    });
  }

  @override
  Widget build(BuildContext context) {
    var pageController = PageController(
      viewportFraction: .8,
      initialPage: _pageIdx,
    ); //..addListener(() => print("hello"));

    var duration = Duration(milliseconds: 320);
    var curve = Curves.easeOutCubic;

    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.blueAccent,
        elevation: 0,
      ),
      bottomNavigationBar: CurvedNavigationBar(
        key: _curveBarKey,
        backgroundColor: Colors.blueAccent,
        animationDuration: duration,
        animationCurve: curve,
        height: 54,
        items: [
          Icon(Icons.add, size: 30),
          Icon(Icons.list, size: 30),
          Icon(Icons.compare_arrows, size: 30),
        ],
        onTap: (index) {
          // if (_isAnimating) {
          //   return;
          // }
          _isAnimating++;
          pageController
              .animateToPage(index, duration: duration, curve: curve)
              .then((_) {
            _isAnimating--;
          });
          // pageController.jumpToPage(index);
          _setPageIdx(index);
        },
      ),
      body: Center(
        child: PageView.builder(
          controller: pageController,
          itemCount: 3,
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          pageSnapping: true,
          onPageChanged: (index) {
            if (_isAnimating == 0) {
              print(_isAnimating);
              _setPageIdx(index);
              _curveBarKey.currentState.setPage(index);
            }
          },
          itemBuilder: (context, i) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Current index:',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '$_pageIdx',
                  style: Theme.of(context)
                      .textTheme
                      .display1
                      .copyWith(color: Colors.white),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
