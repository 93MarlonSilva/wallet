import 'package:flutter/material.dart';
import 'package:wallet/models/credit_card.dart';

class BackCard extends StatelessWidget {
  final CreditCard card;
  final double height;
  final double width;
  const BackCard({
    super.key,
    required this.card,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 5 / 3,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: card.colors[1],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              margin: EdgeInsets.only(top: height * 0.02, right: width * 0.02),
              height: height * 0.02,
              width: width * 0.02,
              color: Colors.white,
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  card.securityCode,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: height * 0.02,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.only(right: width * 0.02),
              child: Text(
                'Services Hotline / 028-6577',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.white,
                  fontSize: height * 0.02,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
