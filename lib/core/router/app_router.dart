import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/riwayat/presentation/pages/riwayat_donasi_page.dart';
import '../../features/shell/presentation/pages/main_shell.dart';
import '../../features/splash/presentation/pages/splash_page.dart';

/// Router aplikasi menggunakan go_router.
class AppRouter {
  AppRouter._();

  static final router = GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => const MainShell(),
      ),
      GoRoute(
        path: '/riwayat-donasi',
        builder: (context, state) => const RiwayatDonasiPage(),
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Text('Halaman tidak ditemukan: ${state.error}'),
      ),
    ),
  );
}
