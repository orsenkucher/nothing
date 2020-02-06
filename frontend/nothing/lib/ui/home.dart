import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nothing/bloc/feed/bloc.dart';
import 'package:nothing/bloc/questions/bloc.dart';
import 'package:nothing/color/scheme.dart';
import 'package:nothing/ui/cardsmaster.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  FocusNode focusNode;

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (BlocProvider.of<FeedBloc>(context).state.len < 36) {
      BlocProvider.of<QuestionsBloc>(context).add(const FetchQuestions());
    }
    focusNode.unfocus();
    focusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: NothingScheme.of(context).card,
        // color: Color(0xff5d26db),
        child: Stack(
          children: [
            _inputPoint(),
            // Column(
            //   crossAxisAlignment: CrossAxisAlignment.stretch,
            //   mainAxisSize: MainAxisSize.max,
            //   children: [
            //     SizedBox(height: 20),
            //     Expanded(
            //       child: SizedBox.expand(
            //         child: const CardsMaster(),
            //       ),
            //     ),
            //   ],
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     _yellowThing(),
            //     _yellowThing(),
            //   ],
            // ),
            SafeArea(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Center(
                      child: Text(
                        "NOTHING PUZZLE 2",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  // ConstrainedBox(
                  // constraints: BoxConstraints(maxHeight: 200),
                  // child:
                  Expanded(
                    child: Center(
                      child: AutoSizeText(
                        "A K Q J ?",
                        maxLines: 4,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 52,
                          fontWeight: FontWeight.bold,
                          color: NothingScheme.of(context).question,
                        ),
                      ),
                    ),
                    // ),
                  ),
                  // ---------
                  Container(
                    padding: const EdgeInsets.all(8),
                    margin: const EdgeInsets.all(32),
                    decoration: BoxDecoration(
                      color: Color(0xfffdcf3c),
                      borderRadius: BorderRadius.circular(28),
                    ),
                    height: 70,
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: IconButton(
                              onPressed: () => print("Press"),
                              icon: Icon(
                                Icons.lightbulb_outline,
                                color: Colors.black,
                                size: 32,
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: AutoSizeText(
                            "123123",
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: NothingScheme.of(context).question,
                            ),
                            maxLines: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                focusNode.unfocus();
                focusNode.requestFocus();
              },
            ),
          ],
        ),
      ),
    );
  }

  Padding _yellowThing() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 4,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xfffdcf3c),
          borderRadius: BorderRadius.circular(28),
        ),
        width: 50,
        height: 25,
      ),
    );
  }

  Widget _inputPoint() {
    return SizedBox(
      height: 1,
      width: 1,
      child: FittedBox(
        fit: BoxFit.cover,
        child: SizedBox(
          height: 200,
          width: 200,
          child: TextField(
            focusNode: focusNode,
            textInputAction: TextInputAction.go,
            onChanged: print,
          ),
        ),
      ),
    );
  }
}
