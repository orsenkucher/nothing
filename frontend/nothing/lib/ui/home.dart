import 'dart:io';
import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nothing/bloc/feed/bloc.dart';
import 'package:nothing/bloc/questions/bloc.dart';
import 'package:nothing/bloc/test.dart';
import 'package:nothing/bloc/validation/bloc.dart';
import 'package:nothing/color/scheme.dart';
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
    BlocProvider.of<QuestionsBloc>(context).add(QuestionsEvent.fetch());
    // }
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.unfocus();
      _focusNode.requestFocus();
    });
    return Scaffold(
      body: Container(
        color: NothingScheme.of(context).card,
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
        keyboardAppearance: Brightness.light,
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

class Test extends StatelessWidget {
  const Test({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TestBloc, TestState>(
      condition: (previous, current) {
        print("************************");
        print(current);
        return true;
      },
      builder: (context, state) => Center(
        child: Text(
          state.names.join('*'),
          style: TextStyle(
            fontSize: 40,
            color: Colors.deepPurpleAccent,
          ),
        ),
      ),
    );
  }
}

class TextModel extends Model {
  String _text;
  String get text => _text;

  void update(String s) {
    _text = s;
    notifyListeners();
  }

  static TextModel of(BuildContext context) =>
      ScopedModel.of<TextModel>(context, rebuildOnChange: true);
}

class Game extends StatelessWidget {
  const Game({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var safeWrap = (Widget w) => Platform.isIOS ? w : SafeArea(child: w);
    return safeWrap(
      LayoutBuilder(
        builder: (context, constraints) {
          double labelH = 50;
          double ansH = 70;
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _yellowThing(Icons.add_shopping_cart),
                  _yellowThing(Icons.history),
                ],
              ),
              SizedBox(
                height: labelH,
                child: Label(),
              ),
              SizedBox(
                height: min(
                  280,
                  constraints.biggest.height -
                      (labelH + ansH + 21 + 28 + 8 + 12),
                ),
                child: Center(
                  child: Question(),
                ),
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

  Widget _yellowThing(IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 24,
        right: 24,
        top: 21,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xfffdcf3c),
          borderRadius: BorderRadius.circular(28),
        ),
        width: 50,
        height: 28,
        child: Icon(icon),
      ),
    );
  }
}

class Answer extends StatelessWidget {
  const Answer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(horizontal: 32),
      child: BlocBuilder<ValidationBloc, ValidationState>(
        builder: (BuildContext context, state) => Material(
          elevation: 6,
          shadowColor: Color(0x88fdcf3c),
          color: state.map(
            correct: (_) => Color(0xff88bb33),
            neutral: (_) => Color(0xfffdcf3c),
            wrong: (_) => Color(0xffc02030),
          ),
          borderRadius: BorderRadius.circular(28),
          clipBehavior: Clip.antiAlias,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: IconButton(
                    onPressed: () => print("Press"),
                    // tooltip: "hint",
                    splashColor: Colors.red,
                    highlightColor: Colors.transparent,
                    icon: Icon(
                      Icons.lightbulb_outline,
                      color: Colors.black,
                      size: 32,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: AutoSizeText(
                  TextModel.of(context).text ?? '',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: NothingScheme.of(context).question,
                  ),
                  maxLines: 2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Question extends StatelessWidget {
  const Question({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 8,
      ),
      child: BlocBuilder<FeedBloc, FeedState>(
        builder: (context, state) => AutoSizeText(
          state.tree?.question?.question ?? '',
          maxLines: 6,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 44,
            fontWeight: FontWeight.bold,
            color: NothingScheme.of(context).previoustext,
          ),
        ),
      ),
    );
  }
}

class Label extends StatelessWidget {
  const Label({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "NOTHING PUZZLE 2",
        style: TextStyle(
          fontSize: 20,
          color: NothingScheme.of(context).textbase,
        ),
      ),
    );
  }
}
