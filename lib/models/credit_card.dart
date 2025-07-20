import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:wallet/constants.dart';

enum CardBrand { visa, mastercard }

class CreditCard {
  int id;
  String cardHolder, securityCode, number, expiryDate;
  CardBrand brand;
  double amount;
  List<Color> colors;
  String cardType;

  CreditCard({
    required this.id,
    required this.cardHolder,
    required this.securityCode,
    required this.number,
    required this.expiryDate,
    required this.brand,
    required this.amount,
    required this.colors,
    required this.cardType,
  });
}

List<CreditCard> cards = [
  CreditCard(
    id: 1,
    cardHolder: "Sandy Chungus",
    securityCode: "123",
    number: "5000 0000 0000 0000",
    expiryDate: "12/25",
    brand: CardBrand.mastercard,
    amount: 2572.52,
    colors: AppColors.cardGradient1,
    cardType: "Credit",
  ),
  CreditCard(
    id: 2,
    cardHolder: "Alex Johnson",
    securityCode: "456",
    number: "4111 1111 1111 1111",
    expiryDate: "09/26",
    brand: CardBrand.visa,
    amount: 7535.41,
    colors: AppColors.cardGradient2,
    cardType: "Debit",
  ),
  CreditCard(
    id: 3,
    cardHolder: "Maria Silva",
    securityCode: "789",
    number: "5555 5555 5555 4444",
    expiryDate: "03/27",
    brand: CardBrand.mastercard,
    amount: 12517.07,
    colors: AppColors.cardGradient3,
    cardType: "Credit",
  ),
  CreditCard(
    id: 4,
    cardHolder: "David Chen",
    securityCode: "321",
    number: "4000 0000 0000 0002",
    expiryDate: "06/26",
    brand: CardBrand.visa,
    amount: 8923.15,
    colors: AppColors.cardGradient4,
    cardType: "Debit",
  ),
];
