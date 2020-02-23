import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'dart:async';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:nothing/storage/storage.dart';

class NothingBlocDelegate extends HydratedBlocDelegate {
  static Future<NothingBlocDelegate> build({
    Directory storageDirectory,
  }) async {
    return NothingBlocDelegate(
      await NothingBlocStorage.getInstance(storageDirectory: storageDirectory),
    );
  }

  NothingBlocDelegate(storage) : super(storage);

  @override
  void onTransition(Bloc bloc, Transition transition) {
    // print('$bloc -> $transition');
    super.onTransition(bloc, transition);
  }
}
