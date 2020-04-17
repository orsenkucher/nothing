abstract class Applicative<_ extends F<__>, __> {
  F<C> map2<A, B, C>(F<A> fa, F<B> fb, C Function(A a, B b) fab);
  F<A> unit<A>(A a);

  F<B> map<A, B>(F<A> fa, B Function(A a) f) =>
      map2(fa, unit(null), (a, _) => f(a));
}

// class IdApplicative<A> implements Applicative<IdApplicative<A>,A>{

// }

abstract class F<_> {}

abstract class Monad<__ extends F<_>, _> {
  F<A> unit<A>(A a);
  F<B> flatMap<A, B>(F<A> fa, F<B> Function<A, B>(A a) f);

  F<B> map<A, B>(F<A> fa, B Function<A, B>(A a) f) =>
      flatMap(fa, <A, B>(A a) => unit<B>(f<A, B>(a)));
  F<C> map2<A, B, C>(F<A> fa, F<B> fb, C Function<A, B, C>(A a, B b) fab) =>
      flatMap(fa, <A, C>(a) => map<B, C>(fb, <B, C>(b) => fab<A, B, C>(a, b)));
}

class IdMonad<A> extends Monad<IdMonad<A>, A> implements F<A> {
  final A a;
  IdMonad(this.a);
  @override
  F<B> flatMap<A, B>(F<A> fa, F<B> Function<A, B>(A a) f) => f(a);
  @override
  F<A> unit<A>(A a) => IdMonad(a);
}

$() {
  // IdMonad<int> a = IdMonad<int>(1);
  // IdMonad<int> b = IdMonad<int>(3);

  // a.unit(12);
  // a.map<int, int>(b, test);
  // a.flatMap(a, <int, IdMonad<int>>(int a2) => IdMonad<int>(12));
  // a.flatMap<int, IdMonad<int>>(a, <int, IdMonad>(int a2) => IdMonad<int>(12));
  // a.flatMap<int, IdMonad<int>>(a, ttt);
  // a.map2(a, a, (int a1, int b1) => a1 + b1);
  // a.map<int, int>(a, (int a) => a);
  // a.map<int, int>(a, test);
}

int test<A, B>(int a) => a;

IdMonad<int> ttt(int a) => IdMonad<int>(12);
