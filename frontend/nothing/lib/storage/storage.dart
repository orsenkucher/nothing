import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mutex/mutex.dart';
import 'package:path_provider/path_provider.dart';

class NothingBlocStorage implements HydratedStorage {
  static NothingBlocStorage _instance;
  final Map<String, dynamic> _storage;
  final File _file;
  final Mutex _mu = Mutex();

  static Future<NothingBlocStorage> getInstance({
    Directory storageDirectory,
  }) async {
    if (_instance != null) {
      return _instance;
    }

    // Use one to one file <-> bloc?
    // Do encryption?
    final directory = storageDirectory ?? await getTemporaryDirectory();
    final file = File('${directory.path}/.hydrated_bloc.json');
    var storage = <String, dynamic>{};

    if (await file.exists()) {
      try {
        final fl = await file.readAsString();
        storage = json.decode(fl) as Map<String, dynamic>;
      } on dynamic catch (_) {
        await file.delete();
      }
    }

    _instance = NothingBlocStorage._(storage, file);
    return _instance;
  }

  NothingBlocStorage._(this._storage, this._file);

  @override
  dynamic read(String key) {
    return _storage[key];
  }

  @override
  Future<void> write(String key, dynamic value) async {
    await _mu.acquire();
    try {
      _storage[key] = value;
      final str = json.encode(_storage);
      final fl = await _file.writeAsString(str);
      assert(await fl.readAsString() == str);
    } finally {
      _mu.release();
    }
  }

  @override
  Future<void> delete(String key) async {
    await _mu.acquire();
    try {
      _storage[key] = null;
      return await _file.writeAsString(json.encode(_storage));
    } finally {
      _mu.release();
    }
  }

  @override
  Future<void> clear() async {
    _storage.clear();
    _instance = null;
    return await _file.exists() ? await _file.delete() : null;
  }
}
