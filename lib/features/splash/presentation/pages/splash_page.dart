import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/content/app_content.dart';

/// Splash screen saat pertama buka app.
/// Tampilkan logo VIP lalu redirect ke login/home.
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );
    _scaleAnimation = Tween<double>(begin: 0.8, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutBack),
    );
    _controller.forward();
    _navigateAfterDelay();
  }

  Future<void> _navigateAfterDelay() async {
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) {
      // TODO: Cek auth token, jika ada → /home, jika tidak → /login
      context.go('/login');
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: ScaleTransition(
            scale: _scaleAnimation,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo VIP
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'V',
                      style: TextStyle(
                        fontSize: 72,
                        fontWeight: FontWeight.w900,
                        color: AppColors.textPrimary,
                        height: 1,
                      ),
                    ),
                    Text(
                      'I',
                      style: TextStyle(
                        fontSize: 72,
                        fontWeight: FontWeight.w900,
                        color: AppColors.primary,
                        height: 1,
                      ),
                    ),
                    Text(
                      'P',
                      style: TextStyle(
                        fontSize: 72,
                        fontWeight: FontWeight.w900,
                        color: AppColors.textPrimary,
                        height: 1,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppDimensions.spacingS),
                Text(
                  AppContent.orgName.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textSecondary,
                    letterSpacing: 3,
                  ),
                ),
                const SizedBox(height: AppDimensions.spacingXL),
                Text(
                  AppContent.appTagline,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
