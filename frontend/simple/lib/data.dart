import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'data.freezed.dart';
part 'data.g.dart';

@freezed
abstract class Data with _$Data {
  factory Data(String b64) = _Data;
  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

@freezed
abstract class DataEvent with _$DataEvent {
  factory DataEvent.newDataPlease() = _DataEvent;
}

class DataBloc extends Bloc<DataEvent, Data> {
  @override
  Data get initialState => Data("initial");

  @override
  Stream<Data> mapEventToState(DataEvent event) async* {
    yield Data(DateTime.now().toIso8601String());
  }
}

@freezed
abstract class LogEvent with _$LogEvent {
  factory LogEvent.logData(Data data) = _LogData;
  factory LogEvent.logBlank() = _LogBlank;
}

class LogBloc extends Bloc<LogEvent, String> {
  @override
  String get initialState => '> hello';

  @override
  Stream<String> mapEventToState(LogEvent event) async* {
    yield event.when(logData: (data) {
      print(data);
      return '$state\n$data';
    }, logBlank: () {
      const str = '..................BLANK..................';
      print(str);
      return '$state\n$str';
    });
  }
}
