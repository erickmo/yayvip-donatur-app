import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/content/app_content.dart';

/// Halaman riwayat donasi milik user.
class RiwayatDonasiPage extends StatelessWidget {
  const RiwayatDonasiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppContent.riwayatDonasi,
          style: const TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(AppDimensions.spacingM),
        itemCount: _dummyRiwayat.length,
        itemBuilder: (context, index) {
          final item = _dummyRiwayat[index];
          return _RiwayatItem(
            amount: item['amount']!,
            date: item['date']!,
            method: item['method']!,
            status: item['status']!,
          );
        },
      ),
    );
  }
}

class _RiwayatItem extends StatelessWidget {
  final String amount;
  final String date;
  final String method;
  final String status;

  const _RiwayatItem({
    required this.amount,
    required this.date,
    required this.method,
    required this.status,
  });

  Color get _statusColor {
    switch (status) {
      case 'Berhasil':
        return AppColors.success;
      case 'Pending':
        return AppColors.warning;
      case 'Gagal':
        return AppColors.error;
      default:
        return AppColors.textHint;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppDimensions.spacingM),
      padding: const EdgeInsets.all(AppDimensions.spacingM),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppDimensions.radiusL),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Icon
          Container(
            padding: const EdgeInsets.all(AppDimensions.spacingM),
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(AppDimensions.radiusM),
            ),
            child: const Icon(
              Icons.favorite,
              color: AppColors.primary,
              size: 24,
            ),
          ),
          const SizedBox(width: AppDimensions.spacingM),
          // Detail
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  amount,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  method,
                  style: const TextStyle(
                    fontSize: 13,
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: 2),
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
          // Status badge
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimensions.spacingS,
              vertical: AppDimensions.spacingXS,
            ),
            decoration: BoxDecoration(
              color: _statusColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(AppDimensions.radiusS),
            ),
            child: Text(
              status,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: _statusColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

const _dummyRiwayat = [
  {
    'amount': 'Rp 500.000',
    'date': '15 Mar 2026 • 14:30',
    'method': 'QR Code',
    'status': 'Berhasil',
  },
  {
    'amount': 'Rp 250.000',
    'date': '10 Mar 2026 • 09:15',
    'method': 'Transfer Bank',
    'status': 'Berhasil',
  },
  {
    'amount': 'Rp 100.000',
    'date': '28 Feb 2026 • 20:00',
    'method': 'QR Code',
    'status': 'Berhasil',
  },
  {
    'amount': 'Rp 1.000.000',
    'date': '14 Feb 2026 • 11:45',
    'method': 'Transfer Bank',
    'status': 'Berhasil',
  },
  {
    'amount': 'Rp 50.000',
    'date': '1 Feb 2026 • 16:20',
    'method': 'QR Code',
    'status': 'Berhasil',
  },
  {
    'amount': 'Rp 200.000',
    'date': '20 Jan 2026 • 08:00',
    'method': 'Transfer Bank',
    'status': 'Berhasil',
  },
];
