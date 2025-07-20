import 'package:flutter/material.dart';

class DetailHeader extends StatelessWidget {
  final double sheetProgress;
  final double height;
  final double width;
  const DetailHeader({
    super.key,
    required this.sheetProgress,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Transform.scale(
        scale: 1.0 - (sheetProgress * 20.0),
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            Text(
              'Full Card',
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(color: Colors.white),
            ),
            SizedBox(height: height * 0.1),
            Text(
              'Tap to view card details',
              style: Theme.of(
                context,
              ).textTheme.bodySmall?.copyWith(color: Colors.white60),
            ),
          ],
        ),
      ),
    );
  }
}
