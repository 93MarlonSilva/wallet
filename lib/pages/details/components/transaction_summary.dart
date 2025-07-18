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
    return Column(
      children: [
        ListTile(
          leading: Container(
            width: width * 0.6,
            height: height * 0.6,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [transaction.color[400]!, transaction.color[700]!],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              shape: BoxShape.circle,
            ),
            child: Icon(
              transaction.icon,
              color: Colors.white,
              size: height * 0.04,
            ),
          ),
          title: Text(
            transaction.title,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.white70,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            transaction.category,
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(color: Colors.white70),
          ),
          trailing: Text(
            transaction.value.toStringAsFixed(2),
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.white70,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(
            width * 0.02,
            width * 0.1,
            0,
            height * 0.1,
          ),
          child: Divider(color: Colors.white24, height: 1),
        ),
      ],
    );
  }
}
