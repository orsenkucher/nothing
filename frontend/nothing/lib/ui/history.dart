import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nothing/binding/control.dart';
import 'package:nothing/bloc/history/bloc.dart';
import 'package:nothing/bloc/summary/bloc.dart';
import 'package:nothing/color/scheme.dart';

class History extends StatefulWidget {
  final void Function() onBack;

  const History(this.onBack);

  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> with AutomaticKeepAliveClientMixin<History> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return _feedListener(Container(
      color: Colors.amber,
      child: Stack(
        children: [
          GestureDetector(onTap: widget.onBack),
          Padding(
            padding: const EdgeInsets.only(left: 100),
            child: Container(
              color: NothingScheme.of(context).background,
              child: HistoryStack(),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.all(40),
              child: Text('Уровни', style: TextStyle(fontSize: 36)),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(40),
              child: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: widget.onBack,
              ),
            ),
          ),
        ],
      ),
    ));
  }

  Widget _feedListener(Widget child) {
    return BlocListener<ControlCubit, ControlState>(
      listener: (context, state) {
        widget.onBack();
      },
      child: child,
    );
  }
}

class HistoryStack extends StatelessWidget {
  const HistoryStack({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      BlocBuilder<HistoryBloc, HistoryState>(
        builder: (context, state) => Container(
          color: NothingScheme.of(context).historyBg,
          child: ListView(
            itemExtent: 60,
            physics: const BouncingScrollPhysics(),
            children: [
              const SizedBox(),
              const SizedBox(),
              ..._items(context, state.items),
              const SizedBox(),
            ],
          ),
        ),
      ),
      FuzzyOut(height: 120, loc: Location.up),
      FuzzyOut(height: 32, loc: Location.down, stops: const [0, 1]),
    ]);
  }

  Iterable<Widget> _items(BuildContext context, List<HistoryItem> items) {
    var counter = 0;
    return items.map(
      (it) => Padding(
        padding: const EdgeInsets.only(left: 12),
        child: Row(mainAxisSize: MainAxisSize.max, children: [
          Expanded(
            child: FlatButton(
              onPressed: () {
                final pos = counter;
                return () => context.bloc<ControlCubit>().select(pos);
              }(),
              // splashColor: NothingScheme.of(context).hint.withOpacity(0.2),
              // highlightColor: NothingScheme.of(context).neutral.withOpacity(0.1),
              child: Row(mainAxisSize: MainAxisSize.max, children: [
                Flexible(
                  child: Text(
                    '${counter += 1}. ${it.question.question}',
                    maxLines: 1,
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 31,
                      color: _itemColor(context, it.answer),
                    ),
                  ),
                ),
              ]),
            ),
          ),
        ]),
      ),
    );
  }

  Color _itemColor(BuildContext context, SummaryAnswer answer) =>
      answer.tries > 0 ? NothingScheme.of(context).question : NothingScheme.of(context).skip;
}

enum Location { up, down }

extension Location$ on Location {
  Alignment get alignment => const {
        Location.up: Alignment.topCenter,
        Location.down: Alignment.bottomCenter,
      }[this];

  Location operator ~() => const {
        Location.up: Location.down,
        Location.down: Location.up,
      }[this];
}

class FuzzyOut extends StatelessWidget {
  final Location loc;
  final double height;
  final List<double> stops;
  const FuzzyOut({this.loc, this.height, this.stops = const [0.5, 1]});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: loc.alignment,
      child: Container(
        height: height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [NothingScheme.of(context).historyBg, NothingScheme.of(context).historyBg.withOpacity(0)],
            begin: loc.alignment,
            end: (~loc).alignment,
            stops: stops,
          ),
        ),
      ),
    );
  }
}
