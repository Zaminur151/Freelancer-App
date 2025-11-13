import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:freelancer_app/provider/home_provider.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomCarosel extends StatelessWidget {
  const CustomCarosel({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeProvider>(context);
    
    return Stack(
      children: [
      CarouselSlider.builder(
        itemCount: provider.caroselPath.length,
        options: CarouselOptions(
          height: 160,
          autoPlay: true,
          enlargeCenterPage: true,
          viewportFraction: 0.9,
          autoPlayInterval: const Duration(seconds: 5),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          enableInfiniteScroll: true,
          onPageChanged: (index, reason) {
            provider.setCarouselIndex(index);
          },
        ),
        itemBuilder: (context, index, realIdx) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              provider.caroselPath[index],
              fit: BoxFit.fill,
              width: double.infinity,
            ),
          );
        },
      ),
      Positioned(
        bottom: 20,
        left: 0,
        right: 0,
        child: Align(
          alignment: Alignment.center,
          child: AnimatedSmoothIndicator(
            activeIndex: provider.curCarouselIndex, 
            count: provider.caroselPath.length,
            effect: ExpandingDotsEffect(
              dotColor: Color(0xFF00AD80),
              activeDotColor: Color(0xFF00AD80),
              dotHeight: 8,
              dotWidth: 8,
              expansionFactor: 4
            ),
            ),
        )
        )
      ],
    );
  }
}