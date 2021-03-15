import 'dart:collection';
import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:nothing/bloc/feed/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nothing/bloc/xp/bloc.dart';
import 'package:nothing/bloc/xp_queue/bloc.dart';

class Confetti extends StatefulWidget {
  @override
  _ConfettiState createState() => _ConfettiState();
}

class _ConfettiState extends State<Confetti> {
  late final ConfettiController _feedController = ConfettiController(duration: const Duration(seconds: 10));
  late final ConfettiController _levelController = ConfettiController(duration: const Duration(milliseconds: 1600));

  @override
  void initState() {
    super.initState();
    _feedController.play();
    // _levelController.play();
  }

  @override
  void dispose() {
    _feedController.dispose();
    _levelController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _listenFeed(context, _listenLevelup(context, _build(context)));
  }

  Widget _listenLevelup(BuildContext context, Widget child) {
    return BlocListener<XPQueueBloc, Queue<XPState>>(
      listenWhen: (_, next) => next.isNotEmpty && next.first.totalxp == 0,
      listener: (_1, _2) => _levelController.play(),
      child: child,
    );
  }

  Widget _listenFeed(BuildContext context, Widget child) {
    return BlocListener<FeedBloc, FeedState>(
      listenWhen: (_, next) => next is Available,
      listener: (context, available) {
        final state = available as Available;
        if (state.tree.question?.id == 1) {
          _feedController.play();
        } else {
          _feedController.stop();
        }
      },
      child: child,
    );
  }

  Widget _build(BuildContext context) {
    const colors = [Colors.blue, Colors.pink, Colors.orange, Colors.purple];
    return Stack(
      children: [
        ConfettiWidget(
          confettiController: _feedController,
          blastDirectionality: BlastDirectionality.explosive, // don't specify a direction, blast randomly
          shouldLoop: true, // start again as soon as the animation is finished
          colors: colors,
        ),
        Align(
          alignment: Alignment.topRight,
          child: ConfettiWidget(
            confettiController: _levelController,
            blastDirection: pi / 2,
            maxBlastForce: 5, // set a lower max blast force
            minBlastForce: 2, // set a lower min blast force
            emissionFrequency: 0.25,
            numberOfParticles: 15, // a lot of particles at once
            blastDirectionality: BlastDirectionality.explosive,
            particleDrag: 0.01,
            gravity: 0.2,
            colors: colors,
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: ConfettiWidget(
            confettiController: _levelController,
            blastDirection: pi / 2,
            maxBlastForce: 5,
            minBlastForce: 2,
            emissionFrequency: 0.25,
            numberOfParticles: 15,
            blastDirectionality: BlastDirectionality.explosive,
            particleDrag: 0.01,
            gravity: 0.2,
            colors: colors,
          ),
        )
      ],
    );
  }
}
