import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/content/app_content.dart';

/// Card ringkasan donasi user yang tampil di atas dashboard.
class DonationSummaryCard extends StatelessWidget {
  final String totalDonation;
  final VoidCallback? onDonatePressed;

  const DonationSummaryCard({
    super.key,
    required this.totalDonation,
    this.onDonatePressed,
  });

  @override
  Widget build(BuildContext context) {
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
            AppContent.totalDonasiLabel,
            style: const TextStyle(
              fontSize: 13,
              color: Colors.white70,
            ),
          ),
          const SizedBox(height: AppDimensions.spacingS),
          Text(
            totalDonation,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: AppDimensions.spacingM),
          SizedBox(
            height: 40,
            child: ElevatedButton(
              onPressed: onDonatePressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: AppColors.primary,
                minimumSize: Size.zero,
                padding: const EdgeInsets.symmetric(
                  horizontal: AppDimensions.spacingL,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppDimensions.radiusXL),
                ),
              ),
              child: Text(
                AppContent.donasiSekarang,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
