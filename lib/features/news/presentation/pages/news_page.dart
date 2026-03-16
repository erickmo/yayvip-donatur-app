import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/content/app_content.dart';

/// Halaman daftar update/berita terbaru dari yayasan.
class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppContent.newsPageTitle,
          style: const TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(AppDimensions.spacingM),
        itemCount: _dummyNews.length,
        itemBuilder: (context, index) {
          final news = _dummyNews[index];
          return _NewsListItem(
            title: news['title']!,
            description: news['description']!,
            date: news['date']!,
            category: news['category']!,
            onTap: () {
              // TODO: Navigate to detail
            },
          );
        },
      ),
    );
  }
}

class _NewsListItem extends StatelessWidget {
  final String title;
  final String description;
  final String date;
  final String category;
  final VoidCallback? onTap;

  const _NewsListItem({
    required this.title,
    required this.description,
    required this.date,
    required this.category,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: AppDimensions.spacingM),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(AppDimensions.radiusL),
              ),
              child: Container(
                width: double.infinity,
                height: 160,
                color: AppColors.cardGray,
                child: const Center(
                  child: Icon(
                    Icons.image_outlined,
                    color: Colors.white54,
                    size: 48,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(AppDimensions.spacingM),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppDimensions.spacingS,
                      vertical: AppDimensions.spacingXS,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withValues(alpha: 0.1),
                      borderRadius:
                          BorderRadius.circular(AppDimensions.radiusS),
                    ),
                    child: Text(
                      category,
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                  const SizedBox(height: AppDimensions.spacingS),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: AppDimensions.spacingS),
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 13,
                      color: AppColors.textSecondary,
                      height: 1.4,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: AppDimensions.spacingM),
                  Row(
                    children: [
                      const Icon(
                        Icons.access_time,
                        size: 14,
                        color: AppColors.textHint,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        date,
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppColors.textHint,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        AppContent.lihatSemua,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primary,
                        ),
                      ),
                      const SizedBox(width: 4),
                      const Icon(
                        Icons.arrow_forward_ios,
                        size: 12,
                        color: AppColors.primary,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

const _dummyNews = [
  {
    'title': 'Batch 3 Pelatihan Barista Dimulai!',
    'description':
        '15 anak penerima beasiswa VIP memulai pelatihan intensif barista di Vernon Edu. Mereka akan menjalani program selama 10 bulan.',
    'date': '15 Mar 2026',
    'category': 'Pelatihan',
  },
  {
    'title': 'Wisuda Batch 2 — 12 Anak Siap Kerja',
    'description':
        'Selamat kepada 12 penerima beasiswa batch 2 yang telah menyelesaikan program magang industri dan siap memasuki dunia kerja.',
    'date': '10 Mar 2026',
    'category': 'Kelulusan',
  },
  {
    'title': 'Kerja Sama Baru dengan PT Maju Jaya',
    'description':
        'VIP menjalin kerja sama dengan PT Maju Jaya untuk membuka 20 posisi magang bagi penerima beasiswa.',
    'date': '5 Mar 2026',
    'category': 'Kemitraan',
  },
  {
    'title': 'Cerita Sukses: Dari Beasiswa ke Karir Digital Marketing',
    'description':
        'Budi, penerima beasiswa batch 1, kini bekerja sebagai Digital Marketing Specialist di perusahaan ternama.',
    'date': '28 Feb 2026',
    'category': 'Testimoni',
  },
  {
    'title': 'Dana Terkumpul Menembus Rp 150 Juta',
    'description':
        'Terima kasih para donatur! Total dana terkumpul telah mencapai Rp 150 juta untuk mendukung pendidikan anak Indonesia.',
    'date': '20 Feb 2026',
    'category': 'Laporan',
  },
];
