import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nothing/bloc/routing/bloc.dart';
import 'package:nothing/bloc/test.dart';
import 'package:nothing/bloc/validation/bloc.dart';
import 'package:nothing/color/scheme.dart';
import 'package:nothing/model/text.dart';
import 'package:nothing/ui/game.dart';
import 'package:scoped_model/scoped_model.dart';

class Home extends StatefulWidget {
  const Home();
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  FocusNode _focusNode;
  TextEditingController _controller = TextEditingController();
  TextModel model = TextModel();

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.bloc<RoutingBloc>().add(RoutingEvent.resume());
    });
    return Scaffold(
      body: Container(
        color: NothingScheme.of(context).background,
        child: ScopedModel<TextModel>(
          model: model,
          child: Stack(
            children: [
              Game(),
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
                            _controller.clear();
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
                    print('RESUMING *2** *** *** ***');
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      _focusNode.unfocus();
                      _focusNode.requestFocus();
                    });
                  })
                ],
                child: _inputPoint(model),
              ),
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector _gestureDetector() {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onHorizontalDragEnd: (_) {
        _focusNode.unfocus();
        _focusNode.requestFocus();
      },
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
        controller: _controller,
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
