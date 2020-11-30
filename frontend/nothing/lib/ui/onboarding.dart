import 'package:flutter/material.dart';
import 'package:nothing/bloc/onboard/bloc.dart';
import 'package:nothing/color/scheme.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Onboarding extends StatefulWidget {
  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  int _currentPage = 0;
  int _totalPages = 3;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: 0,
      keepPage: true,
      viewportFraction: 1.0,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: PageView(
            physics: ClampingScrollPhysics(),
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            children: [_Video(), _Video(), _Video()],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _buildPageIndicator(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            _currentPage == 0
                ? 'Use your keyboard'
                : _currentPage == 1
                    ? 'Something else'
                    : 'We will help you!',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: NothingScheme.of(context).label,
            ),
          ),
        ),
        Text(
          _currentPage == 0
              ? 'All answers you will give using your\nkeyboard and brain!'
              : 'If you are stuck you can always use our\nhints!',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w100,
            color: NothingScheme.of(context).label,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(28.0),
          child: FlatButton(
            padding: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 36,
            ),
            color: NothingScheme.of(context).knob,
            child: Text(_currentPage == _totalPages - 1 ? 'Play!' : 'Next', style: TextStyle(fontSize: 16)),
            onPressed: () {
              if (_currentPage == _totalPages - 1) {
                print('play');
                context.read<OnboardBloc>().complete();
              }
              print('next');
              _pageController.nextPage(
                duration: Duration(milliseconds: 250),
                curve: Curves.ease,
              );
            },
            shape: RoundedRectangleBorder(
              borderRadius: NothingScheme.of(context).hintBorder,
            ),
          ),
        ),
      ],
    );
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      height: 6.0,
      width: isActive ? 24.0 : 6.0,
      decoration: BoxDecoration(color: NothingScheme.of(context).knob, borderRadius: BorderRadius.circular(12)),
    );
  }

  List<Widget> _buildPageIndicator() {
    var list = <Widget>[];
    for (var i = 0; i < _totalPages; i++) {
      list.add(_indicator(i == _currentPage));
    }
    return list;
  }
}

class _Video extends StatefulWidget {
  @override
  _VideoState createState() => _VideoState();
}

class _VideoState extends State<_Video> {
  VideoPlayerController _videoController;
  Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    _videoController = VideoPlayerController.asset("assets/onboarding.mp4");
    _initializeVideoPlayerFuture = _videoController.initialize();
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.max, children: [
      Expanded(
        child: FutureBuilder(
          future: _initializeVideoPlayerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              _videoController.play();
              return AspectRatio(
                aspectRatio: _videoController.value.aspectRatio,
                child: VideoPlayer(_videoController),
              );
            }
            return SizedBox.shrink();
          },
        ),
      ),
    ]);
  }
}
