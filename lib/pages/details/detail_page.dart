import 'package:flutter/material.dart';
import 'package:simple_animations/animation_builder/play_animation_builder.dart';
import 'package:sliding_sheet2/sliding_sheet2.dart';
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
  const DetailPage({
    super.key,
    required this.card,
    required this.height,
    required this.width,
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  double sheetProgress = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: widget.height * 0.04,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: widget.width * 0.02),
            child: Icon(
              Icons.share,
              color: Colors.white,
              size: widget.height * 0.04,
            ),
          ),
        ],
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          PlayAnimationBuilder(
            tween: Tween(begin: widget.height * 2, end: 0.0),
            curve: Curves.easeOut,
            duration: Duration(milliseconds: 200),
            builder: (context, value, child) =>
                Transform.translate(offset: Offset(0, value), child: child),
            child: DetailHeader(
              sheetProgress: sheetProgress,
              height: widget.height,
              width: widget.width,
            ),
          ),
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

          _buildBottomSheet(),
        ],
      ),
    );
  }

  _buildBottomSheet() => PlayAnimationBuilder(
    tween: Tween<double>(begin: widget.height * 2, end: 0.0),
    curve: Curves.easeOut,
    duration: Duration(milliseconds: 200),
    builder: (context, value, child) =>
        Transform.translate(offset: Offset(0, value), child: child),
    child: Align(
      alignment: Alignment.bottomCenter,
      child: SlidingSheet(
        color: AppColors.sheetColor,
        cornerRadius: widget.width * 0.25,
        snapSpec: SnapSpec(
          snap: true,
          snappings: [0.3, 0.6, 0.1],
          positioning: SnapPositioning.relativeToAvailableSpace,
        ),
        listener: (state) => setState(() {
          sheetProgress = ((state.extent - 0.3) / 0.65);
        }),
        headerBuilder: (context, state) {
          return Container(
            height: widget.height * 0.07,
            width: double.infinity,
            color: AppColors.sheetColor,
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: widget.width * 0.02),
              child: Text(
                'Today',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
        builder: (context, state) {
          return Container(
            color: AppColors.sheetColor,
            child: ListView.builder(
              itemCount: transactions.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return TransactionSummary(
                  transaction: transactions[index],
                  height: widget.height,
                  width: widget.width,
                );
              },
            ),
          );
        },
      ),
    ),
  );
}
