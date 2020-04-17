abstract class Monad<A> {
  Monad<A> unit<A>(A a);
  Monad<B> flatMap<B>(Monad<A> a, Monad<B> Function(A a) f);

  Monad<B> map<B>(Monad<A> a, B Function(A a) f) =>
      flatMap(a, (a) => unit<B>(f(a)));

  Monad<C> map2<B, C>(
    Monad<A> a,
    Monad<B> b,
    C Function(A a, B b) fab,
  ) =>
      flatMap(a, (a) => b.map(b, (b) => fab(a, b)));
}

class OptionMonad<A> extends Monad<A> {
  OptionMonad._();
  factory OptionMonad.some(A a) = _Some<A>;
  factory OptionMonad.none() = _None<A>;

  @override
  Monad<A> unit<A>(A a) => OptionMonad<A>.some(a);

  @override
  Monad<B> flatMap<B>(Monad<A> a, Monad<B> Function(A a) f) {
    if (a is _Some<A>) {
      return f(a.val);
    }
    return OptionMonad<B>.none();
  }
}

class _Some<A> extends OptionMonad<A> {
  final A val;
  _Some(this.val) : super._();

  @override
  String toString() => 'Some($val)';
}

class _None<A> extends OptionMonad<A> {
  _None() : super._();
  @override
  String toString() => 'None';
}

$() {
  var some1 = OptionMonad<int>.some(10);
  var none2 = OptionMonad<String>.none();
  var some2 = OptionMonad<String>.some("apples");
  // why dart cant just infer them? <B,C>
  print(some1.map2<String, String>(some1, none2, (a, b) => '$a $b'));
  print(some1.map2<String, String>(some1, some2, (a, b) => '$a $b'));
}

main() => $();
