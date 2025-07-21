import 'package:flutter/material.dart';
import 'package:wallet/constants.dart';

class HomeHeader extends StatefulWidget {
  final double width;
  final double height;
  const HomeHeader({super.key, required this.width, required this.height});

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
 
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: AppSizes.paddingLarge, right: AppSizes.paddingLarge, top: AppSizes.paddingMedium + 60),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Container(
              //   padding: const EdgeInsets.all(AppSizes.paddingSmall),
              //   decoration: BoxDecoration(
              //     color: AppColors.textTertiary.withOpacity(0.1),
              //     borderRadius: BorderRadius.circular(AppSizes.radiusMedium),
              //   ),
              //   child: const Icon(
              //     Icons.arrow_back_ios,
              //     color: AppColors.textPrimary,
              //     size: 20,
              //   ),
              // ),
              
              const Text(
                'Wallet',
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              
              // Container(
              //   padding: const EdgeInsets.all(AppSizes.paddingSmall),
              //   decoration: BoxDecoration(
              //     color: AppColors.textTertiary.withOpacity(0.1),
              //     borderRadius: BorderRadius.circular(AppSizes.radiusMedium),
              //   ),
              //   child: const Icon(
              //     Icons.more_vert,
              //     color: AppColors.textPrimary,
              //     size: 20,
              //   ),
              // ),
            ],
          ),
          
          const SizedBox(height: AppSizes.paddingLarge),
        ],
      ),
    );
  }
}
