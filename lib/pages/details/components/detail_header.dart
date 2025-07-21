import 'package:flutter/material.dart';
import 'package:wallet/constants.dart';
import 'package:wallet/pages/home/home_page.dart';

class DetailHeader extends StatefulWidget {
  final double width;
  final double height;
  const DetailHeader({super.key, required this.width, required this.height});

  @override
  State<DetailHeader> createState() => _DetailHeaderState();
}

class _DetailHeaderState extends State<DetailHeader> {
 
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: AppSizes.paddingLarge, right: AppSizes.paddingLarge, top: AppSizes.paddingMedium + 60),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => HomePage()),
                ),
                child: Container(
                  padding: const EdgeInsets.all(AppSizes.paddingSmall),
                  decoration: BoxDecoration(
                    color: AppColors.textTertiary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(AppSizes.radiusMedium),
                  ),
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: AppColors.textPrimary,
                    size: 20,
                  ),
                ),
              ),
              
              const Text(
                'Card Info',
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(AppSizes.paddingSmall),
                decoration: BoxDecoration(
                  color: AppColors.textTertiary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(AppSizes.radiusMedium),
                ),
                child: const Icon(
                  Icons.more_vert,
                  color: AppColors.textPrimary,
                  size: 20,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSizes.paddingLarge),
        ],
      ),
    );
  }
}
