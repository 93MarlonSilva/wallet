import 'dart:math';

import 'package:flutter/material.dart';

class FlippableWidget extends StatefulWidget {
  final Widget frontWidget;
  final Widget backWidget;
  const FlippableWidget({
    super.key,
    required this.frontWidget,
    required this.backWidget,
  });

  @override
  State<FlippableWidget> createState() => _FlippableWidgetState();
}

class _FlippableWidgetState extends State<FlippableWidget> {
  bool isFrontCardVisible = true;
  double verticalDrag = 0.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragUpdate: (vertical) {
        setState(() {
          verticalDrag = vertical.delta.dy;
          verticalDrag %= 360;
          if (verticalDrag < 90 || verticalDrag > 270) {
            isFrontCardVisible = true;
          } else {
            isFrontCardVisible = false;
          }
        });
      },
      child: Transform(
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001)
          ..rotateX((verticalDrag * pi) / 180),
        alignment: Alignment.center,
        child: isFrontCardVisible
            ? widget.frontWidget
            : Transform(
                transform: Matrix4.identity()..rotateX(pi),
                alignment: Alignment.center,
                child: widget.backWidget,
              ),
      ),
    );
  }
}
