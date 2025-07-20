
import 'package:flutter/material.dart';
import 'package:wallet/components/card/back_card.dart';
import 'package:wallet/components/card/front_card.dart';
import 'package:wallet/components/flippable_widget.dart';
import 'package:wallet/models/credit_card.dart';

class DetailCard extends StatefulWidget {
  final CreditCard card;
  final double sheetProgress;
  final double height;
  final double width;

  const DetailCard({super.key, required this.card, required this.sheetProgress, required this.height, required this.width});
  @override
  DetailCardState createState() => DetailCardState();
}

class DetailCardState extends State<DetailCard> {
  bool animateCardNumber = true;

  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 1000),
        () => setState(() => animateCardNumber = false));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.center,
        child: Padding(
            padding: EdgeInsets.fromLTRB(
                widget.width * 0.1,
                0,
                widget.width * 0.1,
                widget.sheetProgress > 0.462
                    ? widget.height * 0.55
                    : widget.height * 0.20 +
                        widget.sheetProgress * 600),
            child: Transform.scale(
              scale: widget.sheetProgress > 0.462
                  ? 1 - (widget.sheetProgress - 0.462)
                  : 1,
              child: FlippableWidget(
                  frontWidget: FrontCard(
                    card: widget.card,
                    showCardNumber: true,
                    animateCardNumber: animateCardNumber,
                    height: widget.height,
                    width: widget.width,
                  ),
                  backWidget: BackCard(
                    card: widget.card, height: widget.height, width: widget.width
                ),
            ),
          ),
        ),
     );
  }
}