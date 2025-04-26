import 'package:utils/utils.dart';

final class SharedPreferencesStorage extends BaseSharedPreferencesStorage {
  static const _isFirstTimeInstallKey = 'isFirstTimeInstall';

  @override
  bool get isFirstTimeInstall {
    final value = read(key: _isFirstTimeInstallKey);

    if (value == null) {
      return true;
    }

    return bool.parse(value);
  }

  @override
  set isFirstTimeInstall(bool value) {
    write(key: _isFirstTimeInstallKey, value: value.toString());
  }
}
