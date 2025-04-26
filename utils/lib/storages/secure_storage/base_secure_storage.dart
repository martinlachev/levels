import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:utils/utils.dart';

abstract class BaseSecureStorage implements Storage {
  final _storage = const FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
  );

  Map<String, String> _localStorage = {};

  @override
  Future<void> init() async {
    _localStorage = await _storage.readAll();
  }

  @override
  String? read({required String key}) {
    return _localStorage[key];
  }

  @override
  void write({required String key, required String value}) async {
    _localStorage[key] = value;
    await _storage.write(key: key, value: value);
  }

  @override
  void delete({required String key}) async {
    _localStorage.remove(key);
    await _storage.delete(key: key);
  }

  @override
  void deleteAll() async {
    _localStorage.clear();
    await _storage.deleteAll();
  }

  // App related
  String? get userJourneyPath;
  set userJourneyPath(String? value);
}
