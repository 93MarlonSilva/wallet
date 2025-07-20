import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:wallet/constants.dart';
import 'package:wallet/pages/home/home_page.dart';
import 'package:wallet/pages/transactions/transactions_page.dart';
import 'package:wallet/pages/profile/profile_page.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;
  final _iconList = [
    Icons.home,
    Icons.receipt_long,
    Icons.person,
  ];

  final _pageList = [
    const HomePage(),
    const TransactionsPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pageList,
      ),
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: _iconList,
        activeIndex: _currentIndex,
        gapLocation: GapLocation.none,
        notchSmoothness: NotchSmoothness.softEdge,
        leftCornerRadius: 0,
        rightCornerRadius: 0,
        backgroundGradient: LinearGradient(colors: [AppColors.primary.withAlpha(800), AppColors.surface]),
        onTap: (index) => setState(() => _currentIndex = index),
        activeColor: const Color.fromARGB(255, 0, 247, 255),
        inactiveColor:const Color.fromARGB(255, 6, 115, 119),
        backgroundColor: AppColors.surface,
        elevation: 8,
        splashColor: AppColors.primary.withOpacity(0.1),
        splashSpeedInMilliseconds: 300,
        notchAndCornersAnimation: animationSpecs,
        iconSize: 24,
        height: 60,
        gapWidth: 0,
        splashRadius: 24,
      ),
    );
  }

  Animation<double> get animationSpecs => Tween<double>(
    begin: 0,
    end: 1,
  ).animate(CurvedAnimation(
    parent: const AlwaysStoppedAnimation(1),
    curve: Curves.elasticOut,
    reverseCurve: Curves.elasticIn,
  ));
} 