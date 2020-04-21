import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nothing/bloc/routing/bloc.dart';
import 'package:nothing/bloc/test.dart';
import 'package:nothing/bloc/validation/bloc.dart';
import 'package:nothing/color/scheme.dart';
import 'package:nothing/model/text.dart';
import 'package:nothing/ui/game.dart';
import 'package:nothing/ui/history.dart';
import 'package:scoped_model/scoped_model.dart';

import 'dart:io';
import 'dart:math';

import 'package:nothing/ui/answer.dart';
import 'package:nothing/ui/knob.dart';
import 'package:nothing/ui/label.dart';
import 'package:nothing/ui/question.dart';

class Home extends StatefulWidget {
  const Home();
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  FocusNode _focusNode;
  final _textController = TextEditingController();
  final _model = TextModel();
  final _pageController = PageController(initialPage: 1);
  AnimationController _animController;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _animController = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _textController.dispose();
    _animController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _refocus();
    });
    // pageController.position.didEndScroll();
    // pageController.addListener(listener)
  }

  @override
  Widget build(BuildContext context) {
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   context.bloc<RoutingBloc>().add(RoutingEvent.resume());
    // }); // TODO
    return Scaffold(
      // body: CustomScrollView(
      //   scrollDirection: Axis.horizontal,
      //   physics: const BouncingScrollPhysics(),
      //   slivers: [
      //     SliverToBoxAdapter(child: Container(width: 200, color: Colors.amber)),
      //     SliverFillViewport(
      //       delegate: SliverChildBuilderDelegate(
      //         (context, i) => i == 0 ? _buildMain(context) : null,
      //       ),
      //     ),
      //   ],
      // ),
      backgroundColor: NothingScheme.of(context).background,
      body: NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          if (scrollNotification is ScrollUpdateNotification) {
            final metrics = scrollNotification.metrics;
            final offset = (metrics.viewportDimension - metrics.pixels).abs();
            final value = (offset / metrics.viewportDimension).clamp(0.0, 1.0);
            _animController.value = value;
            _animController.notifyListeners();
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
                  child: Text('Menu', style: TextStyle(fontSize: 36)),
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
                            'Sound',
                            'Rate us',
                            'Feedback',
                            'Share',
                            'Vibration',
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
              child: Text('Levels', style: TextStyle(fontSize: 36)),
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
    // CurvedAnimation(parent: Tween(begin: 0,end:1))
    // AnimatedContainer()
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
            _buildTinter(context),
            // Test(),
            MultiBlocListener(
              listeners: [
                BlocListener<ValidationBloc, ValidationState>(
                  listener: (context, state) {
                    state.maybeWhen(
                      just: (just) => just.maybeMap(
                        orElse: () {},
                        correct: (_) {
                          _textController.clear();
                          _model.update('');
                        },
                      ),
                      orElse: () {},
                    );
                  },
                ),
                BlocListener<RoutingBloc, RoutingState>(
                    listener: (context, state) {
                  print(state);
                  if (state.route != Routes.home()) return;
                  print('focusing keyboard'); // TODO
                  // WidgetsBinding.instance.addPostFrameCallback((_) {
                  // //   _focusNode.unfocus();
                  // //   _focusNode.requestFocus();
                  // _refocus();
                  // });
                })
              ],
              child: _inputPoint(_model),
            ),
          ],
        ),
      ),
    );
  }

  IgnorePointer _buildTinter(BuildContext context) {
    final anim = ColorTween(
      begin: Colors.black.withOpacity(0.0),
      end: Colors.black.withOpacity(0.1),
    ).animate(CurvedAnimation(
      curve: Curves.easeInOut,
      parent: _animController,
    ));
    return IgnorePointer(
      child: AnimatedBuilder(
        animation: _animController,
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
          // onHorizontalDragEnd: (_) => _refocus(),
          // onVerticalDragEnd: (_) => _refocus(),
          onTap: _refocus,
        ),
      ),
    );
  }

  Widget _inputPoint(TextModel model) {
    return Visibility(
      visible: false,
      // maintainInteractivity: true,
      // maintainAnimation: true,
      // maintainSize: true,
      maintainState: true,
      child: TextField(
        // autofocus: true,
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
            context.bloc<TestBloc>().add(TestEvent.name(s));
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
          // context.bloc<ValidationBloc>().add(ValidationEvent.purge());
          model.update(s);
          print(s);
        },
      ),
    );
  }

  Widget _buildTitleKnobs(BuildContext context) {
    var safeWrap = (Widget w) => Platform.isIOS ? w : SafeArea(child: w);
    const duration = Duration(milliseconds: 300);
    const curve = Curves.easeInOut;
    return safeWrap(
      Row(
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
        const ll = {'hint': 'Hint', 'skip': 'Skip'};
        final cc = {
          'hint': NothingScheme.of(context).hint,
          'skip': NothingScheme.of(context).skip,
        };
        final ii = {'hint': Icons.lightbulb_outline, 'skip': Icons.clear};
        final bb = ['hint', 'skip']
            .map(
          (l) => Expanded(
            child: FlatButton(
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
              onPressed: () {},
              shape: RoundedRectangleBorder(
                borderRadius: NothingScheme.of(context).hintBorder,
              ),
            ),
          ),
        )
            .expand((w) sync* {
          yield w;
          yield const SizedBox(width: 20);
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
                    Text(
                      '55',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                      ),
                    )
                  ]),
                ],
              ),
            ),
          ],
        );
      },
    ));
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
          return Column(
            children: [
              SizedBox(height: 21),
              SizedBox(
                // height: labelH,
                // child: Stack(children: [Label(), Test()]),
                child: Label(),
              ),
              SizedBox(height: 12),
              SizedBox(
                height: queH,
                child: Center(child: Question()),
              ),
              SizedBox(
                height: ansH,
                child: Answer(),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _makeKnob(IconData icon, [Function onPress]) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 24,
        right: 24,
        top: 21,
      ),
      child: Knob(icon, onPress),
    );
  }
}
