import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/about/presentation/pages/about_page.dart';
import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/donatur/presentation/pages/edit_profile_page.dart';
import '../../features/donatur/presentation/pages/register_donatur_page.dart';
import '../../features/news/presentation/pages/news_detail_page.dart';
import '../../features/riwayat/presentation/pages/riwayat_donasi_page.dart';
import '../../features/settings/presentation/pages/settings_page.dart';
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
        path: '/news-detail',
        builder: (context, state) {
          final data = state.extra as Map<String, dynamic>? ?? {};
          return NewsDetailPage(
            title: data['title'] as String? ?? '',
            description: data['description'] as String? ?? '',
            date: data['date'] as String? ?? '',
            category: data['category'] as String? ?? '',
            content: data['content'] as String?,
            imageUrl: data['imageUrl'] as String?,
          );
        },
      ),
      GoRoute(
        path: '/riwayat-donasi',
        builder: (context, state) => const RiwayatDonasiPage(),
      ),
      GoRoute(
        path: '/settings',
        builder: (context, state) => const SettingsPage(),
      ),
      GoRoute(
        path: '/about',
        builder: (context, state) => const AboutPage(),
      ),
      GoRoute(
        path: '/register-donatur',
        builder: (context, state) => const RegisterDonaturPage(),
      ),
      GoRoute(
        path: '/edit-profile',
        builder: (context, state) {
          final data = state.extra as Map<String, dynamic>? ?? {};
          return EditProfilePage(
            donaturId: data['donatur_id'] as String? ?? '',
            userId: data['user_id'] as String? ?? '',
          );
        },
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Text('Halaman tidak ditemukan: ${state.error}'),
      ),
    ),
  );
}
