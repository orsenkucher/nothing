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

class Home extends StatefulWidget {
  const Home();
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  FocusNode _focusNode;
  final _textController = TextEditingController();
  final model = TextModel();
  final pageController = PageController(initialPage: 1);
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
          controller: pageController,
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          onPageChanged: (i) {
            switch (i) {
              case 1:
                _refocus();
                break;
              default:
                _focusNode.unfocus();
            }
          },
          children: [
            Container(color: Colors.amber),
            _buildMain(context),
            Container(color: Colors.amber),
          ],
        ),
      ),
    );
  }

  Widget _buildMain(BuildContext context) {
    // CurvedAnimation(parent: Tween(begin: 0,end:1))
    // AnimatedContainer()
    return Container(
      color: NothingScheme.of(context).background,
      child: ScopedModel<TextModel>(
        model: model,
        child: Stack(
          children: [
            Game(),
            _buildTinter(),
            _gestureDetector(),
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
                          model.update('');
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
              child: _inputPoint(model),
            ),
          ],
        ),
      ),
    );
  }

  IgnorePointer _buildTinter() {
    final anim = ColorTween(
      begin: Colors.transparent,
      end: Colors.black.withOpacity(0.3),
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

  Widget _gestureDetector() {
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
}
