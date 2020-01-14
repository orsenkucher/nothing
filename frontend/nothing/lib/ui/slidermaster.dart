import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nothing/bloc/feed/bloc.dart';
import 'package:nothing/ui/slider.dart';

class SliderMaster extends StatelessWidget {
  final double height;

  const SliderMaster({@required this.height});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: BlocBuilder<FeedBloc, Feed>(
        builder: (context, state) {
          return state.current > 0
              ? _buildSlider(context, state)
              : _buildEmpty();
        },
      ),
    );
  }

  Widget _buildSlider(BuildContext context, Feed feed) {
    final q = feed.batch[feed.current - 1];
    final sum = q.leftn + q.rightn;
    final value = sum != 0 ? q.leftn / sum : 0.0;
    return Slider(
      value: value,
      height: height,
      left: q.left,
      right: q.right,
    );
  }

  Widget _buildEmpty() {
    return Slider(
      value: 0,
      height: height,
    );
  }
}
