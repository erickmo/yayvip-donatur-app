import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimensions.dart';

/// Card statistik untuk menampilkan angka-angka penting.
class StatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color? backgroundColor;
  final Color? iconColor;

  const StatCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    this.backgroundColor,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppDimensions.spacingM),
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.white,
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
          Container(
            padding: const EdgeInsets.all(AppDimensions.spacingS),
            decoration: BoxDecoration(
              color: (iconColor ?? AppColors.primary).withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(AppDimensions.radiusM),
            ),
            child: Icon(
              icon,
              color: iconColor ?? AppColors.primary,
              size: AppDimensions.iconM,
            ),
          ),
          const SizedBox(height: AppDimensions.spacingM),
          Text(
            value,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: AppDimensions.spacingXS),
          Text(
            title,
            style: const TextStyle(
              fontSize: 12,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
