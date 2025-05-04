import 'package:level_one/app_routes.dart';
import 'package:utils/utils.dart';

final class AppDI extends DIComponents {
  @override
  Future<void> registerModules() async {
    await super.registerModules();
    await registerSecureStorageService();
    await registerSharedPreferencesService();

    DI.registerInstance<AppRouter>(LevelOneRouter());
  }

  Future<void> registerSecureStorageService() async {
    final secureStorageService = SecureStorage();
    await secureStorageService.init();
    DI.registerInstance<BaseSecureStorage>(secureStorageService);
  }

  Future<void> registerSharedPreferencesService() async {
    final sharedPref = SharedPreferencesStorage();
    await sharedPref.init();
    DI.registerInstance<BaseSharedPreferencesStorage>(sharedPref);
  }
}
