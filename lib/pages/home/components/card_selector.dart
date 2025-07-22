import 'package:flutter/material.dart';
import 'package:wallet/constants.dart';
import 'package:wallet/models/credit_card.dart';

class CardSelector extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onCardSelected;
  final List<CreditCard> cards;

  const CardSelector({
    super.key,
    required this.selectedIndex,
    required this.onCardSelected,
    required this.cards,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: const EdgeInsets.symmetric(
        horizontal: AppSizes.paddingLarge,
        vertical: AppSizes.paddingSmall,
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: cards.length,
        itemBuilder: (context, index) {
          final card = cards[index];
          final isSelected = index == selectedIndex;

          return GestureDetector(
            onTap: () => onCardSelected(index),
            child: Container(
              width: 80,
              margin: const EdgeInsets.only(right: AppSizes.paddingMedium),
              child: Column(
                children: [
                  // Card icon
                  Container(
                    width: 50,
                    height: 32,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: card.colors,
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(
                        AppSizes.radiusMedium,
                      ),
                      border: isSelected
                          ? Border.all(
                              color: const Color.fromARGB(255, 0, 238, 255),
                              width: 1.5,
                            )
                          : null,
                      boxShadow: isSelected
                          ? [
                              BoxShadow(
                                color: card.colors[0].withOpacity(0.4),
                                blurRadius: 12,
                                offset: const Offset(0, 4),
                              ),
                            ]
                          : null,
                    ),
                    child: Center(
                      child: Icon(
                        _getCardIcon(index),
                        color: AppColors.textPrimary,
                        size: 16,
                      ),
                    ),
                  ),

                  const SizedBox(height: 4),

                  // Card name
                  Text(
                    card.cardType,
                    style: TextStyle(
                      color: isSelected
                          ? AppColors.textPrimary
                          : AppColors.textTertiary,
                      fontSize: 8,
                      fontWeight: isSelected
                          ? FontWeight.w600
                          : FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  IconData _getCardIcon(int index) {
    switch (index) {
      case 0:
        return Icons.trending_up; // Credit card
      case 1:
        return Icons.account_balance; // Debit card
      case 2:
        return Icons.credit_card; // Credit card
      case 3:
        return Icons.account_balance_wallet; // Debit card
      default:
        return Icons.credit_card;
    }
  }
}
