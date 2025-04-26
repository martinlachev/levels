import 'package:utils/utils.dart';
import 'package:flutter/material.dart';

enum AuthenticationRoute implements AppRoute {
  login(path: '/login', name: 'Login');

  @override
  final String path;
  @override
  final String name;

  const AuthenticationRoute({required this.path, required this.name});

  @override
  RouteBase get route {
    switch (this) {
      case AuthenticationRoute.login:
        return GoRoute(
          name: name,
          path: path,
          builder: (context, state) {
            return _child;
          },
        );
    }
  }

  Widget get _child {
    switch (this) {
      case AuthenticationRoute.login:
        return BlocProvider(
          create: (context) => LoginBloc(),
          child: const LoginScreen(),
        );
    }
  }

  static List<RouteBase> routes() {
    return values.map((route) => route.route).toList();
  }
}
