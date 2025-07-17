import 'dart:math';

import 'package:flutter/material.dart';
import 'package:wallet/models/credit_card.dart';

class FrontCard extends StatelessWidget {
  final CreditCard card;
  final double width;
  final double height;
  const FrontCard({
    super.key,
    required this.card,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 5 / 3,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          gradient: LinearGradient(
            colors: [card.colors[0], card.colors[1]],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            stops: const [0, 0.8],
            tileMode: TileMode.clamp,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.04,
            vertical: height * 0.02,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Credit Card',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Transform.rotate(
                    angle: pi / 2,
                    child: Icon(
                      Icons.wifi,
                      color: Colors.white,
                      size: height * 0.04,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Image.asset('assets/card/chip.png', height: 120, width: 80),
                  Text(
                    card.number,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.white,
                      fontSize: 18,
                      letterSpacing: 2.0,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    card.cardHolder,
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium?.copyWith(color: Colors.white70),
                  ),
                  Image.asset(
                    card.brand == CardBrand.visa
                        ? 'assets/card/visa.png'
                        : 'assets/card/mastercard.png',
                    height: height * 0.03,
                    color: card.brand == CardBrand.visa ? Colors.white : null,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
