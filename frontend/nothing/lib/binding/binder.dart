import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

mixin BlocBinderSingleChildWidget on SingleChildWidget {}
typedef BlocBinderListener<S1, B2> = void Function(
    BuildContext context, S1 state, B2 bloc);

/// [BlocBinder] is helpful to bind or cross-bind two BloCs
class BlocBinder<B1 extends Bloc<dynamic, S1>, S1, B2 extends Bloc<dynamic, S2>,
    S2> extends SingleChildStatelessWidget with BlocBinderSingleChildWidget {
  final BlocBinderListener<S1, B2> f1;
  final BlocBinderListener<S2, B1> f2;
  BlocBinder({
    Key key,
    this.f1,
    this.f2,
    Widget child,
  }) : super(child: child, key: key);

  @override
  Widget buildWithChild(BuildContext context, Widget child) {
    return MultiBlocListener(
      listeners: [
        if (f1 != null)
          BlocListener<B1, S1>(
            listener: (context, state) => f1(
              context,
              state,
              BlocProvider.of<B2>(context),
            ),
          ),
        if (f2 != null)
          BlocListener<B2, S2>(
            listener: (context, state) => f2(
              context,
              state,
              BlocProvider.of<B1>(context),
            ),
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
