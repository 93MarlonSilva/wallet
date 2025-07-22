import 'dart:math';

import 'package:flutter/material.dart';

class FlippableWidget extends StatefulWidget {
  final Widget frontWidget;
  final Widget backWidget;
  final bool isFront;
  final double? flipAngle;

  const FlippableWidget({
    super.key,
    required this.frontWidget,
    required this.backWidget,
    this.isFront = true,
    this.flipAngle,
  });

  @override
  FlippableWidgetState createState() => FlippableWidgetState();
}

class FlippableWidgetState extends State<FlippableWidget> {
  bool isFront = true;
  double verticalDrag = 0;

  @override
  void initState() {
    isFront = widget.isFront;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double angle = widget.flipAngle ?? verticalDrag;
    final bool showFront = angle <= 90 || angle >= 270;
    return GestureDetector(
      onVerticalDragUpdate: (vertical) {
        setState(() {
          verticalDrag += vertical.delta.dy;
          verticalDrag %= 360;
        });
      },
      child: Transform(
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001)
          ..rotateX((angle * pi) / 180),
        alignment: Alignment.center,
        child: showFront
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
