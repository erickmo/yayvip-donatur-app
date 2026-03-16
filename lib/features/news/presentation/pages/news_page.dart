import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/content/app_content.dart';
import '../../../../core/widgets/vip_header.dart';

/// Halaman daftar update/berita terbaru dari yayasan.
class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VipHeader(
        title: AppContent.newsPageTitle,
        subtitle: AppContent.orgName,
        actions: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(AppDimensions.radiusM),
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
              color: AppColors.textSecondary,
            ),
          ),
        ],
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
            content: news['content'],
            onTap: () {
              context.push('/news-detail', extra: news);
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
  final String? content;
  final VoidCallback? onTap;

  const _NewsListItem({
    required this.title,
    required this.description,
    required this.date,
    required this.category,
    this.content,
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
                  Row(
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
                      const Spacer(),
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
                    ],
                  ),
                  const SizedBox(height: AppDimensions.spacingM),
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
                      Text(
                        AppContent.bacaSelengkapnya,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primary,
                        ),
                      ),
                      const SizedBox(width: 4),
                      const Icon(
                        Icons.arrow_forward,
                        size: 14,
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
        '15 anak penerima beasiswa VIP memulai pelatihan intensif barista di Vernon Edu.',
    'date': '15 Mar 2026',
    'category': 'Pelatihan',
    'content':
        'Sebanyak 15 anak penerima beasiswa VIP batch 3 resmi memulai pelatihan intensif barista di Vernon Edu. Program pelatihan ini dirancang selama 10 bulan agar peserta siap kerja di industri F&B.\n\nPara peserta akan mendapatkan pelatihan hands-on mulai dari dasar-dasar pembuatan kopi, latte art, hingga manajemen kedai kopi. Selain keterampilan teknis, mereka juga akan dibekali soft skill seperti komunikasi, teamwork, dan customer service.\n\nProgram ini merupakan bagian dari komitmen Yayasan Vernon Indonesia Pintar dalam menyediakan jalur karir yang konkret bagi anak-anak berprestasi dari keluarga kurang mampu.\n\n"Kami percaya bahwa setiap anak berhak mendapatkan kesempatan untuk berkembang dan meraih masa depan yang lebih baik," ujar Agil Mahendra, Ketua Yayasan VIP.',
  },
  {
    'title': 'Wisuda Batch 2 — 12 Anak Siap Kerja',
    'description':
        'Selamat kepada 12 penerima beasiswa batch 2 yang telah menyelesaikan program.',
    'date': '10 Mar 2026',
    'category': 'Kelulusan',
    'content':
        'Selamat kepada 12 penerima beasiswa batch 2 yang telah menyelesaikan seluruh rangkaian program VIP!\n\nMereka telah menjalani 10 bulan pelatihan intensif di Vernon Edu dan 4 bulan magang di perusahaan mitra. Kini mereka siap memasuki dunia kerja dengan keterampilan yang mumpuni.\n\nDari 12 lulusan, 8 orang telah mendapatkan penawaran kerja dari perusahaan tempat mereka magang, sementara 4 orang lainnya sedang dalam proses rekrutmen di perusahaan mitra lain.\n\nTerima kasih kepada seluruh donatur yang telah mendukung perjalanan mereka!',
  },
  {
    'title': 'Kerja Sama Baru dengan PT Maju Jaya',
    'description':
        'VIP menjalin kerja sama untuk membuka 20 posisi magang bagi penerima beasiswa.',
    'date': '5 Mar 2026',
    'category': 'Kemitraan',
    'content':
        'VIP dengan bangga mengumumkan kerja sama baru dengan PT Maju Jaya, salah satu perusahaan terkemuka di bidang hospitality.\n\nKerja sama ini membuka 20 posisi magang baru di berbagai divisi untuk para penerima beasiswa VIP. Posisi yang tersedia meliputi barista, digital marketing, administrasi perkantoran, dan customer service.\n\nPT Maju Jaya berkomitmen untuk memberikan pengalaman magang yang bermakna dan peluang karir jangka panjang bagi peserta yang berprestasi.',
  },
  {
    'title': 'Cerita Sukses: Dari Beasiswa ke Karir Digital Marketing',
    'description':
        'Budi, penerima beasiswa batch 1, kini bekerja sebagai Digital Marketing Specialist.',
    'date': '28 Feb 2026',
    'category': 'Testimoni',
    'content':
        'Budi Pratama (22), penerima beasiswa VIP batch 1, berbagi cerita inspiratifnya. Berasal dari keluarga sederhana di Malang, Budi nyaris putus sekolah sebelum mendapat beasiswa VIP.\n\nSetelah menjalani pelatihan digital marketing selama 10 bulan dan magang 4 bulan, Budi kini bekerja sebagai Digital Marketing Specialist di salah satu startup ternama dengan gaji kompetitif.\n\n"Tanpa VIP, saya mungkin masih bingung mau kerja apa. Sekarang saya bisa membantu keluarga dan punya karir yang jelas," ujar Budi.\n\nKisah Budi adalah bukti nyata bahwa donasi Anda membuat perbedaan!',
  },
  {
    'title': 'Dana Terkumpul Menembus Rp 150 Juta',
    'description':
        'Total dana donatur telah mencapai Rp 150 juta untuk mendukung pendidikan anak Indonesia.',
    'date': '20 Feb 2026',
    'category': 'Laporan',
    'content':
        'Terima kasih para donatur! Total dana yang terkumpul telah mencapai Rp 150 juta.\n\nAlokasi dana:\n- Rp 80 juta untuk beasiswa pelatihan di Vernon Edu\n- Rp 35 juta untuk program magang industri\n- Rp 20 juta untuk penyaluran dan pendampingan kerja\n- Rp 15 juta untuk operasional yayasan\n\nDengan dana ini, kami telah membantu 48 anak dari berbagai daerah di Indonesia dan 32 di antaranya sudah mendapatkan pekerjaan.\n\n100% dana donasi dialokasikan langsung untuk program. Transparansi adalah komitmen kami.',
  },
];
