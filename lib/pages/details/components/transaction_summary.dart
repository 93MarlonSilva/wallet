import 'package:flutter/material.dart';
import 'package:wallet/models/transaction.dart';

class TransactionSummary extends StatelessWidget {
  final Transaction transaction;
  final double height;
  final double width;
  const TransactionSummary({
    super.key,
    required this.transaction,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    final bool isIncome = transaction.value >= 0;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.04, vertical: height * 0.012),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.04),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 8,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.04, vertical: height * 0.018),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: width * 0.11,
                height: width * 0.11,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [transaction.color[400]!, transaction.color[700]!],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(
                    transaction.icon,
                    color: Colors.white,
                    size: width * 0.055,
                  ),
                ),
              ),
              SizedBox(width: width * 0.045),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      transaction.title,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Text(
                          transaction.category,
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Colors.white54,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(width: width * 0.02),
              Text(
                (isIncome ? '+ ' : '- ') + transaction.value.abs().toStringAsFixed(2),
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: isIncome ? Colors.greenAccent : Colors.redAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
