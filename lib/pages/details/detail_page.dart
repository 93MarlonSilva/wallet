import 'package:flutter/material.dart';
import 'package:simple_animations/animation_builder/play_animation_builder.dart';
import 'package:wallet/constants.dart';
import 'package:wallet/models/credit_card.dart';
import 'package:wallet/models/transaction.dart';
import 'package:wallet/pages/details/components/detail_card.dart';
import 'package:wallet/pages/details/components/detail_header.dart';
import 'package:wallet/pages/details/components/transaction_summary.dart';

class DetailPage extends StatefulWidget {
  final CreditCard card;
  final double height;
  final double width;
  final VoidCallback? onBack;
  const DetailPage({
    super.key,
    required this.card,
    required this.height,
    required this.width,
    this.onBack,
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  double sheetProgress = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
      decoration: BoxDecoration(
        gradient: AppGradients.backgroundGradient,
      ),
        child: Column(
          children: [
            PlayAnimationBuilder(
              tween: Tween(begin: widget.height * 2, end: 0.0),
              curve: Curves.easeOut,
              duration: Duration(milliseconds: 200),
              builder: (context, value, child) =>
                  Transform.translate(offset: Offset(0, value), child: child),
              child: DetailHeader(
                height: widget.height,
                width: widget.width,
              ),
            ),
            const SizedBox(height: 24), // em vez de 60
            PlayAnimationBuilder(
              tween: Tween(begin: 0.2, end: 1.0),
              curve: Curves.easeOut,
              duration: Duration(milliseconds: 200),
              builder: (context, value, child) => Transform.scale(
                scale: value,
                alignment: Alignment.center,
                child: child,
              ),
              child: DetailCard(
                sheetProgress: sheetProgress,
                card: widget.card,
                height: widget.height,
                width: widget.width,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Transactions',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.only(top: 8, bottom: 24), // adicione top
                itemCount: transactions.length,
                itemBuilder: (context, index) {
                  return TransactionSummary(
                    transaction: transactions[index],
                    height: widget.height,
                    width: widget.width,
                  );
                },
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
