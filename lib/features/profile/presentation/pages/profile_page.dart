import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/content/app_content.dart';
import '../../../../core/widgets/vip_header.dart';

/// Halaman profil donatur.
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VipHeader(
        title: AppContent.profilePageTitle,
        actions: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(AppDimensions.radiusM),
            ),
            child: IconButton(
              onPressed: () => context.push('/settings'),
              icon: const Icon(Icons.settings_outlined),
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppDimensions.spacingM),
        child: Column(
          children: [
            _buildProfileHeader(context),
            const SizedBox(height: AppDimensions.spacingL),
            _buildDonationStats(),
            const SizedBox(height: AppDimensions.spacingL),
            _buildMenuSection(context),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppDimensions.spacingL),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppDimensions.radiusL),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [AppColors.primary, AppColors.primaryLight],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(AppDimensions.radiusXL),
            ),
            child: const Icon(Icons.person, color: Colors.white, size: 40),
          ),
          const SizedBox(height: AppDimensions.spacingM),
          const Text(
            'Donatur VIP',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: AppDimensions.spacingXS),
          const Text(
            'donatur@email.com',
            style: TextStyle(fontSize: 14, color: AppColors.textSecondary),
          ),
          const SizedBox(height: AppDimensions.spacingM),
          OutlinedButton.icon(
            onPressed: () => context.push(
              '/edit-profile',
              extra: const {'donatur_id': '', 'user_id': ''},
            ),
            icon: const Icon(Icons.edit_outlined, size: 18),
            label: Text(AppContent.editProfile),
            style: OutlinedButton.styleFrom(
              minimumSize: Size.zero,
              padding: const EdgeInsets.symmetric(
                horizontal: AppDimensions.spacingL,
                vertical: AppDimensions.spacingS,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDonationStats() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppDimensions.spacingM),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.primary, AppColors.primaryDark],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(AppDimensions.radiusL),
      ),
      child: Row(
        children: [
          Expanded(
            child: _buildStatColumn(AppContent.statTotalDonasi, 'Rp 2.5 Jt'),
          ),
          Container(width: 1, height: 40, color: Colors.white30),
          Expanded(
            child: _buildStatColumn(AppContent.statFrekuensi, '12x'),
          ),
          Container(width: 1, height: 40, color: Colors.white30),
          Expanded(
            child: _buildStatColumn(AppContent.statSejak, 'Jan 2025'),
          ),
        ],
      ),
    );
  }

  Widget _buildStatColumn(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(fontSize: 11, color: Colors.white70),
        ),
      ],
    );
  }

  Widget _buildMenuSection(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppDimensions.radiusL),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildMenuItem(
            icon: Icons.history,
            title: AppContent.riwayatDonasi,
            onTap: () => context.push('/riwayat-donasi'),
          ),
          _buildDivider(),
          _buildMenuItem(
            icon: Icons.bar_chart,
            title: AppContent.laporanKeuangan,
            onTap: () {},
          ),
          _buildDivider(),
          _buildMenuItem(
            icon: Icons.settings_outlined,
            title: AppContent.pengaturan,
            onTap: () => context.push('/settings'),
          ),
          _buildDivider(),
          _buildMenuItem(
            icon: Icons.info_outline,
            title: AppContent.tentangKami,
            onTap: () => context.push('/about'),
          ),
          _buildDivider(),
          _buildMenuItem(
            icon: Icons.logout,
            title: AppContent.keluar,
            iconColor: AppColors.error,
            titleColor: AppColors.error,
            onTap: () => context.go('/login'),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    Color? iconColor,
    Color? titleColor,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(AppDimensions.spacingS),
        decoration: BoxDecoration(
          color: (iconColor ?? AppColors.primary).withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(AppDimensions.radiusM),
        ),
        child: Icon(icon, color: iconColor ?? AppColors.primary, size: 20),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
          color: titleColor ?? AppColors.textPrimary,
        ),
      ),
      trailing: Icon(
        Icons.chevron_right,
        color: iconColor ?? AppColors.textHint,
      ),
      onTap: onTap,
    );
  }

  Widget _buildDivider() {
    return const Divider(height: 1, indent: 72);
  }
}
