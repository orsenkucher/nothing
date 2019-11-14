import 'dart:math';

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
  int index = 8;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        for (int i = min(widget._stackCount + index, widget._totalCount) - 1;
            i >= index;
            i--)
          widget._cardBuilder(context, i),
      ],
    );
  }
}
