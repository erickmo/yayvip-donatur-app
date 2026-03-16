import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/content/app_content.dart';

/// Halaman laporan keuangan yayasan.
/// Menampilkan ringkasan dana, grafik sederhana, dan detail alokasi.
class LaporanPage extends StatelessWidget {
  const LaporanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppContent.laporanPageTitle,
          style: const TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppDimensions.spacingM),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSaldoCard(),
            const SizedBox(height: AppDimensions.spacingL),
            _buildPeriodFilter(),
            const SizedBox(height: AppDimensions.spacingL),
            _buildAlokasiSection(),
            const SizedBox(height: AppDimensions.spacingL),
            _buildTransaksiTerakhir(),
          ],
        ),
      ),
    );
  }

  Widget _buildSaldoCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppDimensions.spacingL),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.primary, AppColors.primaryDark],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(AppDimensions.radiusL),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.3),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppContent.statDanaTerkumpul,
            style: const TextStyle(fontSize: 13, color: Colors.white70),
          ),
          const SizedBox(height: AppDimensions.spacingS),
          const Text(
            'Rp 150.000.000',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: AppDimensions.spacingM),
          const Row(
            children: [
              _MiniStat(label: 'Pemasukan', value: 'Rp 165 Jt'),
              SizedBox(width: AppDimensions.spacingL),
              _MiniStat(label: 'Pengeluaran', value: 'Rp 15 Jt'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPeriodFilter() {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _FilterChip(label: 'Semua', isSelected: true),
          SizedBox(width: AppDimensions.spacingS),
          _FilterChip(label: 'Bulan Ini', isSelected: false),
          SizedBox(width: AppDimensions.spacingS),
          _FilterChip(label: '3 Bulan', isSelected: false),
          SizedBox(width: AppDimensions.spacingS),
          _FilterChip(label: '6 Bulan', isSelected: false),
          SizedBox(width: AppDimensions.spacingS),
          _FilterChip(label: '1 Tahun', isSelected: false),
        ],
      ),
    );
  }

  Widget _buildAlokasiSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Alokasi Dana',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: AppDimensions.spacingM),
        _buildAlokasiItem(
          label: 'Beasiswa Pelatihan',
          amount: 'Rp 80.000.000',
          percentage: 0.53,
          color: AppColors.primary,
        ),
        const SizedBox(height: AppDimensions.spacingM),
        _buildAlokasiItem(
          label: 'Magang Industri',
          amount: 'Rp 35.000.000',
          percentage: 0.23,
          color: AppColors.info,
        ),
        const SizedBox(height: AppDimensions.spacingM),
        _buildAlokasiItem(
          label: 'Penyaluran Kerja',
          amount: 'Rp 20.000.000',
          percentage: 0.13,
          color: AppColors.success,
        ),
        const SizedBox(height: AppDimensions.spacingM),
        _buildAlokasiItem(
          label: 'Operasional',
          amount: 'Rp 15.000.000',
          percentage: 0.10,
          color: AppColors.warning,
        ),
      ],
    );
  }

  Widget _buildAlokasiItem({
    required String label,
    required String amount,
    required double percentage,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(AppDimensions.spacingM),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppDimensions.radiusM),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      color: color,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: AppDimensions.spacingS),
                  Text(
                    label,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ],
              ),
              Text(
                amount,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppDimensions.spacingS),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: percentage,
              backgroundColor: AppColors.divider,
              color: color,
              minHeight: 6,
            ),
          ),
          const SizedBox(height: AppDimensions.spacingXS),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              '${(percentage * 100).toStringAsFixed(0)}%',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: color,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTransaksiTerakhir() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Transaksi Terakhir',
              style: TextStyle(
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
        ..._dummyTransaksi.map(
          (t) => _TransaksiItem(
            title: t['title']!,
            date: t['date']!,
            amount: t['amount']!,
            isIncome: t['type'] == 'income',
          ),
        ),
      ],
    );
  }
}

class _MiniStat extends StatelessWidget {
  final String label;
  final String value;

  const _MiniStat({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 11, color: Colors.white60),
        ),
        const SizedBox(height: 2),
        Text(
          value,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String label;
  final bool isSelected;

  const _FilterChip({required this.label, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.spacingM,
        vertical: AppDimensions.spacingS,
      ),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primary : Colors.white,
        borderRadius: BorderRadius.circular(AppDimensions.radiusXL),
        border: Border.all(
          color: isSelected ? AppColors.primary : AppColors.divider,
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w500,
          color: isSelected ? Colors.white : AppColors.textSecondary,
        ),
      ),
    );
  }
}

class _TransaksiItem extends StatelessWidget {
  final String title;
  final String date;
  final String amount;
  final bool isIncome;

  const _TransaksiItem({
    required this.title,
    required this.date,
    required this.amount,
    required this.isIncome,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppDimensions.spacingS),
      padding: const EdgeInsets.all(AppDimensions.spacingM),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppDimensions.radiusM),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(AppDimensions.spacingS),
            decoration: BoxDecoration(
              color: (isIncome ? AppColors.success : AppColors.primary)
                  .withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(AppDimensions.radiusM),
            ),
            child: Icon(
              isIncome ? Icons.arrow_downward : Icons.arrow_upward,
              color: isIncome ? AppColors.success : AppColors.primary,
              size: 20,
            ),
          ),
          const SizedBox(width: AppDimensions.spacingM),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textPrimary,
                  ),
                ),
                Text(
                  date,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.textHint,
                  ),
                ),
              ],
            ),
          ),
          Text(
            '${isIncome ? '+' : '-'} $amount',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: isIncome ? AppColors.success : AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}

const _dummyTransaksi = [
  {
    'title': 'Donasi dari Budi Santoso',
    'date': '15 Mar 2026',
    'amount': 'Rp 500.000',
    'type': 'income',
  },
  {
    'title': 'Biaya Pelatihan Batch 3',
    'date': '14 Mar 2026',
    'amount': 'Rp 5.000.000',
    'type': 'expense',
  },
  {
    'title': 'Donasi dari PT Maju Jaya',
    'date': '13 Mar 2026',
    'amount': 'Rp 10.000.000',
    'type': 'income',
  },
  {
    'title': 'Donasi dari Siti Rahayu',
    'date': '12 Mar 2026',
    'amount': 'Rp 250.000',
    'type': 'income',
  },
  {
    'title': 'Biaya Operasional Maret',
    'date': '10 Mar 2026',
    'amount': 'Rp 2.000.000',
    'type': 'expense',
  },
];
