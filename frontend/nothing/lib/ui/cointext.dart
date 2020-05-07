import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:nothing/bloc/coin/bloc.dart';
import 'package:nothing/color/scheme.dart';

class CoinText extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController(
      duration: const Duration(milliseconds: 500),
    );
    final isAnimating = useState(false);
    useEffect(() {
      final l = () => isAnimating.value = controller.isAnimating;
      controller.addListener(l);
      return () => controller.removeListener(l);
    });
    final opacity = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.0, 0.8, curve: Curves.easeOut),
      ),
    );
    final offset = Tween<Offset>(
      begin: const Offset(0.0, -10.0),
      end: const Offset(0.0, -40.0),
    ).animate(controller);

    Widget mainRow(BuildContext context, CoinState state) {
      return Row(children: [
        CircleAvatar(
            backgroundColor: NothingScheme.of(context).knob,
            foregroundColor: Colors.black,
            child: Icon(Icons.vpn_key)),
        SizedBox(width: 4),
        Text(
          '${state.total}'.padLeft(2, '0'),
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
          ),
        ),
      ]);
    }

    Widget animRow(BuildContext context, CoinState state) {
      return AnimatedBuilder(
        animation: controller,
        builder: (context, child) => Opacity(
          opacity: opacity.value,
          child: Transform.translate(
            offset: offset.value,
            child: Row(
              children: [
                Icon(Icons.vpn_key),
                SizedBox(width: 7),
                Text(
                  ' -2',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return BlocConsumer<CoinBloc, CoinState>(
      listener: (context, state) async {
        await controller.forward();
        controller.reset();
      },
      builder: (context, state) => Stack(children: [
        mainRow(context, state),
        if (isAnimating.value) animRow(context, state),
      ], alignment: Alignment.centerRight),
    );
  }
}
