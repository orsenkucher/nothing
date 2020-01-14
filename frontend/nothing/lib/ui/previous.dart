import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nothing/bloc/feed/bloc.dart';

class Previous extends StatelessWidget {
  final double height;

  const Previous({this.height});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: SizedBox(
        height: height,
        child: Center(
          child: BlocBuilder<FeedBloc, Feed>(
            builder: (context, state) => state.current > 0
                ? _buildText(
                    context,
                    state.batch[state.current - 1].question,
                  )
                : _buildText(context, ""),
          ),
        ),
      ),
    );
  }

  Widget _buildText(BuildContext context, String text) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 200),
      child: Text(
        text,
        key: ValueKey(text),
        style: TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),
      ),
    );
  }
}
