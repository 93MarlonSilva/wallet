import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wallet/constants.dart';
import 'package:wallet/pages/details/detail_page.dart';
import 'package:wallet/pages/home/components/balance.dart';
import 'package:wallet/pages/home/components/card_selector.dart';
import 'package:wallet/components/card/front_card.dart';
import 'package:wallet/models/credit_card.dart';
import 'package:wallet/pages/home/components/home_header.dart';

class HomePage extends StatefulWidget {
  final void Function(CreditCard)? onCardTap;
  const HomePage({super.key, this.onCardTap});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentCardIndex = 0;
  int _previousCardIndex = 0;
  double dragOffset = 0.0;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: AppGradients.backgroundGradient,
            ),
          ),
          Column(
            children: [
              HomeHeader(width: width, height: height),
              Balance(
                card: cards[_currentCardIndex],
                height: height,
                width: width,
                previousCardIndex: _previousCardIndex,
                currentCardIndex: _currentCardIndex,
              ),
              _buildCardsSection(width: width, height: height),
              _buildCardIndicator(width: width, height: height),
              CardSelector(
                selectedIndex: _currentCardIndex,
                onCardSelected: (index) {
                  setState(() {
                    _previousCardIndex = _currentCardIndex;
                    _currentCardIndex = index;
                    dragOffset = 0.0;
                  });
                },
                cards: cards,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCardsSection({required double width, required double height}) {
    final controller = PageController(
      viewportFraction: 0.66,
      initialPage: _currentCardIndex,
    );

    return SizedBox(
      height: 380,
      child: PageView.builder(
        scrollDirection: Axis.vertical,
        controller: controller,
        itemCount: cards.length,
        onPageChanged: (index) {
          setState(() {
            _previousCardIndex = _currentCardIndex;
            _currentCardIndex = index;
          });
        },
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DetailPage(
                  card: cards[index],
                  height: height,
                  width: width,
                ),
              ),
            ),
            child: AnimatedBuilder(
              animation: controller,
              builder: (context, child) {
                double value = 0.6;
                double angle = 0.0;

                if (controller.position.haveDimensions) {
                  value = controller.page! - index;
                  value = (1 - (value.abs() * 0.3)).clamp(0.7, 1.0);
                  angle = ((controller.page ?? index) - index).toDouble();
                  angle = angle.clamp(-1.0, 1.0);
                } else if (index == _currentCardIndex) {
                  value = 1.0;
                  angle = 0.0;
                }

                return Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..rotateX(angle * 0.4)
                    ..scale(value),
                  child: Opacity(
                    opacity: value,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: index == _currentCardIndex
                          ? Hero(
                              tag: 'card-cards[index].id',
                              child: FrontCard(
                                card: cards[index],
                                width: width * 0.85,
                                height: 200,
                                animateCardNumber: true,
                              ),
                            )
                          : FrontCard(
                              card: cards[index],
                              width: width * 0.85,
                              height: 200,
                            ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  Widget _buildCardIndicator({required double width, required double height}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSizes.paddingMedium),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          cards.length,
          (index) => AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            margin: const EdgeInsets.symmetric(horizontal: 4),
            width: index == _currentCardIndex ? 24 : 8,
            height: 8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: index == _currentCardIndex
                  ? AppColors.primary
                  : const Color.fromARGB(255, 49, 59, 88),
            ),
          ),
        ),
      ),
    );
  }
}
