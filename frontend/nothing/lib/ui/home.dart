import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
// import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:nothing/bloc/onboard/bloc.dart';
import 'package:nothing/bloc/questions/bloc.dart';
import 'package:nothing/bloc/validation/bloc.dart';
import 'package:nothing/hooks/pagecontroller.dart';
import 'package:nothing/icons/icons.dart';
import 'package:nothing/model/focusnode.dart';
import 'package:nothing/repository/likes.dart';
import 'package:nothing/ui/fade_in.dart';
import 'package:nothing/ui/menu.dart';
import 'package:nothing/ui/onboarding.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nothing/bloc/ad/bloc.dart';
import 'package:nothing/bloc/coin/bloc.dart';
import 'package:nothing/bloc/hint/bloc.dart';
import 'package:nothing/bloc/feed/bloc.dart';
import 'package:nothing/color/scheme.dart';
import 'package:nothing/domain/domain.dart' as domain;
import 'package:nothing/model/text.dart';
import 'package:nothing/ui/cointext.dart';
import 'package:nothing/ui/history.dart';
import 'package:nothing/ui/answer.dart';
import 'package:nothing/ui/knob.dart';
import 'package:nothing/ui/label.dart';
import 'package:nothing/ui/question.dart';

const swipeCurve = Curves.fastOutSlowIn;

class Home extends HookWidget {
  const Home();

  @override
  Widget build(BuildContext context) {
    final focusNodeModel = FocusNodeModel(useFocusNode());
    final swipeTintController = useAnimationController();
    final pageController = usePageController(initialPage: 1, keepPage: true);
    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback(
        (_) => focusNodeModel.refocus(),
      );
      return null;
    });

    useEffect(() {
      print("Creating initail Ad");
      _createAd(focusNodeModel);
      return null;
    }, [0]);

    return ScopedModel<FocusNodeModel>(
      model: focusNodeModel,
      child: Builder(
        builder: (context) => Scaffold(
          backgroundColor: NothingScheme.of(context).background,
          body: NotificationListener<ScrollNotification>(
            onNotification: _onScrollNotification(swipeTintController),
            child: PageView(
              controller: pageController,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(/*parent: NeverScrollableScrollPhysics()*/),
              onPageChanged: _onPageChanged(context),
              children: () {
                const duration = Duration(milliseconds: 300);
                const curve = swipeCurve;
                void onBack() {
                  pageController.animateToPage(1, duration: duration, curve: curve);
                }

                return [Menu(onBack), Main(swipeTintController, pageController), History(onBack)];
              }(),
            ),
          ),
        ),
      ),
    );
  }

  bool Function(ScrollNotification) _onScrollNotification(
    AnimationController swipeTintController,
  ) {
    return (scrollNotification) {
      // this picks up events from history verticall ScrollView,
      // so need to filter it by axis ->
      if (scrollNotification is ScrollUpdateNotification) {
        final metrics = scrollNotification.metrics;
        if (metrics.axis == Axis.vertical) return false; // <- here ~/
        final offset = (metrics.viewportDimension - metrics.pixels).abs();
        final value = (offset / metrics.viewportDimension).clamp(0.0, 1.0);
        swipeTintController.value = value;
        swipeTintController.notifyListeners();
      }
      return false;
    };
  }

  void Function(int) _onPageChanged(BuildContext context) {
    final focusNodeModel = FocusNodeModel.of(context);
    return (i) {
      switch (i) {
        case 1:
          // focusNodeModel.refocus();
          break;
        default:
          focusNodeModel.focusNode.unfocus();
      }
    };
  }
}

class Main extends StatefulHookWidget {
  const Main(this.swipeTintController, this.pageController);
  final AnimationController swipeTintController;
  final PageController pageController;

  @override
  State<StatefulWidget> createState() {
    return _MainState();
  }
}

class _MainState extends State<Main> with AutomaticKeepAliveClientMixin<Main> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final textModel = useMemoized(() => TextModel());
    final hintTintController = useAnimationController();
    final showHint = useState(false);

    return Container(
      color: NothingScheme.of(context).background,
      child: ScopedModel<TextModel>(
        model: textModel,
        child: BlocBuilder<FeedBloc, FeedState>(
          builder: (context, state) => _buildOnboarding(
            context,
            Stack(children: [
              _buildGame(context),
              _buildRefocusDetector(context),
              _buildTitleKnobs(context, widget.pageController),
              if (state is Pending) _buildContinueDetector(context),
              _buildHintButtons(context, showHint, hintTintController),
              _buildTinter(context, hintTintController),
              if (showHint.value) _buildHint(context, showHint, hintTintController),
              _buildTinter(context, widget.swipeTintController),
              _buildTextField(context),
            ]),
          ),
        ),
      ),
    );
  }

  Widget _buildContinueDetector(BuildContext context) {
    return GestureDetector(
      // child: Container(color: Colors.blue.withOpacity(0.2)),
      onTap: () {
        context.bloc<FeedBloc>().add(FeedEvent.ground());
      },
    );
  }

  Widget _buildTinter(BuildContext context, AnimationController controller) {
    final anim = ColorTween(
      begin: Colors.transparent,
      end: Colors.black.withOpacity(0.1),
    ).animate(CurvedAnimation(
      curve: Curves.easeInOut,
      parent: controller,
    ));
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) => IgnorePointer(
        ignoring: controller.value == 1 ? false : true,
        child: Container(
          color: anim.value,
        ),
      ),
    );
  }

  Widget _buildRefocusDetector(BuildContext context) {
    return Center(
      child: FractionallySizedBox(
        widthFactor: 0.8,
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          // child: Container(color: Colors.green.withOpacity(0.3)),
          onTap: () {
            final focusModel = FocusNodeModel.of(context);
            focusModel.focusNode.requestFocus(FocusNode());
            WidgetsBinding.instance.addPostFrameCallback((_) => focusModel.refocus());
          },
        ),
      ),
    );
  }

  Widget _buildOnboarding(BuildContext context, Widget child) {
    return context.watch<OnboardBloc>().state.done
        ? child
        : GestureDetector(
            child: Center(child: Onboarding()),
            onTap: () => context.read<OnboardBloc>().complete(),
          );
  }

  Widget _buildTextField(BuildContext context) {
    return HookBuilder(builder: (context) {
      final textModel = TextModel.of(context);
      final focusNodeModel = FocusNodeModel.of(context);
      final textController = useTextEditingController();

      return MultiBlocListener(
        listeners: [
          BlocListener<ValidationBloc, ValidationState>(listener: (context, state) {
            state.maybeWhen(
              just: (just) => just.maybeMap(
                wrong: (_) {
                  textController.clear();
                  textModel.update('');
                },
                orElse: () => domain.void$(),
              ),
              orElse: () => domain.void$(),
            );
          }),
          BlocListener<FeedBloc, FeedState>(listener: (context, state) {
            state.when(
              available: (_) {
                textController.clear();
                textModel.update('');
              },
              pending: (_, __) => domain.void$(),
              empty: (_) => domain.void$(),
            );
          }),
        ],
        child: Visibility(
          visible: false,
          maintainState: true,
          child: TextField(
            focusNode: focusNodeModel.focusNode,
            controller: textController,
            enableSuggestions: false,
            autocorrect: true,
            maxLength: 32,
            keyboardAppearance: NothingScheme.of(context).brightness,
            textInputAction: TextInputAction.go,
            keyboardType: TextInputType.text,
            onSubmitted: (s) async {
              // ignore: close_sinks
              final feed = context.bloc<FeedBloc>();
              if (feed.state is Pending) {
                feed.add(FeedEvent.ground());
                focusNodeModel.refocus();
                return;
              }
              print(s);
              focusNodeModel.refocus();
              if (s.isNotEmpty) {
                context.bloc<ValidationBloc>().add(ValidationEvent.check(s));
              }
            },
            onChanged: (s) {
              if (context.bloc<FeedBloc>().state is Pending) {
                textController.clear();
                return;
              }
              textModel.update(s);
              print(s);
            },
          ),
        ),
      );
    });
  }

  Widget _buildHint(
    BuildContext context,
    ValueNotifier<bool> showHint,
    AnimationController hintTintController,
  ) {
    return SafeArea(child: LayoutBuilder(builder: (context, constraints) {
      final top = lblH + 24; //+ 21 + 28 + 8 + 12;
      double hei = min(
        280,
        constraints.biggest.height - (lblH + ansH + 21 + 28 + 12 + 8),
      );
      hei += lblH + ansH - 20;
      const hor = 20.0;
      return Stack(children: [
        Positioned(
          top: top,
          left: hor,
          right: hor,
          child: FadeIn(
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
                          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                          child: BlocBuilder<FeedBloc, FeedState>(
                            builder: (context, state) => AutoSizeText(
                              state.when(
                                available: (tree) => tree.question.explanation,
                                pending: (oldTree, _) => oldTree.question.explanation,
                                empty: (_) => '',
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
                          showHint.value = false;
                          hintTintController.fling(velocity: -1);
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
        ),
      ]);
    }));
  }

  Widget _buildTitleKnobs(BuildContext context, PageController pageController) {
    const duration = Duration(milliseconds: 300);
    const curve = swipeCurve;
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _makeKnob(
            Icons.short_text,
            () => pageController.animateToPage(0, duration: duration, curve: curve),
          ),
          _makeKnob(
            Icons.all_inclusive,
            () => pageController.animateToPage(2, duration: duration, curve: curve),
          ),
        ],
      ),
    );
  }

  Widget _buildHintButtons(
    BuildContext context,
    ValueNotifier<bool> showHint,
    AnimationController hintTintController,
  ) {
    return SafeArea(child: LayoutBuilder(
      builder: (context, constraints) {
        // return BlocBuilder<FeedBloc, FeedState>(
        return BlocBuilder<ValidationBloc, ValidationState>(
          builder: (context, state) {
            return HookBuilder(builder: (context) {
              final liked = useState(false);
              final queH = useState<double>(280);
              queH.value = min(
                queH.value,
                constraints.biggest.height - (lblH + ansH + 21 + 28 + 8 + 12),
              );
              const pad = 8;
              const hor = 40.0;
              final top = queH.value + lblH + ansH + pad;
              text(String text) => Text(text, style: TextStyle(color: Colors.white, fontSize: 18));
              const label = {
                'hint': 'Хинт',
                'skip': 'Скип',
                'like': '',
                'dislike': '',
              };
              final color = {
                'hint': NothingScheme.of(context).hint,
                'skip': NothingScheme.of(context).skip,
                'like': NothingScheme.of(context).like,
                'dislike': NothingScheme.of(context).dislike,
              };
              final icon = {
                'hint': NothingFont.hint,
                'skip': NothingFont.skip,
                'like': NothingFont.like,
                'dislike': NothingFont.like,
              };
              final iconTransform = <String, Widget Function(Widget)>{
                'hint': (_) => _,
                'skip': (_) => Transform.scale(scale: 0.65, child: _),
                'like': (_) => _,
                'dislike': (_) => Transform.rotate(angle: pi, child: _),
              };
              final callback = {
                'hint': () => _hintClick(
                      context,
                      showHint,
                      hintTintController,
                    ),
                'skip': () => _skipClick(context),
                'like': () {
                  print('like');
                  void report(domain.QTree tree) => context.repository<LikesRepo>().report(tree.question.id, 1);
                  context.bloc<FeedBloc>().state.when(
                      available: (tree) => report(tree),
                      pending: (oldTree, _) => report(oldTree),
                      empty: (_) => domain.void$());
                  liked.value = true;
                },
                'dislike': () {
                  print('dislike');
                  void report(domain.QTree tree) => context.repository<LikesRepo>().report(tree.question.id, -1);
                  context.bloc<FeedBloc>().state.when(
                      available: (tree) => report(tree),
                      pending: (oldTree, _) => report(oldTree),
                      empty: (_) => domain.void$());
                  liked.value = true;
                },
              };

              if (liked.value) {
                return BlocListener<FeedBloc, FeedState>(
                  child: SizedBox.shrink(),
                  listenWhen: (_, next) => next is Available,
                  listener: (context, sate) {
                    liked.value = false;
                  },
                );
              }

              // final bb = (state is! Pending ? ['hint', 'skip'] : ['like', 'dislike'])
              final correct = state.map(just: (v) => v.state is Correct, nothing: (_) => false);
              final buttons = (!correct ? ['hint', 'skip'] : ['like', 'dislike'])
                  .map((l) => Expanded(
                        child: FlatButton(
                          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                          color: color[l],
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(width: 2),
                              iconTransform[l](Icon(
                                icon[l],
                                size: 24,
                                color: Colors.white,
                              )),
                              SizedBox(width: 2),
                              text(label[l]),
                            ],
                          ),
                          onPressed: callback[l],
                          shape: RoundedRectangleBorder(
                            borderRadius: NothingScheme.of(context).hintBorder,
                          ),
                        ),
                      ))
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
                        ...buttons,
                        // CoinText(),
                      ],
                    ),
                  ),
                ],
              );
            });
          },
        );
      },
    ));
  }

  void _hintClick(
    BuildContext context,
    ValueNotifier<bool> showHint,
    AnimationController hintTintController,
  ) async {
    // context.bloc<CoinBloc>().dec(2);
    if (!context.read<HintBloc>().state.unlocked) {
      await _showAd(context);
    }
    // await Future.delayed(const Duration(milliseconds: 500));
    showHint.value = true;
    hintTintController.fling();
  }

  void _skipClick(BuildContext context) async {
    if (!context.read<HintBloc>().state.unlocked) {
      await _showAd(context);
    }
    // await Future.delayed(const Duration(milliseconds: 500));
    context.bloc<ValidationBloc>().add(ValidationEvent.skip());
  }

  final double lblH = 50;
  final double ansH = 72;
  Widget _buildGame(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return HookBuilder(builder: (context) {
            final queH = useState(280.0);
            queH.value = min(
              queH.value,
              constraints.biggest.height - (lblH + ansH + 21 + 28 + 8 + 12),
            );
            return Column(children: [
              SizedBox(height: 21),
              SizedBox(child: Label()),
              SizedBox(height: 12),
              SizedBox(height: queH.value, child: Center(child: Question())),
              SizedBox(height: ansH, child: Answer()),
            ]);
          });
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

// InterstitialAd myInterstitial;

Future<void> _createAd(FocusNodeModel model) async {
  // myInterstitial = InterstitialAd(
  //   // adUnitId: Platform.isIOS // interstitial ios/android
  //   //     ? 'ca-app-pub-3169956978186495/7272148845'
  //   //     : 'ca-app-pub-3169956978186495/2443683360',
  //   adUnitId: InterstitialAd.testAdUnitId,
  //   targetingInfo: MobileAdTargetingInfo(),
  //   listener: (MobileAdEvent event) async {
  //     // event.
  //     print("InterstitialAd event is $event");
  //     if (event == MobileAdEvent.loaded) {
  //       // await myInterstitial.show(
  //       //   anchorType: AnchorType.bottom,
  //       //   anchorOffset: 0.0,
  //       //   horizontalCenterOffset: 0.0,
  //       // );
  //     }
  //     if (event == MobileAdEvent.closed) {
  //       print("CLOSED");
  //       // context.bloc<CoinBloc>().add(CoinEvent.inc(3));
  //       // await myInterstitial.load();
  //       model.refocus();
  //       await _createAd(model);
  //     }
  //   },
  // );
  // print('****** Loading new ad');
  // final result = await myInterstitial.load();
  // if (!result) {
  //   print('\t ****** Ad did not load');
  //   return;
  // }
}

Future<void> _showAd(BuildContext context) async {
  // // InterstitialAd myInterstitial;
  // context.bloc<AdBloc>().add(AdEvent.report(domain.AdType.interstitial));
  // // print('****** Loading new ad');
  // // final result = await myInterstitial.load();
  // // if (!result) {
  // //   print('\t ****** Ad did not load');
  // //   return;
  // // }
  // print('****** Loaded ad successfully');
  // await myInterstitial.show(
  //   anchorType: AnchorType.bottom,
  //   anchorOffset: 0.0,
  //   horizontalCenterOffset: 0.0,
  // );
  // context.read<HintBloc>().unlock();
  // // myInterstitial.dispose()
  // // _createAd();
}
