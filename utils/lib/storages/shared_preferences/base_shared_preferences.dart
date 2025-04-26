import 'package:utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract base class BaseSharedPreferencesStorage implements Storage {
  final storage = SharedPreferencesAsync();
  final Map<String, String> _localStorage = {};

  @override
  Future<void> init() async {
    final allKeys = await storage.getKeys();

    for (final key in allKeys) {
      try {
        var value = await storage.getString(key);

        _localStorage[key] = value ?? '';
      } catch (e) {
        continue;
      }
    }
  }

  @override
  String? read({required String key}) {
    return _localStorage[key];
  }

  @override
  void write({required String key, required String value}) async {
    await storage.setString(key, value);
    _localStorage[key] = value;
  }

  @override
  void delete({required String key}) async {
    await storage.remove(key);
    _localStorage.remove(key);
  }

  @override
  void deleteAll() async {
    await storage.clear();
    _localStorage.clear();
  }

  // App related
  // First time install
  bool get isFirstTimeInstall;
  set isFirstTimeInstall(bool value);
}
