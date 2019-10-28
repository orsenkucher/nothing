import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crystalpuzzle/src/bloc/playbloc/bloc.dart';

class Newpage extends StatefulWidget {
  @override
  _NewpageState createState() => _NewpageState();
}

class _NewpageState extends State<Newpage> {
  FocusNode focusNode;
  String currentText = "";
  @override
  void initState() {
    super.initState();
    // FocusScope.of(context).requestFocus(new FocusNode());
    focusNode = FocusNode();
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    focusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          color: Colors.transparent,
        ),
        Column(
          children: <Widget>[
            Flexible(
              flex: 46,
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: focusNode.unfocus,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.zero,
                      bottom: Radius.circular(28),
                    ),
                  ),
                  child: BlocBuilder<PlayBloc, PlayState>(
                    builder: (context, state) {
                      switch (state.runtimeType) {
                        case TasksState:
                          return DisplayTask2(state: state);
                      }
                      return Container();
                    },
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 54,
              child: Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 60,
                  vertical: 40,
                ),
                height: 78,
                decoration: BoxDecoration(
                  color: Colors.black,
                  // border: Border.all(
                  //   color: Colors.white,
                  //   width: 4,
                  // ),
                  borderRadius: BorderRadius.circular(28),
                ),
                child: Center(
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      focusNode.unfocus();
                      focusNode.requestFocus();
                    },
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 205,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(28),
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.black,
                              width: 4,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              currentText,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Container(
          width: 1,
          height: 1,
          child: FittedBox(
            fit: BoxFit.none,
            child: Container(
              width: 200,
              height: 200,
              child: TextField(
                autocorrect: false,
                autofocus: false,
                onSubmitted: (s) => print(s),
                keyboardAppearance: Brightness.light,
                maxLength: 12,
                cursorColor: Colors.transparent,
                style: TextStyle(
                  color: Colors.transparent,
                ),
                focusNode: focusNode,
                onChanged: (s) => setState(() {
                  currentText = s;
                }),
                showCursor: false,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  hintText: "dsfasf",
                  fillColor: Colors.transparent,
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class DisplayTask2 extends StatelessWidget {
  final TasksState state;
  const DisplayTask2({
    this.state,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var task = state.tasks[0];
    return Align(
      child: Text(
        task.question,
        style: TextStyle(
          color: Colors.white,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
