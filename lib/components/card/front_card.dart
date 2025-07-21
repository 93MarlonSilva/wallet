import 'dart:math';
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:wallet/models/credit_card.dart';

class FrontCard extends StatelessWidget {
  final CreditCard card;
  final bool showCardNumber;
  final bool animateCardNumber;
  final double height;
  final double width;

  const FrontCard({
    super.key,
    required this.card,
    this.showCardNumber = true,
    this.animateCardNumber = true,
    required this.height,
    required this.width,
  });
  
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.586, // Standard credit card ratio
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: LinearGradient(
            colors: card.colors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: const [0.0, 1.0],
          ),
          
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top row with card type and NFC
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      card.cardType,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.wifi,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 32),
              
              // Chip and card number section
              Row(
                children: [
                  // Chip
                  Image.asset('assets/card/chip.png', width: 50,),
                  
                  const SizedBox(width: 16),
                  
                  // Card number
                  if (showCardNumber)
                    Expanded(
                      child: PlayAnimationBuilder(
                        tween: IntTween(begin: 0, end: card.number.length),
                        delay: const Duration(milliseconds: 400),
                        duration: const Duration(milliseconds: 800),
                        builder: (context, value, child) {
                          return Text(
                            animateCardNumber
                                ? card.number.substring(0, value)
                                : card.number,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 2,
                              fontFamily: 'Courier',
                            ),
                          );
                        },
                      ),
                    ),
                ],
              ),
              
              const Spacer(),
              
              // Bottom section with cardholder and brand
              Row(
                children: [
                  // Cardholder info
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "CARD HOLDER",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          card.cardHolder,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  // Expiry date
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "EXPIRES",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        card.expiryDate,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  
                  const SizedBox(width: 24),
                  
                  // Brand logo
                  Container(
                    height: 32,
                    width: 48,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: Image.asset(
                        card.brand == CardBrand.visa
                            ? "assets/card/visa.png"
                            : "assets/card/mastercard.png",
                        fit: BoxFit.contain,
                      ),
                    ),
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
