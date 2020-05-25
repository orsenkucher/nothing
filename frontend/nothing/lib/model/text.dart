import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class TextModel extends Model {
  String _text;
  String get text => _text;

  void update(String s) {
    _text = s;
    notifyListeners();
  }

  static TextModel of(BuildContext context) {
    return ScopedModel.of<TextModel>(context, rebuildOnChange: true);
  }
}
