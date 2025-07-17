import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  final double width;
  final double height;
  const HomeHeader({super.key, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.04, // 4% da largura da tela
        vertical: height * 0.04, // 4% da altura da tela
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Wallet Cards',
            style: Theme.of(
              context,
            ).textTheme.headlineMedium?.copyWith(color: Colors.white),
          ),
          CircleAvatar(
            radius: height * 0.02,
            backgroundColor: Colors.white,
            child: Image.asset("assets/user.png", height: height * 0.05),
          ),
        ],
      ),
    );
  }
}
