// Bind to dataflow and tune Cards widget
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nothing/bloc/feed/bloc.dart';
import 'package:nothing/data/model/question.dart';
import 'package:nothing/ui/cards.dart';

class CardsMaster extends StatelessWidget {
  const CardsMaster({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeedBloc, Feed>(
      builder: (context, state) => Cards(
        feed: state,
        // content: CCF(),
        // material: CM(),
        heightFactor: 0.60,
        widthFactor: 0.85,
        stack: 3,
      ),
    );
  }
}

class CM extends StatelessWidget with CardMaterial {
  final Widget content;
  final Animation<double> animation;
  CM(this.content, this.animation);

  @override
  Widget build(BuildContext context) {
    return content;
  }
}

abstract class A {
  A factory();
}

class B implements A {
  @override
  A factory() {
    return B();
  }
}

class C<T extends A> {
  void make() {
    // T.
  }
}

// class CCF extends StatefulWidget with CardContent {
//   final Question question;
//   final Animation<double> animation;
//   CCF._(this.question, this.animation);
//   factory CCF(Question q, Animation<double> a) => CCF._(q, a);

//   @override
//   State<StatefulWidget> createState() {
//     // TODO: implement createState
//     return null;
//   }

//   static void kek() {
//     print('heh');
//   }

//   void heh() {
//     CCF.kek();
//   }
// }

// class Test<T extends CCF> {
//   T t() {
//     // return CCF(null, null) as T;
//     // return T();
//     // return (CCF._(null, null) as int) as T;
//     // return T.
//     CCF.kek();
//     // T.kek();
//     return CCF(null, null)..heh();
//   }
// }

// // abstract class Kyk{
// //   factory Kyk(){
// //     // return
// //   }
// // }

// mixin Lul {
//   // CardContent get cnt;
//   static void kek() {}
//   void kyk() {}
//   // factory Lul();
// }

// class Tst extends StatelessWidget with Lul, CardContent {
//   final Question question;
//   final Animation<double> animation;

//   Tst(this.question, this.animation);

//   // @override
//   // // TODO: implement cnt
//   // CardContent get cnt => this();

//   // @override
//   // // TODO: implement animation
//   // Animation<double> get animation => null;

//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     Lul.kek();
//     // this.
//     return null;
//   }

//   // @override
//   // // TODO: implement question
//   // Question get question => null;
// }
