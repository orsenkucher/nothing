import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class FocusNodeModel extends Model {
  FocusNodeModel(this._focusNode);
  FocusNode _focusNode;
  FocusNode get focusNode => _focusNode;

  void refocus() {
    focusNode.unfocus();
    focusNode.requestFocus();
  }

  static FocusNodeModel of(BuildContext context) {
    return ScopedModel.of<FocusNodeModel>(context, rebuildOnChange: true);
  }
}
