import 'package:flutter/material.dart';
import 'package:nothing/color/scheme.dart';

class Menu extends StatefulWidget {
  final void Function() onBack;

  const Menu(
    this.onBack, {
    Key key,
  }) : super(key: key);

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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40, bottom: 32),
                  child: Text('Меню', style: TextStyle(fontSize: 36)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Card(
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: () {
                          const tt = [
                            'Звук',
                            'Оцените нас',
                            'Оставить остзыв',
                            'Поделиться',
                            'Вибрация',
                          ];
                          return tt
                              .map((t) => Text(t, style: TextStyle(fontSize: 24)))
                              .map((w) => Padding(child: w, padding: const EdgeInsets.symmetric(vertical: 16)));
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
              ],
            ),
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
