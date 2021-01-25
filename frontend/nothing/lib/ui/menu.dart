import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nothing/bloc/feed/bloc.dart';
import 'package:nothing/bloc/menu/bloc.dart';
import 'package:nothing/bloc/onboard/bloc.dart';
import 'package:nothing/color/scheme.dart';
import 'package:nothing/ui/toggle.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

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
                child: Text('Menu', style: TextStyle(fontSize: 36)),
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
                          final platform = Platform.isIOS;
                          final titles = [
                            'Tutorial',
                            'Rate us',
                            'Submit',
                            'Share question',
                            if (platform) 'Vibration',
                          ];
                          final handlers = {
                            'Tutorial': () {
                              context.read<OnboardBloc>().reset();
                              widget.onBack();
                            },
                            'Share question': () {
                              final question = context.read<FeedBloc>().state.maybeWhen(
                                    available: (tree) => tree.question.question,
                                    orElse: () => '',
                                  );
                              final appLink =
                                  Platform.isIOS ? '\nhttps://apps.apple.com/gb/app/nothing-puzzle/id1461158811' : '';
                              Share.share('The question from NOTHING PUZZLE2: "$question"' + appLink);
                            },
                            'Vibration': platform ? () => context.read<MenuBloc>().flip() : null,
                            'Submit': () async {
                              const url =
                                  'https://docs.google.com/forms/d/1Iz6n7bKA2TyCMdAdL-L9cZm8uBjvbk8FP-F3sW_KDSk/edit';
                              if (await canLaunch(url)) {
                                await launch(url);
                              }
                            }
                          };
                          final wrappers = <String, Widget Function(Widget)>{
                            'Vibration': platform
                                ? (Widget child) {
                                    return Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Opacity(opacity: 0.0, child: Toggle()),
                                        child,
                                        SizedBox(width: 8.0),
                                        Toggle(),
                                      ],
                                    );
                                  }
                                : null,
                          };
                          return titles
                              .map((t) => FlatButton(
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: (wrappers[t] ?? (x) => x)(Text(t, style: TextStyle(fontSize: 24))),
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
              padding: const EdgeInsets.all(12),
              child: IconButton(
                padding: const EdgeInsets.all(40),
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
