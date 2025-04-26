import 'package:utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  final navigatorKey = GlobalKey<NavigatorState>();
  final scaffoldKey = GlobalKey<ScaffoldMessengerState>();

  Future<GoRouter> initialize({required List<GoRoute> routes}) async {
    final initialLocation = await _getInitialLocation();

    return GoRouter(
      navigatorKey: navigatorKey,
      debugLogDiagnostics: kDebugMode,
      initialLocation: initialLocation,
      routes: routes,
    );
  }

  void goTo({required String route, Object? parameters}) {
    navigatorKey.currentState!.context.go(route, extra: parameters);
  }

  Future<T?> push<T extends Object?>({
    required String route,
    Object? parameters,
  }) async {
    return await navigatorKey.currentState!.context.push(
      route,
      extra: parameters,
    );
  }

  void pop<T extends Object>([T? result]) {
    return navigatorKey.currentState!.context.pop(result);
  }

  Future<String> _getInitialLocation() async {
    _clearSecureStorageOnFirstInstall();

    return '/login';
  }

  void _clearSecureStorageOnFirstInstall() {
    final secureStorage = resolve<BaseSecureStorage>();
    final sharedPreferences = resolve<BaseSharedPreferencesStorage>();

    if (sharedPreferences.isFirstTimeInstall) {
      secureStorage.deleteAll();
      sharedPreferences.isFirstTimeInstall = false;
    }
  }
}
