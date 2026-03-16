import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/content/app_content.dart';
/// Halaman detail berita/update yayasan.
class NewsDetailPage extends StatelessWidget {
  final String title;
  final String description;
  final String date;
  final String category;
  final String? content;
  final String? imageUrl;

  const NewsDetailPage({
    super.key,
    required this.title,
    required this.description,
    required this.date,
    required this.category,
    this.content,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Collapsing header with image
          SliverAppBar(
            expandedHeight: 240,
            pinned: true,
            backgroundColor: AppColors.cardGray,
            leading: Padding(
              padding: const EdgeInsets.all(8),
              child: GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.4),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: GestureDetector(
                  onTap: () {
                    // TODO: Share functionality
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.4),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.share_outlined,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                ),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  // Image
                  imageUrl != null
                      ? Image.network(
                          imageUrl!,
                          fit: BoxFit.cover,
                          errorBuilder: (_, _, _) => _buildPlaceholderImage(),
                        )
                      : _buildPlaceholderImage(),
                  // Gradient overlay
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withValues(alpha: 0.7),
                        ],
                      ),
                    ),
                  ),
                  // Category + Date at bottom
                  Positioned(
                    left: AppDimensions.spacingM,
                    bottom: AppDimensions.spacingM,
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppDimensions.spacingS,
                            vertical: AppDimensions.spacingXS,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius:
                                BorderRadius.circular(AppDimensions.radiusS),
                          ),
                          child: Text(
                            category,
                            style: const TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(width: AppDimensions.spacingS),
                        Text(
                          date,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Content
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(AppDimensions.spacingL),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                      height: 1.3,
                    ),
                  ),
                  const SizedBox(height: AppDimensions.spacingM),
                  // Author / meta
                  Row(
                    children: [
                      Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          color: AppColors.primary.withValues(alpha: 0.1),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.account_circle,
                          color: AppColors.primary,
                          size: 32,
                        ),
                      ),
                      const SizedBox(width: AppDimensions.spacingS),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppContent.orgName,
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          Text(
                            date,
                            style: const TextStyle(
                              fontSize: 11,
                              color: AppColors.textHint,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: AppDimensions.spacingL),
                  const Divider(),
                  const SizedBox(height: AppDimensions.spacingL),
                  // Body content
                  Text(
                    content ?? description,
                    style: const TextStyle(
                      fontSize: 15,
                      color: AppColors.textPrimary,
                      height: 1.8,
                    ),
                  ),
                  const SizedBox(height: AppDimensions.spacingXXL),
                  // Share button
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.share_outlined),
                      label: Text(AppContent.bagikan),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: AppColors.primary,
                        side: const BorderSide(color: AppColors.primary),
                        padding: const EdgeInsets.symmetric(
                          vertical: AppDimensions.spacingM,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: AppDimensions.spacingXL),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlaceholderImage() {
    return Container(
      color: AppColors.cardGray,
      child: const Center(
        child: Icon(
          Icons.article_outlined,
          color: Colors.white30,
          size: 64,
        ),
      ),
    );
  }
}
