import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/content/app_content.dart';
import '../widgets/donation_summary_card.dart';
import '../widgets/news_card.dart';
import '../widgets/stat_card.dart';

/// Halaman dashboard utama donatur.
class HomePage extends StatelessWidget {
  final VoidCallback? onNavigateToDonation;

  const HomePage({super.key, this.onNavigateToDonation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppDimensions.spacingM),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildGreetingHeader(),
              const SizedBox(height: AppDimensions.spacingL),
              DonationSummaryCard(
                totalDonation: 'Rp 2.500.000',
                onDonatePressed: onNavigateToDonation,
              ),
              const SizedBox(height: AppDimensions.spacingL),
              _buildStatisticsSection(),
              const SizedBox(height: AppDimensions.spacingL),
              _buildNewsSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGreetingHeader() {
    return Row(
      children: [
        Container(
          width: AppDimensions.avatarL,
          height: AppDimensions.avatarL,
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.1),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.person,
            color: AppColors.primary,
            size: 32,
          ),
        ),
        const SizedBox(width: AppDimensions.spacingM),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${AppContent.homeGreeting}, ${AppContent.homeGreetingSuffix}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                AppContent.appTagline,
                style: const TextStyle(
                  fontSize: 13,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.notifications_outlined),
          color: AppColors.textSecondary,
        ),
      ],
    );
  }

  Widget _buildStatisticsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppContent.dampakDonasiTitle,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: AppDimensions.spacingM),
        Row(
          children: [
            Expanded(
              child: StatCard(
                title: AppContent.statDanaTerkumpul,
                value: 'Rp 150 Jt',
                icon: Icons.account_balance_wallet_outlined,
                iconColor: AppColors.primary,
              ),
            ),
            const SizedBox(width: AppDimensions.spacingM),
            Expanded(
              child: StatCard(
                title: AppContent.statAnakDibantu,
                value: '48',
                icon: Icons.school_outlined,
                iconColor: AppColors.info,
              ),
            ),
          ],
        ),
        const SizedBox(height: AppDimensions.spacingM),
        Row(
          children: [
            Expanded(
              child: StatCard(
                title: AppContent.statAnakBekerja,
                value: '32',
                icon: Icons.work_outline,
                iconColor: AppColors.success,
              ),
            ),
            const SizedBox(width: AppDimensions.spacingM),
            Expanded(
              child: StatCard(
                title: AppContent.statDonaturAktif,
                value: '125',
                icon: Icons.people_outline,
                iconColor: AppColors.warning,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildNewsSection() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppContent.beritaTerbaru,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                AppContent.lihatSemua,
                style: const TextStyle(color: AppColors.primary),
              ),
            ),
          ],
        ),
        const SizedBox(height: AppDimensions.spacingS),
        const NewsCard(
          title: 'Batch 3 Pelatihan Barista Dimulai!',
          subtitle: '15 anak penerima beasiswa memulai pelatihan intensif',
          date: '15 Mar 2026',
        ),
        const NewsCard(
          title: 'Wisuda Batch 2 — 12 Anak Siap Kerja',
          subtitle: 'Program magang industri berhasil diselesaikan',
          date: '10 Mar 2026',
        ),
        const NewsCard(
          title: 'Kerja Sama Baru dengan PT Maju Jaya',
          subtitle: 'Membuka 20 posisi magang untuk penerima beasiswa',
          date: '5 Mar 2026',
        ),
      ],
    );
  }
}
