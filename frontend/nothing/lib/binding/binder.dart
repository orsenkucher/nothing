import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

mixin BlocBinderSingleChildWidget on SingleChildWidget {}
typedef BlocBinderListener<S1, B2> = void Function(
    BuildContext context, S1 state, B2 bloc);

typedef BlocBinderCondition<S> = bool Function(S previous, S current);

/// [BlocBinder] is helpful to bind or cross-bind two BloCs
class BlocBinder<B1 extends Bloc<dynamic, S1>, S1, B2 extends Bloc<dynamic, S2>,
    S2> extends SingleChildStatelessWidget with BlocBinderSingleChildWidget {
  final BlocBinderListener<S1, B2> direct;
  final BlocBinderListener<S2, B1> reverse;
  final BlocBinderCondition<S1> directCondition;
  final BlocBinderCondition<S2> reverseCondition;
  BlocBinder({
    Key key,
    this.direct,
    this.reverse,
    this.directCondition,
    this.reverseCondition,
    Widget child,
  }) : super(child: child, key: key);

  @override
  Widget buildWithChild(BuildContext context, Widget child) {
    return MultiBlocListener(
      listeners: [
        if (direct != null)
          BlocListener<B1, S1>(
            condition: directCondition,
            listener: (context, state) =>
                direct(context, state, context.bloc<B2>()),
          ),
        if (reverse != null)
          BlocListener<B2, S2>(
            condition: reverseCondition,
            listener: (context, state) =>
                reverse(context, state, context.bloc<B1>()),
          ),
      ],
      child: child,
    );
  }
}

class MultiBlocBinder extends StatelessWidget {
  final List<BlocBinder> binders;

  final Widget child;

  const MultiBlocBinder({
    Key key,
    @required this.binders,
    @required this.child,
  })  : assert(binders != null),
        assert(child != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: binders,
      child: child,
    );
  }
}
