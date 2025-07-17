import 'package:flutter/material.dart';
import 'package:mccounting_text/mccounting_text.dart';
import 'package:wallet/models/credit_card.dart';

class Balance extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height * 0.16,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.02,
          vertical: height * 0.02,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Balance',
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(color: Colors.white70),
            ),
            SizedBox(height: height * 0.01),
            Row(
              children: [
                Text(
                  '\$',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                McCountingText(
                  begin: cards[previousCardIndex].amount,
                  end: cards[currentCardIndex].amount,
                  duration: const Duration(milliseconds: 500),
                  precision: 2,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
