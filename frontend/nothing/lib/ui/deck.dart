import 'package:flutter/material.dart';

typedef Widget CardBuilder(BuildContext context, int index);

class CardDeck extends StatefulWidget {
  final CardBuilder _cardBuilder;
  final int _totalCount;
  final int _stackCount;

  const CardDeck({
    @required CardBuilder cardBuilder,
    @required int totalCount,
    int stackCount = 3,
  })  : this._cardBuilder = cardBuilder,
        this._totalCount = totalCount,
        this._stackCount = stackCount,
        assert(totalCount >= stackCount);

  @override
  _CardDeckState createState() => _CardDeckState();
}

class _CardDeckState extends State<CardDeck> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // for (int i = widget._totalCount - index - 1;
        //     i >= widget._totalCount - widget._stackCount - index;
        //     i--)
        for (int i = index; i < widget._stackCount; i++)
          widget._cardBuilder(context, i),
      ],
    );
  }
}
