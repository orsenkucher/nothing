import 'package:http/http.dart';

void main() async {
  var body = await fetchTasks();
  print(body);
}

Future<String> fetchTasks() async {
  var url = 'https://us-central1-crystal-factory.cloudfunctions.net/GiveTasks';
  var resp = await post(url, body: '{"count": 3}');
  print(resp.statusCode);
  return resp.body;
}
