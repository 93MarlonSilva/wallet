import 'package:flutter/material.dart';
import 'package:sliding_sheet2/sliding_sheet2.dart';
import 'package:wallet/constants.dart';
import 'package:wallet/models/credit_card.dart';
import 'package:wallet/models/transaction.dart';
import 'package:wallet/pages/details/components/transaction_summary.dart';
import 'package:wallet/pages/home/components/card/back_card.dart';
import 'package:wallet/pages/home/components/card/flippable_widget.dart';
import 'package:wallet/pages/home/components/card/front_card.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        leading: IconButton(
          onPressed: () {},
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
          _buildHeader(),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: widget.width * 0.02),
              child: FlippableWidget(
                frontWidget: FrontCard(
                  card: widget.card,
                  height: widget.height,
                  width: widget.width,
                ),
                backWidget: BackCard(
                  card: widget.card,
                  height: widget.height,
                  width: widget.width,
                ),
              ),
            ),
          ),
          _buildBottomSheet(),
        ],
      ),
    );
  }

  _buildHeader() => Align(
    alignment: Alignment.topCenter,
    child: Column(
      children: [
        Text(
          'Full Card',
          style: Theme.of(
            context,
          ).textTheme.headlineSmall?.copyWith(color: Colors.white),
        ),
        SizedBox(height: widget.height * 0.15),
        Text(
          'Tap to view card details',
          style: Theme.of(
            context,
          ).textTheme.bodySmall?.copyWith(color: Colors.white60),
        ),
      ],
    ),
  );

  _buildBottomSheet() => Align(
    alignment: Alignment.bottomCenter,
    child: SlidingSheet(
      color: sheetColor,
      cornerRadius: widget.width * 0.025,
      snapSpec: SnapSpec(
        snap: true,
        snappings: [0.3, 0.6, 0.1],
        positioning: SnapPositioning.relativeToAvailableSpace,
      ),
      headerBuilder: (context, state) {
        return Container(
          height: widget.height * 0.07,
          width: double.infinity,
          color: sheetColor,
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
          color: sheetColor,
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
  );
}
