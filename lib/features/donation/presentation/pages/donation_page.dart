import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/content/app_content.dart';

/// Halaman donasi — pilih nominal, metode pembayaran, dan QR Code.
class DonationPage extends StatefulWidget {
  const DonationPage({super.key});

  @override
  State<DonationPage> createState() => _DonationPageState();
}

class _DonationPageState extends State<DonationPage> {
  int? _selectedNominal;
  final _nominalController = TextEditingController();
  final _qrScreenshotKey = GlobalKey();

  final List<int> _nominalOptions = [
    10000,
    25000,
    50000,
    100000,
    250000,
    500000,
  ];

  @override
  void dispose() {
    _nominalController.dispose();
    super.dispose();
  }

  String _formatCurrency(int amount) {
    final str = amount.toString();
    final buffer = StringBuffer();
    for (int i = 0; i < str.length; i++) {
      if (i > 0 && (str.length - i) % 3 == 0) {
        buffer.write('.');
      }
      buffer.write(str[i]);
    }
    return 'Rp ${buffer.toString()}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppContent.donationPageTitle,
          style: const TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppDimensions.spacingM),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInfoBanner(),
            const SizedBox(height: AppDimensions.spacingL),
            _buildNominalSection(),
            const SizedBox(height: AppDimensions.spacingL),
            _buildCustomNominalField(),
            const SizedBox(height: AppDimensions.spacingL),
            _buildPaymentMethodSection(),
            const SizedBox(height: AppDimensions.spacingXL),
            _buildDonateButton(),
            const SizedBox(height: AppDimensions.spacingL),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoBanner() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppDimensions.spacingM),
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(AppDimensions.radiusL),
        border: Border.all(
          color: AppColors.primary.withValues(alpha: 0.2),
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(AppDimensions.spacingS),
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.favorite,
              color: AppColors.primary,
              size: 24,
            ),
          ),
          const SizedBox(width: AppDimensions.spacingM),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppContent.donationInfoTitle,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  AppContent.donationInfoDesc,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.textSecondary,
                    height: 1.3,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNominalSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppContent.pilihNominal,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: AppDimensions.spacingM),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: AppDimensions.spacingM,
            mainAxisSpacing: AppDimensions.spacingM,
            childAspectRatio: 2.2,
          ),
          itemCount: _nominalOptions.length,
          itemBuilder: (context, index) {
            final nominal = _nominalOptions[index];
            final isSelected = _selectedNominal == nominal;
            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedNominal = nominal;
                  _nominalController.clear();
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.primary : Colors.white,
                  borderRadius: BorderRadius.circular(AppDimensions.radiusM),
                  border: Border.all(
                    color: isSelected ? AppColors.primary : AppColors.divider,
                    width: isSelected ? 2 : 1,
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  _formatCurrency(nominal),
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: isSelected ? Colors.white : AppColors.textPrimary,
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildCustomNominalField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppContent.nominalLain,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: AppDimensions.spacingS),
        TextField(
          controller: _nominalController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: AppContent.masukkanNominal,
            prefixText: 'Rp ',
            prefixStyle: const TextStyle(
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          onChanged: (_) {
            setState(() {
              _selectedNominal = null;
            });
          },
        ),
      ],
    );
  }

  Widget _buildPaymentMethodSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppContent.metodePembayaran,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: AppDimensions.spacingM),
        _PaymentMethodTile(
          icon: Icons.qr_code_2,
          title: AppContent.scanQR,
          subtitle: AppContent.scanQRSubtitle,
          isSelected: true,
          onTap: () {},
        ),
        const SizedBox(height: AppDimensions.spacingS),
        _PaymentMethodTile(
          icon: Icons.account_balance,
          title: AppContent.transferBank,
          subtitle: AppContent.transferBankSubtitle,
          isSelected: false,
          onTap: () {},
        ),
      ],
    );
  }

  Widget _buildDonateButton() {
    return ElevatedButton(
      onPressed: () {
        // TODO: Process donation
        _showDonationConfirmation();
      },
      child: Text(AppContent.konfirmasiDonasi),
    );
  }

  Future<void> _captureScreenshot() async {
    final boundary = _qrScreenshotKey.currentContext?.findRenderObject()
        as RenderRepaintBoundary?;
    if (boundary == null) return;

    final image = await boundary.toImage(pixelRatio: 3.0);
    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    if (byteData == null) return;

    // bytes siap untuk disimpan ke gallery atau di-share
    // ignore: unused_local_variable
    final bytes = byteData.buffer.asUint8List();

    // TODO: Save to gallery with image_gallery_saver or share with share_plus
    if (mounted) {
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppContent.screenshotBerhasil),
          backgroundColor: AppColors.success,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimensions.radiusM),
          ),
        ),
      );
    }
  }

  void _showDonationConfirmation() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppDimensions.radiusXL),
        ),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(AppDimensions.spacingL),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: AppColors.divider,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: AppDimensions.spacingL),
              RepaintBoundary(
                key: _qrScreenshotKey,
                child: Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(AppDimensions.spacingM),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: AppColors.divider),
                          borderRadius:
                              BorderRadius.circular(AppDimensions.radiusM),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.qr_code_2,
                            size: 150,
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ),
                      const SizedBox(height: AppDimensions.spacingM),
                      Text(
                        AppContent.qrTitle,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: AppDimensions.spacingS),
                      Text(
                        _selectedNominal != null
                            ? _formatCurrency(_selectedNominal!)
                            : 'Rp ${_nominalController.text}',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: AppColors.primary,
                        ),
                      ),
                      const SizedBox(height: AppDimensions.spacingS),
                      Text(
                        AppContent.orgName,
                        style: const TextStyle(
                          fontSize: 13,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: AppDimensions.spacingL),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: _captureScreenshot,
                  icon: const Icon(Icons.screenshot_outlined),
                  label: Text(AppContent.simpanScreenshot),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.primary,
                    side: const BorderSide(color: AppColors.primary),
                    padding: const EdgeInsets.symmetric(
                      vertical: AppDimensions.spacingM,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(AppDimensions.radiusM),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: AppDimensions.spacingM),
            ],
          ),
        );
      },
    );
  }
}

class _PaymentMethodTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final bool isSelected;
  final VoidCallback? onTap;

  const _PaymentMethodTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.isSelected,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(AppDimensions.spacingM),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppDimensions.radiusM),
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.divider,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(AppDimensions.spacingS),
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(AppDimensions.radiusM),
              ),
              child: Icon(icon, color: AppColors.primary),
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
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            if (isSelected)
              const Icon(Icons.check_circle, color: AppColors.primary),
          ],
        ),
      ),
    );
  }
}
