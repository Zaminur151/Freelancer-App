import 'package:flutter/foundation.dart';

class HomeProvider with ChangeNotifier {
  int _currentCarouselIndex = 0;
  int _currentNavIndex = 0;

  int get curCarouselIndex => _currentCarouselIndex;
  int get curNavIndex => _currentNavIndex;

  void setCarouselIndex(int index) {
    _currentCarouselIndex = index;
    notifyListeners();
  }

  void setNavIndex(int index) {
    _currentNavIndex = index;
    notifyListeners();
  }

  List<Map<String, String>> populerCategoryList = [
    {
      "icon":"assets/icons/icon_digital_marketing.svg",
      "title": "Digital Marketing"
    },
    {
      "icon":"assets/icons/icon_graphics.svg",
      "title": "Graphics Design"
    },
    {
      "icon":"assets/icons/icon_web_dev.svg",
      "title": "Website Development"
    },
    {
      "icon":"assets/icons/icon_branding.svg",
      "title": "Branding Design"
    },
    {
      "icon":"assets/icons/icon_digital_marketing.svg",
      "title": "Digital Marketing"
    },
    {
      "icon":"assets/icons/icon_graphics.svg",
      "title": "Graphics Design"
    },
    {
      "icon":"assets/icons/icon_web_dev.svg",
      "title": "Website Development"
    },
    {
      "icon":"assets/icons/icon_branding.svg",
      "title": "Branding Design"
    },
  ];

  List<String> caroselPath = [
    'assets/images/carosel_image.png',
    'assets/images/carosel_image.png',
    'assets/images/carosel_image.png',
    
  ];
}
