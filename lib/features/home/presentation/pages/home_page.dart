import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildModernHeader(context),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: AppDimensions.spacingM),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: AppDimensions.spacingL),
                    DonationSummaryCard(
                      totalDonation: 'Rp 2.500.000',
                      onDonatePressed: onNavigateToDonation,
                    ),
                    const SizedBox(height: AppDimensions.spacingL),
                    _buildStatisticsSection(),
                    const SizedBox(height: AppDimensions.spacingL),
                    _buildNewsSection(context),
                    const SizedBox(height: AppDimensions.spacingXL),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildModernHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(
        AppDimensions.spacingL,
        AppDimensions.spacingL,
        AppDimensions.spacingM,
        AppDimensions.spacingL,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Avatar with red accent
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [AppColors.primary, AppColors.primaryLight],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(AppDimensions.radiusL),
            ),
            child: const Icon(Icons.person, color: Colors.white, size: 26),
          ),
          const SizedBox(width: AppDimensions.spacingM),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${AppContent.homeGreeting}, ${AppContent.homeGreetingSuffix}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  AppContent.appTagline,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          // Notification
          Container(
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(AppDimensions.radiusM),
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Badge(
                smallSize: 8,
                backgroundColor: AppColors.primary,
                child: Icon(Icons.notifications_outlined),
              ),
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
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

  Widget _buildNewsSection(BuildContext context) {
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
        NewsCard(
          title: 'Batch 3 Pelatihan Barista Dimulai!',
          subtitle: '15 anak penerima beasiswa memulai pelatihan intensif',
          date: '15 Mar 2026',
          onTap: () => context.push('/news-detail', extra: {
            'title': 'Batch 3 Pelatihan Barista Dimulai!',
            'description': '15 anak penerima beasiswa memulai pelatihan intensif',
            'date': '15 Mar 2026',
            'category': 'Pelatihan',
            'content':
                'Sebanyak 15 anak penerima beasiswa VIP batch 3 resmi memulai pelatihan intensif barista di Vernon Edu. Program pelatihan ini dirancang selama 10 bulan agar peserta siap kerja di industri F&B.\n\nPara peserta akan mendapatkan pelatihan hands-on mulai dari dasar-dasar pembuatan kopi, latte art, hingga manajemen kedai kopi. Selain keterampilan teknis, mereka juga akan dibekali soft skill seperti komunikasi, teamwork, dan customer service.\n\nProgram ini merupakan bagian dari komitmen Yayasan Vernon Indonesia Pintar dalam menyediakan jalur karir yang konkret bagi anak-anak berprestasi dari keluarga kurang mampu.\n\n"Kami percaya bahwa setiap anak berhak mendapatkan kesempatan untuk berkembang dan meraih masa depan yang lebih baik," ujar Agil Mahendra, Ketua Yayasan VIP.',
          }),
        ),
        NewsCard(
          title: 'Wisuda Batch 2 — 12 Anak Siap Kerja',
          subtitle: 'Program magang industri berhasil diselesaikan',
          date: '10 Mar 2026',
          onTap: () => context.push('/news-detail', extra: {
            'title': 'Wisuda Batch 2 — 12 Anak Siap Kerja',
            'description': 'Program magang industri berhasil diselesaikan',
            'date': '10 Mar 2026',
            'category': 'Kelulusan',
            'content':
                'Selamat kepada 12 penerima beasiswa batch 2 yang telah menyelesaikan seluruh rangkaian program VIP!\n\nMereka telah menjalani 10 bulan pelatihan intensif di Vernon Edu dan 4 bulan magang di perusahaan mitra. Kini mereka siap memasuki dunia kerja dengan keterampilan yang mumpuni.\n\nDari 12 lulusan, 8 orang telah mendapatkan penawaran kerja dari perusahaan tempat mereka magang, sementara 4 orang lainnya sedang dalam proses rekrutmen di perusahaan mitra lain.\n\nTerima kasih kepada seluruh donatur yang telah mendukung perjalanan mereka!',
          }),
        ),
        NewsCard(
          title: 'Kerja Sama Baru dengan PT Maju Jaya',
          subtitle: 'Membuka 20 posisi magang untuk penerima beasiswa',
          date: '5 Mar 2026',
          onTap: () => context.push('/news-detail', extra: {
            'title': 'Kerja Sama Baru dengan PT Maju Jaya',
            'description': 'Membuka 20 posisi magang untuk penerima beasiswa',
            'date': '5 Mar 2026',
            'category': 'Kemitraan',
            'content':
                'VIP dengan bangga mengumumkan kerja sama baru dengan PT Maju Jaya, salah satu perusahaan terkemuka di bidang hospitality.\n\nKerja sama ini membuka 20 posisi magang baru di berbagai divisi untuk para penerima beasiswa VIP. Posisi yang tersedia meliputi barista, digital marketing, administrasi perkantoran, dan customer service.\n\nPT Maju Jaya berkomitmen untuk memberikan pengalaman magang yang bermakna dan peluang karir jangka panjang bagi peserta yang berprestasi.',
          }),
        ),
      ],
    );
  }
}
