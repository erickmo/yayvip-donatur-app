import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_dimensions.dart';

/// Header modern yang reusable di seluruh screen.
/// Mendukung mode: greeting (home), title only, dan title + subtitle.
class VipHeader extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String? subtitle;
  final Widget? leading;
  final List<Widget>? actions;
  final bool showBackButton;
  final bool useGradient;

  const VipHeader({
    super.key,
    required this.title,
    this.subtitle,
    this.leading,
    this.actions,
    this.showBackButton = false,
    this.useGradient = false,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    if (useGradient) {
      return _buildGradientHeader(context);
    }
    return _buildCleanHeader(context);
  }

  Widget _buildCleanHeader(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      surfaceTintColor: Colors.transparent,
      automaticallyImplyLeading: showBackButton,
      leading: showBackButton
          ? IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: AppColors.divider.withValues(alpha: 0.5),
                  borderRadius: BorderRadius.circular(AppDimensions.radiusM),
                ),
                child: const Icon(
                  Icons.arrow_back_ios_new,
                  size: 16,
                  color: AppColors.textPrimary,
                ),
              ),
            )
          : leading,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
          if (subtitle != null)
            Text(
              subtitle!,
              style: const TextStyle(
                fontSize: 12,
                color: AppColors.textSecondary,
                fontWeight: FontWeight.w400,
              ),
            ),
        ],
      ),
      centerTitle: false,
      actions: actions,
    );
  }

  Widget _buildGradientHeader(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + AppDimensions.spacingM,
        left: AppDimensions.spacingM,
        right: AppDimensions.spacingM,
        bottom: AppDimensions.spacingM,
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.primary, AppColors.primaryDark],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Row(
        children: [
          if (showBackButton)
            GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Container(
                padding: const EdgeInsets.all(6),
                margin: const EdgeInsets.only(right: AppDimensions.spacingM),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(AppDimensions.radiusM),
                ),
                child: const Icon(
                  Icons.arrow_back_ios_new,
                  size: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ?leading,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                if (subtitle != null)
                  Text(
                    subtitle!,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.white70,
                    ),
                  ),
              ],
            ),
          ),
          if (actions != null) ...actions!,
        ],
      ),
    );
  }
}
