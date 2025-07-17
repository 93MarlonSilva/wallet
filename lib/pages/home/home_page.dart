import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mccounting_text/mccounting_text.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wallet/pages/home/components/balance.dart';
import 'package:wallet/pages/home/components/card/front_card.dart';
import 'package:wallet/models/credit_card.dart';
import 'package:wallet/pages/home/components/home_header.dart';
// Removido: import 'package:wallet/size.config.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController pageController = PageController(viewportFraction: 0.6);

  int _currentCardIndex = 0;
  int _previousCardIndex = 0;

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back,
          color: Colors.white,
          size: height * 0.04,
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            HomeHeader(width: width, height: height),
            Balance(
              card: cards[_currentCardIndex],
              height: height,
              width: width,
              previousCardIndex: _previousCardIndex,
              currentCardIndex: _currentCardIndex,
            ),
            _buildCardsList(width: width, height: height),
            _buildCardIndicator(width: width, height: height),
          ],
        ),
      ),
    );
  }

  _buildCardsList({required double width, required double height}) => Expanded(
    child: Expanded(
      child: Transform(
        transform: Matrix4.identity()
          ..translate(-width * 0.18)
          ..rotateZ(-pi / 2),
        alignment: Alignment.center,
        child: PageView.builder(
          scrollDirection: Axis.vertical,
          controller: pageController,
          itemCount: cards.length,
          onPageChanged: (index) => setState(() {
            _previousCardIndex = _currentCardIndex;
            _currentCardIndex = index;
          }),
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.all(height * 0.02),
              child: FrontCard(
                card: cards[index],
                width: width,
                height: height,
              ),
            );
          },
        ),
      ),
    ),
  );

  _buildCardIndicator({required double width, required double height}) =>
      Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.02,
          vertical: height * 0.04,
        ),
        child: SmoothPageIndicator(
          controller: pageController,
          count: cards.length,
          effect: WormEffect(
            dotHeight: height * 0.01,
            dotWidth: height * 0.01,
            activeDotColor: Colors.white,
            dotColor: Colors.white30,
          ),
        ),
      );
}
