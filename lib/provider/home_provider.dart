import 'package:flutter/foundation.dart';

class HomeProvider with ChangeNotifier {
  int _currentCarouselIndex = 0;

  int get currentIndex => _currentCarouselIndex;

  void setCarouselIndex(int index) {
    _currentCarouselIndex = index;
    notifyListeners();
  }
}
