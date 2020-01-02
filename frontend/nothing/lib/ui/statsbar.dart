import 'package:flutter/material.dart';

class StatsBar extends StatelessWidget {
  final double value;
  final double height;
  final String left;
  final String right;
  StatsBar({
    @required this.value,
    @required this.height,
    String left,
    String right,
  })  : this.left = left ?? '',
        this.right = right ?? '',
        assert(value >= 0 && value <= 1);

  final Color leftColor = Color(0xff665c54); // 0xff665c54
  final Color rightColor = Color(0xffd5c4a1); // 0xffd5c4a1
  // final Color grey = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: LayoutBuilder(
          builder: (context, constraints) => Stack(
            children: [
              Container(
                color: rightColor, //0xffd65d0e //0xff427b58
                width: constraints.maxWidth,
                height: height,
              ),
              AnimatedContainer(
                duration: Duration(milliseconds: 500),
                curve: Curves.easeOutCubic,
                color: leftColor,
                width: constraints.maxWidth * value,
                height: height,
              ),
              SizedBox(
                width: constraints.maxWidth,
                height: height,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (value <= 0.5)
                      Text(
                        left,
                        style: TextStyle(
                          color: Color(0xff1d2021),
                          fontSize: 18,
                        ),
                      ),
                    if (value > 0.5)
                      Text(
                        right,
                        style: TextStyle(
                          color: Color(0xfffbf1c7),
                          fontSize: 18,
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      // BlocBuilder<QuestionBloc, QuestionState>(
      //   builder: (context, state) {
      //     if (state is NewQuestion) {
      //       return Text(state.prevQuestion.question);
      //     }
      //     return Container();
      //   },
      // ),
      // LayoutBuilder(
      //   builder: (context, constraints) => Container(
      //     // color: Color(0xff32302f),
      //     width: constraints.maxWidth,
      //     height: height,
      //     decoration: BoxDecoration(
      //       borderRadius: BorderRadius.circular(16),
      //       border: Border.all(
      //         color: Color(0xff32302f),
      //         width: 4,
      //       ),
      //     ),
      //   ),
      // )
    ]);
  }
}
