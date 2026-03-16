import 'package:flutter/material.dart';

import 'core/content/app_content.dart';
import 'core/di/injection.dart';
import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Future.wait([
    configureDependencies(),
    AppContent.load(),
  ]);

  runApp(const App());
}

/// Root widget aplikasi YayVIP Donatur.
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: AppContent.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      routerConfig: AppRouter.router,
    );
  }
}
