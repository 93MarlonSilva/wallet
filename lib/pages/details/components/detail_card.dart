
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

class DetailCardState extends State<DetailCard> with SingleTickerProviderStateMixin {
  bool animateCardNumber = true;
  late AnimationController _controller;
  late Animation<double> _flipAnimation;
  bool flipByGesture = false;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );
    _flipAnimation = Tween<double>(begin: 0, end: 360).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          flipByGesture = true;
        });
      }
    });
    _controller.forward();
    Future.delayed(Duration(milliseconds: 1000),
        () => setState(() => animateCardNumber = false));
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.center,
        child: Padding(
            padding: EdgeInsets.fromLTRB(
                widget.width * 0.06,
                0,
                widget.width * 0.06,
                widget.sheetProgress > 0.462
                    ? widget.height * 0.55
                    : widget.height * 0.20 +
                        widget.sheetProgress * 600),
            child: Transform.scale(
              scale: widget.sheetProgress > 0.462
                  ? 1 - (widget.sheetProgress - 0.462)
                  : 1,
              child: AnimatedBuilder(
                animation: _flipAnimation,
                builder: (context, child) {
                  return FlippableWidget(
                    flipAngle: flipByGesture ? null : _flipAnimation.value,
                    frontWidget: Hero(
                      tag: 'card-${widget.card.id}',
                      child: FrontCard(
                        card: widget.card,
                        showCardNumber: true,
                        animateCardNumber: animateCardNumber,
                        height: widget.height,
                        width: widget.width,
                      ),
                    ),
                    backWidget: BackCard(
                      card: widget.card, height: widget.height, width: widget.width
                    ),
                  );
                },
              ),
            ),
         ),
         );
  }
}