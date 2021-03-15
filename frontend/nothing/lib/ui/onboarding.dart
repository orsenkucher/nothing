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
  int _total = 2;
  int _current = 0;
  bool _loaded = false;

  final PageController _pages = PageController(
    initialPage: 0,
    keepPage: true,
    viewportFraction: 1.0,
  );

  final List<VideoPlayerController> _videos = [
    VideoPlayerController.asset("assets/onboarding1.mp4"),
    VideoPlayerController.asset("assets/onboarding2.mp4"),
  ];

  @override
  void initState() {
    super.initState();
    Future.wait(_videos.map((vid) => vid.initialize())).then(
      (value) => setState(() {
        _loaded = true;
        _videos.first.play();
      }),
    );
  }

  @override
  void dispose() {
    _pages.dispose();
    _videos.forEach((vid) => vid.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.max, mainAxisAlignment: MainAxisAlignment.start, children: [
      Expanded(
        flex: 2,
        child: PageView.builder(
          physics: BouncingScrollPhysics(),
          controller: _pages,
          onPageChanged: (int page) async {
            setState(() => _current = page);
            await _videos[_current].seekTo(Duration.zero);
            await _videos[_current].play();
          },
          itemCount: _total,
          itemBuilder: (context, i) {
            if (!_loaded) return SizedBox.shrink();
            final controller = _videos[i];
            return _Video(controller);
          },
        ),
      ),
      Expanded(
        flex: 1,
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildPageIndicator(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              _current == 0 ? 'Use your keyboard' : 'We will help you!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: NothingScheme.of(context).label,
              ),
            ),
          ),
          Text(
            _current == 0
                ? 'All answers you will give using your\nkeyboard and brain!'
                : 'If you are stuck you can always use our\nhints!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w100,
              color: NothingScheme.of(context).label,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 28.0),
            child: TextButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all(const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 36,
                )),
                backgroundColor: MaterialStateProperty.all(
                  NothingScheme.of(context).knob,
                ),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: NothingScheme.of(context).hintBorder,
                )),
              ),
              child: Text(_current == _total - 1 ? 'Play!' : 'Next', style: TextStyle(fontSize: 16)),
              onPressed: () {
                if (_current == _total - 1) {
                  context.read<OnboardBloc>().complete();
                }
                _pages.nextPage(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.ease,
                );
              },
            ),
          )
        ]),
      ),
    ]);
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
    for (var i = 0; i < _total; i++) {
      list.add(_indicator(i == _current));
    }
    return list;
  }
}

class _Video extends StatefulWidget {
  final VideoPlayerController _videoController;
  _Video(this._videoController);
  @override
  _VideoState createState() => _VideoState();
}

class _VideoState extends State<_Video> {
  @override
  Widget build(BuildContext context) {
    final ratio = widget._videoController.value.aspectRatio;
    const pad = 16.0;
    return Padding(
      padding: const EdgeInsets.only(
        left: pad,
        right: pad,
        bottom: 2 * pad,
      ),
      child: Stack(children: [
        Center(
          child: AspectRatio(
            aspectRatio: ratio,
            child: VideoPlayer(widget._videoController),
          ),
        ),
      ]),
    );
  }
}
