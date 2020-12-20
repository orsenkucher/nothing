import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nothing/bloc/onboard/bloc.dart';
import 'package:nothing/color/scheme.dart';

class Menu extends StatefulWidget {
  const Menu(
    this.onBack,
    this.swipeController, {
    Key key,
  }) : super(key: key);

  final void Function() onBack;
  final AnimationController swipeController;

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> with AutomaticKeepAliveClientMixin<Menu> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Container(
      color: Colors.amber,
      child: Stack(
        children: [
          GestureDetector(onTap: widget.onBack),
          Padding(
            padding: const EdgeInsets.only(right: 100),
            child: Container(color: NothingScheme.of(context).background),
          ),
          SingleChildScrollView(
            child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Padding(
                padding: const EdgeInsets.only(top: 40, bottom: 32),
                child: Text('Меню', style: TextStyle(fontSize: 36)),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: AnimatedBuilder(
                  animation: widget.swipeController,
                  builder: (context, child) {
                    final value = widget.swipeController.value;
                    return Transform(
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, -0.01)
                        ..setEntry(1, 2, -0.1)
                        ..rotateY((1 - value) / 10),
                      alignment: FractionalOffset.center,
                      child: child,
                    );
                  },
                  child: Card(
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: () {
                          const tt = [
                            'Туториал',
                            'Оцените нас',
                            'Оставить остзыв',
                            'Поделиться',
                            'Вибрация',
                          ];
                          final handlers = {
                            'Туториал': () {
                              context.read<OnboardBloc>().reset();
                              widget.onBack();
                            }
                          };
                          return tt
                              .map((t) => FlatButton(
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Text(t, style: TextStyle(fontSize: 24)),
                                    ),
                                    onPressed: handlers[t],
                                  ))
                              .map((w) => Padding(child: w, padding: const EdgeInsets.symmetric(vertical: 4)));
                        }()
                            .expand((w) sync* {
                              yield const Divider();
                              yield w;
                            })
                            .skip(1)
                            .toList(),
                      ),
                    ),
                  ),
                ),
              ),
            ]),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(40),
              child: IconButton(
                icon: Icon(Icons.arrow_forward_ios),
                onPressed: widget.onBack,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
