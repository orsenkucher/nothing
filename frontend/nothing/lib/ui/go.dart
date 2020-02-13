import 'package:nothing/domain/domain.dart';

void go() {
  Question question = Question(
    ['a', 'b'],
    [
      Question(['c', 'd'], [])
    ],
  );
  var jsoned = question.toJson();
  var dejsoned = Question.fromJson(jsoned);
  print(dejsoned);
}
