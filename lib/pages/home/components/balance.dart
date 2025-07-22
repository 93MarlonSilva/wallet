import 'package:flutter/material.dart';
import 'package:mccounting_text/mccounting_text.dart';
import 'package:wallet/constants.dart';
import 'package:wallet/models/credit_card.dart';

class Balance extends StatefulWidget {
  final CreditCard card;
  final int previousCardIndex;
  final int currentCardIndex;
  final double height;
  final double width;
  const Balance({
    super.key,
    required this.previousCardIndex,
    required this.currentCardIndex,
    required this.card,
    required this.height,
    required this.width,
  });

  @override
  State<Balance> createState() => _BalanceState();
}

class _BalanceState extends State<Balance> {
  int _lastAnimatedIndex = 0;
  double _currentAmount = 0.0;
  double _previousAmount = 0.0;

  @override
  void initState() {
    super.initState();
    _currentAmount = widget.card.amount;
    _previousAmount = widget.card.amount;
    _lastAnimatedIndex = widget.currentCardIndex;
  }

  @override
  void didUpdateWidget(Balance oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.currentCardIndex != _lastAnimatedIndex) {
      _previousAmount = _currentAmount;
      _currentAmount = widget.card.amount;
      _lastAnimatedIndex = widget.currentCardIndex;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: AppSizes.paddingLarge,
        vertical: AppSizes.paddingMedium,
      ),
      padding: const EdgeInsets.all(AppSizes.paddingLarge),
      decoration: BoxDecoration(
        gradient: AppGradients.cardGradient,
        borderRadius: BorderRadius.circular(AppSizes.radiusXLarge),
        border: Border.all(
          color: AppColors.textTertiary.withOpacity(0.1),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(AppSizes.paddingSmall),
                decoration: BoxDecoration(
                  color: AppColors.blue.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(AppSizes.radiusMedium),
                ),
                child: const Icon(
                  Icons.account_balance_wallet,
                  color: AppColors.blue,
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              const Text(
                'Balance',
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),

          const SizedBox(height: AppSizes.paddingMedium),
          Center(
            child: McCountingText(
              begin: _previousAmount,
              end: _currentAmount,
              duration: const Duration(milliseconds: 800),
              precision: 2,
              style: const TextStyle(
                color: AppColors.blue,
                fontSize: 32,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.italic,
                letterSpacing: 2.5,
              ),
            ),
          ),

          const SizedBox(height: 8),

          Row(
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 0, 255, 64),
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              const Text(
                'Available balance',
                style: TextStyle(
                  color: AppColors.textTertiary,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
