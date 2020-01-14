import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nothing/bloc/feed/bloc.dart';
import 'package:nothing/ui/slider.dart';

class SliderMaster extends StatelessWidget {
  const SliderMaster();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50, right: 30, left: 30),
      child: BlocBuilder<FeedBloc, Feed>(
        builder: (context, state) {
          return state.current > 0
              ? _buildSlider(context, state)
              : const SizedBox();
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
      height: 50,
      left: q.left,
      right: q.right,
    );
  }
}
