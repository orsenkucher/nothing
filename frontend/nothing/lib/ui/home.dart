import 'dart:io';
import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:nothing/binding/control.dart';
import 'package:nothing/bloc/ad/bloc.dart';
import 'package:nothing/bloc/feed/bloc.dart';
import 'package:nothing/bloc/hint/bloc.dart';
import 'package:nothing/bloc/onboard/bloc.dart';
import 'package:nothing/bloc/validation/bloc.dart';
import 'package:nothing/color/scheme.dart';
import 'package:nothing/domain/domain.dart' as domain;
import 'package:nothing/hooks/pagecontroller.dart';
import 'package:nothing/icons/icons.dart';
import 'package:nothing/model/focusnode.dart';
import 'package:nothing/model/text.dart';
import 'package:nothing/repository/likes.dart';
import 'package:nothing/ui/answer.dart';
import 'package:nothing/ui/confetti.dart';
import 'package:nothing/ui/fade_in.dart';
import 'package:nothing/ui/history.dart';
import 'package:nothing/ui/knob.dart';
import 'package:nothing/ui/label.dart';
import 'package:nothing/ui/menu.dart';
import 'package:nothing/ui/onboarding.dart';
import 'package:nothing/ui/question.dart';
import 'package:scoped_model/scoped_model.dart';

const swipeCurve = Curves.fastOutSlowIn;

class Home extends HookWidget {
  const Home();

  @override
  Widget build(BuildContext context) {
    final focusNodeModel = FocusNodeModel(useFocusNode());
    final swipeTintController = useAnimationController();
    final swipeMenuController = useAnimationController(upperBound: 2.0);
    final swipeHistoryController = useAnimationController(lowerBound: -2.0);
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
            onNotification: _onScrollNotification(
              context,
              swipeTintController,
              swipeMenuController,
              swipeHistoryController,
            ),
            child: PageView(
              controller: pageController,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(/*parent: NeverScrollableScrollPhysics()*/),
              onPageChanged: _onPageChanged(context),
              children: () {
                const duration = Duration(milliseconds: 300);
                const curve = swipeCurve;
                void onBack() => pageController.animateToPage(1, duration: duration, curve: curve);
                return [
                  Menu(onBack, swipeMenuController),
                  Main(swipeTintController, pageController),
                  History(onBack, swipeHistoryController),
                ];
              }(),
            ),
          ),
        ),
      ),
    );
  }

  bool Function(ScrollNotification) _onScrollNotification(
    BuildContext context,
    AnimationController swipeTintController,
    AnimationController swipeMenuController,
    AnimationController swipeHistoryController,
  ) {
    return (scrollNotification) {
      // this picks up events from history verticall ScrollView,
      // so need to filter it by axis ->
      if (scrollNotification is ScrollUpdateNotification) {
        final metrics = scrollNotification.metrics;
        if (metrics.axis == Axis.vertical) return false; // <- here

        swipeMenuController.value = (metrics.viewportDimension - metrics.pixels) / metrics.viewportDimension;
        swipeMenuController.notifyListeners();

        swipeHistoryController.value = (metrics.viewportDimension * 2 - metrics.pixels) / metrics.viewportDimension;
        swipeHistoryController.notifyListeners();

        if (!context.read<OnboardBloc>().state.done) {
          swipeTintController.value = 0.0;
          return false;
        } // currently onboarding
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
    final textController = useTextEditingController();
    final hintTintController = useAnimationController();
    final showHint = useState(false);

    return Container(
      color: NothingScheme.of(context).background,
      child: ScopedModel<TextModel>(
        model: textModel,
        child: BlocListener<ControlCubit, ControlState>(
          listener: (context, _) {
            showHint.value = false;
            hintTintController.fling(velocity: -1);
          },
          child: BlocBuilder<FeedBloc, FeedState>(
            builder: (context, state) => _ifOnboarding(
              context,
              Stack(children: [
                _buildGame(context, textController),
                Confetti(),
                _buildRefocusDetector(context),
                _buildTitleKnobs(context, widget.pageController),
                if (state is Pending) _buildContinueDetector(context),
                _buildHintButtons(context, showHint, hintTintController),
                _buildTinter(context, hintTintController),
                if (showHint.value) _buildHint(context, showHint, hintTintController),
                _buildTinter(context, widget.swipeTintController, true),
                _buildTextField(context, textController),
              ]),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContinueDetector(BuildContext context) {
    return GestureDetector(
      // child: Container(color: Colors.blue.withOpacity(0.2)),
      onTap: () {
        context.read<FeedBloc>().add(FeedEvent.ground());
      },
    );
  }

  Widget _buildTinter(
    BuildContext context,
    AnimationController controller, [
    bool alt = false,
  ]) {
    final anim = ColorTween(
      begin: alt ? Colors.white.withOpacity(0.0) : Colors.transparent,
      end: alt ? Colors.white.withOpacity(0.9) : Colors.black.withOpacity(0.1),
    ).animate(CurvedAnimation(
      curve: Curves.easeOutCubic,
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
          behavior: HitTestBehavior.translucent,
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

  Widget _ifOnboarding(BuildContext context, Widget child) {
    return context.watch<OnboardBloc>().state.done ? child : Onboarding();
  }

  Widget _buildTextField(
    BuildContext context,
    TextEditingController textController,
  ) {
    return HookBuilder(builder: (context) {
      final textModel = TextModel.of(context);
      final focusNodeModel = FocusNodeModel.of(context);

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
          BlocListener<FeedBloc, FeedState>(
            listener: (context, state) {
              state.when(
                available: (_) {
                  textController.clear();
                  textModel.update('');
                },
                pending: (_, __) => domain.void$(),
                empty: (_) => domain.void$(),
              );
            },
            listenWhen: (oldTree, newTree) {
              if (oldTree is Available && newTree is Available) {
                if (oldTree.tree.question.id == newTree.tree.question.id) {
                  return false;
                }
              }
              return true;
            },
          ),
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
              final feed = context.read<FeedBloc>();
              if (feed.state is Pending) {
                feed.add(FeedEvent.ground());
                focusNodeModel.refocus();
                return;
              }
              focusNodeModel.refocus();
              if (s.isNotEmpty) {
                print(s);
                context.read<ValidationBloc>().add(ValidationEvent.check(s));
              }
            },
            onChanged: (s) {
              if (context.read<FeedBloc>().state is Pending) {
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

  SnackBar _makeSnackBar(BuildContext context, bool liked) {
    final snackBar = SnackBar(
      backgroundColor: NothingScheme.of(context).knob,
      content: Text(
        'Thanks for your feedback!',
        style: TextStyle(
          fontSize: 18,
          fontFamily: 'Gilroy',
          color: NothingScheme.of(context).question,
        ),
      ),
    );
    return snackBar;
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
                'hint': 'Hint',
                'skip': 'Skip',
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
                  void report(domain.QTree tree) => context.read<LikesRepo>().report(tree.question.id, 1);
                  context.read<FeedBloc>().state.when(
                      available: (tree) => report(tree),
                      pending: (oldTree, _) => report(oldTree),
                      empty: (_) => domain.void$());
                  liked.value = true;
                  final snackBar = _makeSnackBar(context, true);
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                'dislike': () {
                  print('dislike');
                  void report(domain.QTree tree) => context.read<LikesRepo>().report(tree.question.id, -1);
                  context.read<FeedBloc>().state.when(
                      available: (tree) => report(tree),
                      pending: (oldTree, _) => report(oldTree),
                      empty: (_) => domain.void$());
                  liked.value = true;
                  final snackBar = _makeSnackBar(context, false);
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
                  .map((l) => FlatButton(
                        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 9),
                        color: color[l],
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            iconTransform[l](Icon(
                              icon[l],
                              size: 24,
                              color: Colors.white,
                            )),
                            SizedBox(width: 2),
                            text(label[l]),
                            SizedBox(width: 6),
                          ],
                        ),
                        onPressed: callback[l],
                        shape: RoundedRectangleBorder(
                          borderRadius: NothingScheme.of(context).hintBorder,
                        ),
                      ))
                  .expand((w) sync* {
                yield w;
                yield const SizedBox(width: 12);
                // yield Container(width: 16, height: 10, color: Colors.red);
              });
              return Stack(
                children: [
                  Positioned(
                    top: top,
                    left: hor,
                    right: hor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(width: 2),
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
    context.read<ValidationBloc>().add(ValidationEvent.skip());
  }

  final double lblH = 50;
  final double ansH = 72;
  Widget _buildGame(
    BuildContext context,
    TextEditingController textController,
  ) {
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
              SizedBox(height: 24, child: Label()),
              SizedBox(height: 12),
              SizedBox(height: queH.value, child: Center(child: Question())),
              SizedBox(height: ansH, child: Answer(textController)),
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

Future<void> _createAd(FocusNodeModel model) async {
  RewardedVideoAd.instance.listener = (RewardedVideoAdEvent event, {String rewardType, int rewardAmount}) async {
    print("RewardedVideoAdEvent event is $event");
    if (event == RewardedVideoAdEvent.loaded) {}
    if (event == RewardedVideoAdEvent.closed) {
      print("RewardedVideoAdEvent is closed");
      model.refocus();
      await _createAd(model);
    }
  };
  print('****** Loading new ad');
  final result = await RewardedVideoAd.instance.load(
    adUnitId: Platform.isIOS // rewarded ios/android
        ? 'ca-app-pub-3169956978186495/1379142349'
        : 'ca-app-pub-3169956978186495/4928393166',
    // adUnitId: InterstitialAd.testAdUnitId,
    targetingInfo: MobileAdTargetingInfo(),
  );
  if (!result) {
    print('****** Ad did not load');
    return;
  }
}

Future<void> _showAd(BuildContext context) async {
  context.read<AdBloc>().add(AdEvent.report(domain.AdType.rewarded));
  print('****** Loaded ad successfully');
  await RewardedVideoAd.instance.show();
  context.read<HintBloc>().unlock();
}
