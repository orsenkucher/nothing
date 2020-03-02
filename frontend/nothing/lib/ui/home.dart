import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nothing/bloc/test.dart';
import 'package:nothing/bloc/validation/bloc.dart';
import 'package:nothing/color/scheme.dart';
import 'package:nothing/model/textmodel.dart';
import 'package:nothing/ui/game.dart';
import 'package:scoped_model/scoped_model.dart';

class Home extends StatefulWidget {
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
    // if (BlocProvider.of<FeedBloc>(context).state.current < 36) { // REDO HERE
    // BlocProvider.of<QuestionsBloc>(context).add(QuestionsEvent.fetch());
    // }
    // BlocProvider.of<IdBloc>(context).add(IdEvent.revoke());
    // BlocProvider.of<SummaryBloc>(context).add(SummaryEvent.reset());
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.unfocus();
      _focusNode.requestFocus();
    });
    return Scaffold(
      body: Container(
        color: NothingScheme.of(context).background,
        // color: Color(0xff5d26db),
        child: ScopedModel<TextModel>(
          model: model,
          child: Stack(
            children: [
              Game(),
              _gestureDetector(),
              // Test(),
              BlocListener<ValidationBloc, ValidationState>(
                listener: (context, state) {
                  state.maybeMap(
                    correct: (_) {
                      _controller.clear();
                      model.update('');
                    },
                    orElse: () {},
                  );
                },
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
            BlocProvider.of<ValidationBloc>(context).add(
              ValidationEvent.check(s),
            );
            BlocProvider.of<TestBloc>(context).add(
              TestEvent.name(s),
            );
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
          BlocProvider.of<ValidationBloc>(context).add(ValidationEvent.purge());
          model.update(s);
          print(s);
        },
      ),
    );
  }
}
