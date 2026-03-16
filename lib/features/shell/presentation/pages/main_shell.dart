import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/content/app_content.dart';
import '../../../home/presentation/pages/home_page.dart';
import '../../../news/presentation/pages/news_page.dart';
import '../../../donation/presentation/pages/donation_page.dart';
import '../../../laporan/presentation/pages/laporan_page.dart';
import '../../../profile/presentation/pages/profile_page.dart';

/// Shell utama dengan bottom navigation bar.
/// Tombol donasi di tengah berukuran besar dengan background merah.
class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _currentIndex = 0;

  final List<Widget> _pages = [];

  @override
  void initState() {
    super.initState();
    _pages.addAll([
      HomePage(onNavigateToDonation: () => _onTabSelected(2)),
      const NewsPage(),
      const DonationPage(),
      const LaporanPage(),
      const ProfilePage(),
    ]);
  }

  void _onTabSelected(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: _buildBottomNavBar(),
      extendBody: true,
    );
  }

  Widget _buildBottomNavBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 16,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        child: SizedBox(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(
                icon: Icons.home_outlined,
                activeIcon: Icons.home,
                label: AppContent.navHome,
                index: 0,
              ),
              _buildNavItem(
                icon: Icons.newspaper_outlined,
                activeIcon: Icons.newspaper,
                label: AppContent.navUpdate,
                index: 1,
              ),
              _buildCenterDonateButton(),
              _buildNavItem(
                icon: Icons.bar_chart_outlined,
                activeIcon: Icons.bar_chart,
                label: AppContent.navLaporan,
                index: 3,
              ),
              _buildNavItem(
                icon: Icons.person_outlined,
                activeIcon: Icons.person,
                label: AppContent.navProfile,
                index: 4,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required IconData activeIcon,
    required String label,
    required int index,
  }) {
    final isSelected = _currentIndex == index;
    return GestureDetector(
      onTap: () => _onTabSelected(index),
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        width: 60,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              isSelected ? activeIcon : icon,
              color: isSelected ? AppColors.primary : AppColors.textHint,
              size: 24,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 11,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                color: isSelected ? AppColors.primary : AppColors.textHint,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCenterDonateButton() {
    return GestureDetector(
      onTap: () => _onTabSelected(2),
      child: Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          color: AppColors.primary,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withValues(alpha: 0.4),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.favorite,
              color: Colors.white,
              size: 24,
            ),
            Text(
              AppContent.navDonasi,
              style: const TextStyle(
                fontSize: 9,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
