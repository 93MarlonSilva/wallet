import 'package:flutter/material.dart';

class PageNotifier extends ChangeNotifier {
  PageController pageController = PageController(viewportFraction: 0.6);
  double currentPage = 0.0;

  PageNotifier() {
    pageController.addListener(() {
      currentPage = pageController.page ?? 0.0;
      notifyListeners();
    });
  }
}
