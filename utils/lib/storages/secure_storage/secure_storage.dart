import 'package:utils/utils.dart';

final class SecureStorage extends BaseSecureStorage {
  static const _userJourneyPathKey = 'userJourneyPath';

  @override
  String? get userJourneyPath {
    return read(key: _userJourneyPathKey);
  }

  @override
  set userJourneyPath(String? value) {
    if (value == null) {
      return;
    }

    write(key: _userJourneyPathKey, value: value);
  }
}
