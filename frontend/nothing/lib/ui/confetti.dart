import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:nothing/bloc/feed/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nothing/bloc/validation/bloc.dart';
import 'package:nothing/domain/domain.dart';

class Confetti extends StatefulWidget {
  @override
  _ConfettiState createState() => _ConfettiState();
}

class _ConfettiState extends State<Confetti> {
  ConfettiController _controller;
  ConfettiController _correctController;

  @override
  void initState() {
    super.initState();
    _controller = ConfettiController(duration: const Duration(seconds: 10));
    _correctController = ConfettiController(duration: const Duration(milliseconds: 700));
    _controller.play();
  }

  @override
  void dispose() {
    _controller.dispose();
    _correctController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _listenFeed(context, _listenValidation(context, _build(context)));
  }

  Widget _listenValidation(BuildContext context, Widget child) {
    return BlocListener<ValidationBloc, ValidationState>(
      listener: (context, state) {
        state.maybeWhen(
          just: (state) {
            if (state is Correct) {
              _correctController.play();
            }
          },
          orElse: void$,
        );
      },
      child: child,
    );
  }

  Widget _listenFeed(BuildContext context, Widget child) {
    return BlocListener<FeedBloc, FeedState>(
      listenWhen: (_, next) => next is Available,
      listener: (context, available) {
        final state = available as Available;
        if (state.tree.question.id == 1) {
          _controller.play();
        } else {
          _controller.stop();
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
          confettiController: _controller,
          blastDirectionality: BlastDirectionality.explosive, // don't specify a direction, blast randomly
          shouldLoop: true, // start again as soon as the animation is finished
          colors: colors,
        ),
        Align(
          alignment: Alignment.topCenter,
          child: ConfettiWidget(
            confettiController: _correctController,
            blastDirection: pi / 2,
            maxBlastForce: 5, // set a lower max blast force
            minBlastForce: 2, // set a lower min blast force
            emissionFrequency: 0.25,
            numberOfParticles: 42, // a lot of particles at once
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
