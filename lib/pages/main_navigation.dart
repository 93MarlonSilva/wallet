import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:wallet/constants.dart';
import 'package:wallet/pages/home/home_page.dart';
import 'package:wallet/pages/statistics/statistics_page.dart';
import 'package:wallet/pages/profile/profile_page.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;

  final _pageList = [
    const HomePage(),
    const StatisticsPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _pageList),
      backgroundColor: AppColors.surfaceVariant,
      bottomNavigationBar: CurvedNavigationBar(
        height: 75,
        animationCurve: Curves.easeInOut,
        backgroundColor: AppColors.background,
        buttonBackgroundColor: AppColors.surfaceVariant,
        color: AppColors.surfaceVariant,
        animationDuration: const Duration(milliseconds: 350),
        onTap: (selectedIndex) {
          setState(() {
            _currentIndex = selectedIndex;
          });
        },
        index: _currentIndex,
        items: const [
          Icon(Icons.wallet, size: 20, color: AppColors.blue),
          Icon(Icons.bar_chart, size: 20, color: AppColors.blue),
          Icon(Icons.person, size: 20, color: AppColors.blue),
        ],
      ),
    );
  }

  Widget getSelectedWidget({required int index}) {
    switch (index) {
      case 0:
        return const HomePage();
      case 1:
        return const StatisticsPage();
      case 2:
        return const ProfilePage();
      default:
        return const HomePage();
    }
  }
}
