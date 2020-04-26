import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nothing/bloc/ad/bloc.dart';
import 'package:nothing/bloc/coin/bloc.dart';
import 'package:nothing/bloc/feed/bloc.dart';
import 'package:nothing/bloc/validation/bloc.dart';
import 'package:nothing/color/scheme.dart';
import 'package:nothing/domain/domain.dart' as domain;
import 'package:nothing/ignitor/ignitor.dart';
import 'package:nothing/model/text.dart';
import 'package:nothing/ui/cointext.dart';
import 'package:nothing/ui/history.dart';
import 'package:nothing/ui/answer.dart';
import 'package:nothing/ui/knob.dart';
import 'package:nothing/ui/label.dart';
import 'package:nothing/ui/question.dart';

// TODO(refactor)
class Home extends StatefulWidget {
  const Home();
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  FocusNode _focusNode;
  final _textController = TextEditingController();
  final _model = TextModel();
  final _pageController = PageController(initialPage: 1);
  AnimationController _swipeTintController;
  AnimationController _hintTintController;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _swipeTintController = AnimationController(vsync: this);
    _hintTintController = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _textController.dispose();
    _swipeTintController.dispose();
    _hintTintController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _refocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NothingScheme.of(context).background,
      body: NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          if (scrollNotification is ScrollUpdateNotification) {
            final metrics = scrollNotification.metrics;
            final offset = (metrics.viewportDimension - metrics.pixels).abs();
            final value = (offset / metrics.viewportDimension).clamp(0.0, 1.0);
            _swipeTintController.value = value;
            _swipeTintController.notifyListeners();
          }
          return false;
        },
        child: PageView(
          controller: _pageController,
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          children: [
            _buildMenu(context),
            _buildMain(context),
            _buildHistory(context),
          ],
          onPageChanged: (i) {
            switch (i) {
              case 1:
                _refocus();
                break;
              default:
                _focusNode.unfocus();
            }
          },
        ),
      ),
    );
  }

  Widget _buildMenu(BuildContext context) {
    ontap() {
      const duration = Duration(milliseconds: 300);
      const curve = Curves.easeInOut;
      _pageController.animateToPage(1, duration: duration, curve: curve);
    }

    return Container(
      color: Colors.amber,
      child: Stack(
        children: [
          GestureDetector(onTap: ontap),
          Padding(
            padding: const EdgeInsets.only(right: 100),
            child: Container(color: NothingScheme.of(context).background),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40, bottom: 32),
                  child: Text('Меню', style: TextStyle(fontSize: 36)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Card(
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: () {
                          const tt = [
                            'Звук',
                            'Оцените нас',
                            'Оставить остзыв',
                            'Поделиться',
                            'Вибрация',
                          ];
                          return tt
                              .map((t) =>
                                  Text(t, style: TextStyle(fontSize: 24)))
                              .map((w) => Padding(
                                  child: w,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 16)));
                        }()
                            .expand((w) sync* {
                              yield const Divider();
                              yield w;
                            })
                            .skip(1)
                            .toList(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(40),
              child: IconButton(
                icon: Icon(Icons.arrow_forward_ios),
                onPressed: ontap,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHistory(BuildContext context) {
    ontap() {
      const duration = Duration(milliseconds: 300);
      const curve = Curves.easeInOut;
      _pageController.animateToPage(1, duration: duration, curve: curve);
    }

    return Container(
      color: Colors.amber,
      child: Stack(
        children: [
          GestureDetector(onTap: ontap),
          Padding(
            padding: const EdgeInsets.only(left: 100),
            child: Container(
              color: NothingScheme.of(context).background,
              child: HistoryStack(),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.all(40),
              child: Text('Уровни', style: TextStyle(fontSize: 36)),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(40),
              child: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: ontap,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMain(BuildContext context) {
    return Container(
      color: NothingScheme.of(context).background,
      child: ScopedModel<TextModel>(
        model: _model,
        child: Stack(
          children: [
            _buildGame(context),
            _gestureDetector(context),
            _buildTitleKnobs(context),
            _buildHintButtons(context),
            _buildTinter(context, _hintTintController),
            if (_showHint) _buildHint(context),
            _buildTinter(context, _swipeTintController),
            BlocListener<ValidationBloc, ValidationState>(
              child: _inputPoint(_model),
              listener: (context, state) {
                state.maybeWhen(
                  just: (just) => just.maybeMap(
                    orElse: () {
                      _textController.clear();
                      _model.update('');
                    },
                    neutral: (_) {},
                  ),
                  orElse: () {},
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  IgnorePointer _buildTinter(
    BuildContext context,
    AnimationController controller,
  ) {
    final anim = ColorTween(
      begin: Colors.black.withOpacity(0.0),
      end: Colors.black.withOpacity(0.1),
    ).animate(CurvedAnimation(
      curve: Curves.easeInOut,
      parent: controller,
    ));
    return IgnorePointer(
      child: AnimatedBuilder(
        animation: controller,
        builder: (context, child) => Container(
          color: anim.value,
        ),
      ),
    );
  }

  void _refocus() {
    _focusNode.unfocus();
    _focusNode.requestFocus();
  }

  Widget _gestureDetector(BuildContext context) {
    return Center(
      child: FractionallySizedBox(
        widthFactor: 0.6,
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          // child: Container(color: Colors.green.withOpacity(0.3)),
          onTap: _refocus,
        ),
      ),
    );
  }

  Widget _inputPoint(TextModel model) {
    return Visibility(
      visible: false,
      maintainState: true,
      child: TextField(
        focusNode: _focusNode,
        controller: _textController,
        enableSuggestions: false,
        autocorrect: false,
        maxLength: 32,
        keyboardAppearance: NothingScheme.of(context).brightness,
        keyboardType: TextInputType.text,
        onSubmitted: (s) async {
          print(s);
          _focusNode.requestFocus();
          if (s.isNotEmpty) {
            context.bloc<ValidationBloc>().add(ValidationEvent.check(s));
          }
          // model.update(s);
          // if (true) {
          //   // clear
          //   _controller.clear();
          //   model.update('');
          //   // Vibrate.feedback(FeedbackType.success);
          // } else {
          //   // dont clear
          //   // Vibrate.feedback(FeedbackType.warning);
          // }
        },
        textInputAction: TextInputAction.go,
        onChanged: (s) {
          model.update(s);
          print(s);
        },
      ),
    );
  }

  var _showHint = false;
  Widget _buildHint(BuildContext context) {
    return SafeArea(child: LayoutBuilder(builder: (context, constraints) {
      final top = labelH + 24; //+ 21 + 28 + 8 + 12;
      double hei = min(
        280,
        constraints.biggest.height - (labelH + ansH + 21 + 28 + 12 + 8),
      );
      hei += labelH + ansH - 20;
      const hor = 20.0;
      return Stack(children: [
        Positioned(
          top: top,
          left: hor,
          right: hor,
          child: Material(
            elevation: 8,
            shadowColor: Colors.black.withOpacity(0.3),
            borderRadius: BorderRadius.circular(16),
            child: SizedBox(
              height: hei,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 12),
                        child: BlocBuilder<FeedBloc, Ignitable<FeedState>>(
                          builder: (context, state) => AutoSizeText(
                            state.payload.when(
                              available: (tree) => tree.question.explanation,
                              empty: () => '',
                            ),
                            maxLines: 4,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 32),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(bottom: 12),
                    alignment: Alignment.bottomCenter,
                    child: FlatButton(
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 36,
                      ),
                      color: NothingScheme.of(context).knob,
                      child: Text('Close', style: TextStyle(fontSize: 16)),
                      onPressed: () {
                        //TODO(hint)
                        setState(() {
                          _showHint = false;
                        });
                        _hintTintController.fling(velocity: -1);
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: NothingScheme.of(context).hintBorder,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ]);
    }));
  }

  Widget _buildTitleKnobs(BuildContext context) {
    const duration = Duration(milliseconds: 300);
    const curve = Curves.easeInOut;
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _makeKnob(
            Icons.short_text,
            () => _pageController.animateToPage(0,
                duration: duration, curve: curve),
          ),
          _makeKnob(
            Icons.all_inclusive,
            () => _pageController.animateToPage(2,
                duration: duration, curve: curve),
          ),
        ],
      ),
    );
  }

  Widget _buildHintButtons(BuildContext context) {
    return SafeArea(child: LayoutBuilder(
      builder: (context, constraints) {
        double queH = min(
          280,
          constraints.biggest.height - (labelH + ansH + 21 + 28 + 8 + 12),
        );
        const pad = 8;
        const hor = 40.0;
        final top = queH + labelH + ansH + pad;
        text(String text) =>
            Text(text, style: TextStyle(color: Colors.white, fontSize: 18));
        const ll = {'hint': 'Хинт', 'skip': 'Скип'};
        final cc = {
          'hint': NothingScheme.of(context).hint,
          'skip': NothingScheme.of(context).skip,
        };
        final ii = {'hint': Icons.lightbulb_outline, 'skip': Icons.clear};
        final pp = {
          'hint': () => _hintClick(context),
          'skip': () {},
        };
        final bb = ['hint', 'skip']
            .map(
          (l) => Expanded(
            child: FlatButton(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
              color: cc[l],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    ii[l],
                    size: 24,
                    color: Colors.white,
                  ),
                  // SizedBox(width: 4),
                  text(ll[l]),
                ],
              ),
              onPressed: pp[l],
              shape: RoundedRectangleBorder(
                borderRadius: NothingScheme.of(context).hintBorder,
              ),
            ),
          ),
        )
            .expand((w) sync* {
          yield w;
          yield const SizedBox(width: 16);
          // yield Container(width: 16, height: 10, color: Colors.red);
        });
        return Stack(
          children: [
            Positioned(
              top: top,
              left: hor,
              right: hor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  ...bb,
                  Row(children: [
                    CircleAvatar(
                        backgroundColor: NothingScheme.of(context).knob,
                        foregroundColor: Colors.black,
                        child: Icon(Icons.vpn_key)),
                    SizedBox(width: 4),
                    CoinText(),
                  ]),
                ],
              ),
            ),
          ],
        );
      },
    ));
  }

  // TODO(hint)
  void _hintClick(BuildContext context) async {
    setState(() {
      _showHint = true;
      _hintTintController.fling();
    });
    context.bloc<CoinBloc>().add(CoinEvent.dec(2));
  }

  InterstitialAd myInterstitial;

  void _createAd() {
    myInterstitial = InterstitialAd(
      // adUnitId: Platform.isIOS // interstitial ios/android
      //     ? 'ca-app-pub-3169956978186495/7272148845'
      //     : 'ca-app-pub-3169956978186495/2443683360',
      adUnitId: InterstitialAd.testAdUnitId,
      targetingInfo: MobileAdTargetingInfo(),
      listener: (MobileAdEvent event) async {
        // event.
        print("InterstitialAd event is $event");
        if (event == MobileAdEvent.loaded) {
          // await myInterstitial.show(
          //   anchorType: AnchorType.bottom,
          //   anchorOffset: 0.0,
          //   horizontalCenterOffset: 0.0,
          // );
        }
        if (event == MobileAdEvent.closed) {
          print("CLOSED");
          // context.bloc<CoinBloc>().add(CoinEvent.inc(3));
          await myInterstitial.load();
        }
      },
    );
  }

  void _showAd(BuildContext context) async {
    context.bloc<AdBloc>().add(AdEvent.report(domain.AdType.interstitial));
    print('****** Loading new ad');
    final result = await myInterstitial.load();
    if (!result) {
      print('\t ****** Ad did not load');
      return;
    }
    print('****** Loaded ad successfully');
    await myInterstitial.show(
      anchorType: AnchorType.bottom,
      anchorOffset: 0.0,
      horizontalCenterOffset: 0.0,
    );
    // myInterstitial.dispose()
  }

  double labelH = 50;
  double ansH = 72;
  Widget _buildGame(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          double queH = min(
            280,
            constraints.biggest.height - (labelH + ansH + 21 + 28 + 8 + 12),
          );
          return Column(children: [
            SizedBox(height: 21),
            SizedBox(child: Label()),
            SizedBox(height: 12),
            SizedBox(height: queH, child: Center(child: Question())),
            SizedBox(height: ansH, child: Answer()),
          ]);
        },
      ),
    );
  }

  Widget _makeKnob(IconData icon, [Function onPress]) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 16),
      child: Knob(icon, onPress),
    );
  }
}
