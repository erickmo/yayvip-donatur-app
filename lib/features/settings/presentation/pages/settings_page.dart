import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/content/app_content.dart';
import '../../../../core/widgets/vip_header.dart';

/// Halaman pengaturan aplikasi.
class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _notifEnabled = true;
  bool _biometrikEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VipHeader(
        title: AppContent.settingsPageTitle,
        showBackButton: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppDimensions.spacingM),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Umum'),
            _buildCard([
              _buildSwitchTile(
                icon: Icons.notifications_outlined,
                title: AppContent.notifikasi,
                subtitle: AppContent.notifikasiDesc,
                value: _notifEnabled,
                onChanged: (v) => setState(() => _notifEnabled = v),
              ),
              _buildDivider(),
              _buildValueTile(
                icon: Icons.language,
                title: AppContent.bahasa,
                value: AppContent.bahasaValue,
                onTap: () {},
              ),
              _buildDivider(),
              _buildValueTile(
                icon: Icons.palette_outlined,
                title: AppContent.tema,
                value: AppContent.temaValue,
                onTap: () {},
              ),
            ]),
            const SizedBox(height: AppDimensions.spacingL),
            _buildSectionTitle(AppContent.keamanan),
            _buildCard([
              _buildNavTile(
                icon: Icons.lock_outlined,
                title: AppContent.ubahPassword,
                onTap: () {},
              ),
              _buildDivider(),
              _buildSwitchTile(
                icon: Icons.fingerprint,
                title: AppContent.biometrik,
                subtitle: AppContent.biometrikDesc,
                value: _biometrikEnabled,
                onChanged: (v) => setState(() => _biometrikEnabled = v),
              ),
            ]),
            const SizedBox(height: AppDimensions.spacingL),
            _buildSectionTitle('Lainnya'),
            _buildCard([
              _buildNavTile(
                icon: Icons.cached,
                title: AppContent.hapusCache,
                subtitle: AppContent.hapusCacheDesc,
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('Cache berhasil dihapus'),
                      backgroundColor: AppColors.success,
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(AppDimensions.radiusM),
                      ),
                    ),
                  );
                },
              ),
              _buildDivider(),
              _buildValueTile(
                icon: Icons.info_outline,
                title: AppContent.versiApp,
                value: AppContent.get('app.version'),
                onTap: () {},
              ),
            ]),
            const SizedBox(height: AppDimensions.spacingXL),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(
        left: AppDimensions.spacingXS,
        bottom: AppDimensions.spacingS,
      ),
      child: Text(
        title.toUpperCase(),
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: AppColors.textHint,
          letterSpacing: 1,
        ),
      ),
    );
  }

  Widget _buildCard(List<Widget> children) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppDimensions.radiusL),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(children: children),
    );
  }

  Widget _buildSwitchTile({
    required IconData icon,
    required String title,
    String? subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.spacingM,
        vertical: AppDimensions.spacingXS,
      ),
      leading: _buildIconBox(icon),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
          color: AppColors.textPrimary,
        ),
      ),
      subtitle: subtitle != null
          ? Text(
              subtitle,
              style: const TextStyle(fontSize: 12, color: AppColors.textHint),
            )
          : null,
      trailing: Switch.adaptive(
        value: value,
        onChanged: onChanged,
        activeTrackColor: AppColors.primary,
      ),
    );
  }

  Widget _buildValueTile({
    required IconData icon,
    required String title,
    required String value,
    required VoidCallback onTap,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.spacingM,
        vertical: AppDimensions.spacingXS,
      ),
      leading: _buildIconBox(icon),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
          color: AppColors.textPrimary,
        ),
      ),
      trailing: Text(
        value,
        style: const TextStyle(fontSize: 13, color: AppColors.textHint),
      ),
      onTap: onTap,
    );
  }

  Widget _buildNavTile({
    required IconData icon,
    required String title,
    String? subtitle,
    required VoidCallback onTap,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.spacingM,
        vertical: AppDimensions.spacingXS,
      ),
      leading: _buildIconBox(icon),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
          color: AppColors.textPrimary,
        ),
      ),
      subtitle: subtitle != null
          ? Text(
              subtitle,
              style: const TextStyle(fontSize: 12, color: AppColors.textHint),
            )
          : null,
      trailing: const Icon(
        Icons.chevron_right,
        color: AppColors.textHint,
      ),
      onTap: onTap,
    );
  }

  Widget _buildIconBox(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(AppDimensions.spacingS),
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(AppDimensions.radiusM),
      ),
      child: Icon(icon, color: AppColors.primary, size: 20),
    );
  }

  Widget _buildDivider() {
    return const Divider(height: 1, indent: 64);
  }
}
