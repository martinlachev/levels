import 'package:level_one/level_one.dart';
import 'package:utils/utils.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Register the DI modules
  await DI.init(components: AppDI());

  // Initialize the app router
  final appRouter = await DI.resolve<AppRouter>().initialize();

  runApp(
    MaterialApp.router(
      title: 'Level One',
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      theme: ThemeData(primarySwatch: Colors.blue),
    ),
  );
}
