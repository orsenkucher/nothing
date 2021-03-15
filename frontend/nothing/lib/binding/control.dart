import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nothing/bloc/feed/bloc.dart';
import 'package:nothing/bloc/history/bloc.dart';
import 'package:nothing/domain/domain.dart';

class ControlState {
  const ControlState();
}

class ControlCubit extends Cubit<ControlState> {
  ControlCubit({
    required this.feed,
    required this.history,
  }) : super(ControlState());

  final FeedBloc feed;
  final HistoryBloc history;

  void select(int level) {
    print('level: $level');
    final tree = _makeQTree(level);
    feed.add(FeedEvent.newArrived(tree, true));
    emit(ControlState());
  }

  QTree _makeQTree(int pos) {
    final items = history.state.items;
    var tree = QTree();
    for (var i = items.length - 1; i > pos; i--) {
      final item = items[i];
      if (item.answer.tries > 0) continue;
      final inner = tree.copyWith(question: item.question);
      tree = QTree(left: inner);
    }
    return tree.copyWith(question: items[pos].question); // set current
  }
}
