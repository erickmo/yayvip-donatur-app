import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimensions.dart';

/// Card untuk menampilkan item berita/update terbaru.
class NewsCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String date;
  final String? imageUrl;
  final VoidCallback? onTap;

  const NewsCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.date,
    this.imageUrl,
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
        child: Row(
          children: [
            // Thumbnail
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(AppDimensions.radiusL),
                bottomLeft: Radius.circular(AppDimensions.radiusL),
              ),
              child: Container(
                width: 100,
                height: 100,
                color: AppColors.divider,
                child: imageUrl != null
                    ? Image.network(
                        imageUrl!,
                        fit: BoxFit.cover,
                        errorBuilder: (_, _, _) => const Icon(
                          Icons.image_outlined,
                          color: AppColors.textHint,
                        ),
                      )
                    : const Icon(
                        Icons.article_outlined,
                        color: AppColors.textHint,
                        size: 32,
                      ),
              ),
            ),
            // Content
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(AppDimensions.spacingM),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: AppDimensions.spacingXS),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.textSecondary,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: AppDimensions.spacingS),
                    Text(
                      date,
                      style: const TextStyle(
                        fontSize: 11,
                        color: AppColors.textHint,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
