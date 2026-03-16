import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/content/app_content.dart';
import '../../../../core/widgets/vip_header.dart';

/// Halaman Tentang Kami — info yayasan, visi misi, kontak, struktur organisasi.
class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VipHeader(
        title: AppContent.aboutPageTitle,
        showBackButton: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppDimensions.spacingM),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildLogoSection(),
            const SizedBox(height: AppDimensions.spacingL),
            _buildVisiSection(),
            const SizedBox(height: AppDimensions.spacingL),
            _buildMisiSection(),
            const SizedBox(height: AppDimensions.spacingL),
            _buildStrukturSection(),
            const SizedBox(height: AppDimensions.spacingL),
            _buildKontakSection(),
            const SizedBox(height: AppDimensions.spacingL),
            _buildSosmedSection(),
            const SizedBox(height: AppDimensions.spacingXL),
          ],
        ),
      ),
    );
  }

  Widget _buildLogoSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppDimensions.spacingXL),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.primary, AppColors.primaryDark],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(AppDimensions.radiusL),
      ),
      child: Column(
        children: [
          // Logo VIP
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'V',
                style: TextStyle(
                  fontSize: 56,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                  height: 1,
                ),
              ),
              Text(
                'I',
                style: TextStyle(
                  fontSize: 56,
                  fontWeight: FontWeight.w900,
                  color: Colors.white70,
                  height: 1,
                ),
              ),
              Text(
                'P',
                style: TextStyle(
                  fontSize: 56,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                  height: 1,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppDimensions.spacingS),
          Text(
            AppContent.orgName,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.white,
              letterSpacing: 1,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppDimensions.spacingS),
          Text(
            AppContent.appTagline,
            style: const TextStyle(
              fontSize: 13,
              color: Colors.white70,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildVisiSection() {
    return _buildInfoCard(
      icon: Icons.visibility_outlined,
      title: AppContent.visiTitle,
      child: Text(
        AppContent.visi,
        style: const TextStyle(
          fontSize: 14,
          color: AppColors.textSecondary,
          height: 1.6,
        ),
      ),
    );
  }

  Widget _buildMisiSection() {
    final misiItems = [
      AppContent.get('app.misi_1'),
      AppContent.get('app.misi_2'),
      AppContent.get('app.misi_3'),
      AppContent.get('app.misi_4'),
      AppContent.get('app.misi_5'),
    ];

    return _buildInfoCard(
      icon: Icons.flag_outlined,
      title: AppContent.misiTitle,
      child: Column(
        children: misiItems.asMap().entries.map((entry) {
          return Padding(
            padding: const EdgeInsets.only(bottom: AppDimensions.spacingM),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      '${entry.key + 1}',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: AppDimensions.spacingM),
                Expanded(
                  child: Text(
                    entry.value,
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.textSecondary,
                      height: 1.5,
                    ),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildStrukturSection() {
    return _buildInfoCard(
      icon: Icons.people_outline,
      title: AppContent.strukturTitle,
      child: Column(
        children: [
          _buildOrgMember(
            AppContent.get('about.pembina'),
            'Erick Setiawan',
            Icons.star,
          ),
          _buildOrgMember(
            AppContent.get('about.pengawas'),
            'Chelsy Kartika E',
            Icons.shield_outlined,
          ),
          const Divider(height: AppDimensions.spacingL),
          _buildOrgMember(
            AppContent.get('about.ketua'),
            'Agil Mahendra',
            Icons.person,
          ),
          _buildOrgMember(
            AppContent.get('about.sekretaris'),
            'Anna WF',
            Icons.edit_note,
          ),
          _buildOrgMember(
            AppContent.get('about.bendahara'),
            'Fennie Luigi',
            Icons.account_balance_wallet_outlined,
          ),
        ],
      ),
    );
  }

  Widget _buildOrgMember(String role, String name, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppDimensions.spacingM),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: AppColors.primary, size: 20),
          ),
          const SizedBox(width: AppDimensions.spacingM),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
                Text(
                  role,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.textHint,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildKontakSection() {
    return _buildInfoCard(
      icon: Icons.contact_mail_outlined,
      title: AppContent.kontakTitle,
      child: Column(
        children: [
          _buildContactItem(Icons.location_on_outlined, AppContent.address),
          _buildContactItem(Icons.email_outlined, AppContent.email),
          _buildContactItem(Icons.language, AppContent.website),
        ],
      ),
    );
  }

  Widget _buildContactItem(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppDimensions.spacingM),
      child: Row(
        children: [
          Icon(icon, color: AppColors.primary, size: 20),
          const SizedBox(width: AppDimensions.spacingM),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.textSecondary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSosmedSection() {
    return _buildInfoCard(
      icon: Icons.share_outlined,
      title: AppContent.ikutiKami,
      child: Row(
        children: [
          _buildSosmedChip(Icons.camera_alt_outlined, AppContent.get('app.instagram')),
          const SizedBox(width: AppDimensions.spacingS),
          _buildSosmedChip(Icons.music_note, AppContent.get('app.tiktok')),
        ],
      ),
    );
  }

  Widget _buildSosmedChip(IconData icon, String handle) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.spacingM,
        vertical: AppDimensions.spacingS,
      ),
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(AppDimensions.radiusXL),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: AppColors.primary, size: 16),
          const SizedBox(width: AppDimensions.spacingXS),
          Text(
            '@$handle',
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard({
    required IconData icon,
    required String title,
    required Widget child,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppDimensions.spacingL),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppDimensions.radiusL),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(AppDimensions.spacingS),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(AppDimensions.radiusM),
                ),
                child: Icon(icon, color: AppColors.primary, size: 20),
              ),
              const SizedBox(width: AppDimensions.spacingM),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppDimensions.spacingM),
          child,
        ],
      ),
    );
  }
}
