import 'package:flutter/foundation.dart';
import 'package:freelancer_app/app/service/api_service.dart';
import 'package:freelancer_app/models/freelancer_model.dart';

class HomeProvider with ChangeNotifier {
  int _currentCarouselIndex = 0;
  int _currentNavIndex = 0;
  final ApiService _api = ApiService();

  List<Freelancer> _freelancers = [];
  bool _isLoading = false;
  String? _error;

  List<Freelancer> get freelancers => _freelancers;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> fetchFreelancers() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _freelancers = await _api.fetchFreelancers();
    } catch (e) {
      _error = e.toString();
    }

    _isLoading = false;
    notifyListeners();
  }

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
