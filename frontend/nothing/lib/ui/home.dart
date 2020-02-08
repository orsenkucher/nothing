import 'dart:io';
import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nothing/bloc/feed/bloc.dart';
import 'package:nothing/bloc/questions/bloc.dart';
import 'package:nothing/color/scheme.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:vibrate/vibrate.dart';

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
    if (BlocProvider.of<FeedBloc>(context).state.len < 36) {
      BlocProvider.of<QuestionsBloc>(context).add(const FetchQuestions());
    }
    _focusNode.unfocus();
    _focusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: NothingScheme.of(context).card,
        // color: Color(0xff5d26db),
        child: ScopedModel<TextModel>(
          model: model,
          child: Stack(
            children: [
              _inputPoint(model),
              Game(),
              _gestureDetector(),
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector _gestureDetector() {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      // onTap: () {
      onHorizontalDragEnd: (_) {
        print("heh");
        _focusNode.unfocus();
        _focusNode.requestFocus();
      },
    );
  }

  Widget _inputPoint(TextModel model) {
    return SizedBox(
      height: 1,
      width: 1,
      child: FittedBox(
        fit: BoxFit.cover,
        child: SizedBox(
          height: 200,
          width: 200,
          child: TextField(
            focusNode: _focusNode,
            controller: _controller,
            enableSuggestions: false,
            autocorrect: false,
            maxLength: 32,
            keyboardAppearance: Brightness.light,
            keyboardType: TextInputType.text,
            onSubmitted: (s) async {
              print(s);
              model.update(s);
              _focusNode.requestFocus();
              if (true) {
                // clear
                _controller.clear();
                model.update('');
                Vibrate.feedback(FeedbackType.success);
              } else {
                // dont clear
                Vibrate.feedback(FeedbackType.warning);
              }
            },
            textInputAction: TextInputAction.go,
            onChanged: (s) {
              model.update(s);
              print(s);
            },
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
          print(constraints.biggest.height);
          double labelH = 50;
          double ansH = 70;
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [_yellowThing(), _yellowThing()],
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
              // if (true)
              Expanded(
                child: Icon(
                  Icons.keyboard_hide,
                  color: NothingScheme.of(context).textbase.withOpacity(0.2),
                  size: 180,
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _yellowThing() {
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
        child: Icon(Icons.add_shopping_cart),
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
      child: Material(
        elevation: 6,
        shadowColor: Color(0x88fdcf3c),
        color: Color(0xfffdcf3c),
        borderRadius: BorderRadius.circular(28),
        clipBehavior: Clip.antiAlias,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
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
      child: AutoSizeText(
        "Two people are standing back Two people are standing?",
        maxLines: 6,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 44,
          fontWeight: FontWeight.bold,
          color: NothingScheme.of(context).previoustext,
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
