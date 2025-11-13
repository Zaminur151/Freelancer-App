import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:freelancer_app/app/view/color/color.dart';
import 'package:freelancer_app/app/view/style/text_style.dart';
import 'package:freelancer_app/provider/home_provider.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<String> imagePath = [
    'assets/images/carousel_img.svg',
    'assets/images/carousel_img.svg',
    'assets/images/carousel_img.svg',
    
  ];
  
  @override
  Widget build(BuildContext context) {

    final provider = Provider.of<HomeProvider>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Welcome Back!",style: TextStyles.regular14,),
                        Text("Leslie Alexander",style: TextStyles.p3Medium,)
                      ],
                    ),
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                        'https://images.unsplash.com/photo-1560674457-12073ed6fae6?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Y2FtfGVufDB8fDB8fHww&fm=jpg&q=60&w=3000'
                        ),
                    )
                  ],
                ),
                
              ),
              const SizedBox(height: 24,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search here",
                    hintStyle: TextStyles.p1Reguler,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(12),
                      child: SvgPicture.asset(
                        "assets/icons/icon_search.svg",
                        height: 20,
                        width: 20,
                      ),
                    ),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.backgroundColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.all(8),
                        child: const Icon(Icons.tune, color: Colors.grey, size: 20),
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                )
                ,
              ),
              SizedBox(height: 24,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text("Popular Categories",style: TextStyles.p3Medium,),
              ),
              SizedBox(height: 12,),
              SizedBox(
                height: 100,
                width: double.infinity,
                child: GridView.builder(
                   //shrinkWrap: true,
                  physics: ScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  dragStartBehavior: DragStartBehavior.start,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    //childAspectRatio: 106 / 94,
                    mainAxisSpacing: 10                  
                    ), 
                  itemCount: 10,
                  itemBuilder: (context, index){
                    return Container(
                      height: 94,
                      width: 106,
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(16)
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset("assets/icons/icon_digital_marketing.svg"),
                          Spacer(),
                          Text("Digital Marketing",style: TextStyles.regular12,),
                          
                        ],
                      ),
                    );
                  }
                ),
              ),
              SizedBox(height: 24,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Stack(
                  children: [
                  CarouselSlider.builder(
                    itemCount: imagePath.length,
                    options: CarouselOptions(
                      height: 200,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      viewportFraction: 1,
                      autoPlayInterval: const Duration(seconds: 5),
                      autoPlayAnimationDuration: const Duration(milliseconds: 800),
                      enableInfiniteScroll: true,
                      onPageChanged: (index, reason) {
                        provider.setCarouselIndex(index);
                      },
                    ),
                    itemBuilder: (context, index, realIdx) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: SvgPicture.asset(
                          imagePath[index],
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
                        activeIndex: provider.currentIndex, 
                        count: imagePath.length,
                        effect: ExpandingDotsEffect(),
                        ),
                    )
                    )
                  ],
                )
              ),
              SizedBox(height: 24,),
             Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Popular Services",style: TextStyles.p3Medium,),
                      Text("Explore all", style: TextStyles.p1Reguler,)
                    ],
                    
                  ),
                  SizedBox(height: 12,),

                  Container(
                    width: 280,
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        width: 1,
                        color:  AppColors.blue900
                      )
                    ),
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12),
                                topRight: Radius.circular(12)
                              ),
                              child: Image.asset(
                                "assets/images/p_service_01.png",
                                height: 172,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              top: 10,
                              right: 10,
                              child: CircleAvatar(
                                radius: 20,
                                backgroundColor: AppColors.whiteColor,
                                child: Icon(Icons.favorite_border_outlined),
                              )
                            ),
                            Positioned(
                              top: 10,
                              left: 10,
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                                decoration: BoxDecoration(
                                  color: AppColors.whiteColor,
                                  borderRadius: BorderRadius.circular(80)
                                ),
                                child: Text("Sponsored")
                              )
                            )
                          ],
                        ),
                        
                        Row(
                          children: [
                            Icon(Icons.star_border),
                            Text("4.5 (23 Reviews)",style: TextStyles.regular14,),
                            Spacer(),
                            Text("Level - 2",style: TextStyles.regular14),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Text("I will do professional figma design for website tamplate....",style: TextStyles.p1Medium),
                        SizedBox(height: 3,),
                        Divider(
                          color: AppColors.backgroundColor,
                          thickness: 1,
                        ),
                        SizedBox(height: 3,),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 12,vertical: 10),
                          height: 44,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: AppColors.backgroundColor
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                            Text("Starting From",style: TextStyles.regular14),
                            Text("\$126",style: TextStyles.p1Medium),
                          ],),
                        )
                      ],
                    ),
                  ),
                ],
              ), 
             ),
             SizedBox(height: 44,),
             Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Text(""),
                  SizedBox(height: 24,),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage(
                                'https://images.unsplash.com/photo-1560674457-12073ed6fae6?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Y2FtfGVufDB8fDB8fHww&fm=jpg&q=60&w=3000'
                                ),
                            ),
                            Text("  Posted 2 years ago",style: TextStyles.regular14,),
                            Spacer(),
                            CircleAvatar(
                                radius: 20,
                                backgroundColor: AppColors.backgroundColor,
                                child: Icon(Icons.favorite_border_outlined),
                              )
                          ],
                        ),
                        SizedBox(height: 12,),
                        Text("Logo Design for Business Loan Brokerage fora agency",style: TextStyles.p1Medium,),
                        SizedBox(height: 12,),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                              decoration: BoxDecoration(
                                color: AppColors.backgroundColor,
                                borderRadius: BorderRadius.circular(100)
                              ),
                              child: Row(
                                children: [
                                  Icon(Icons.work_outline,color: AppColors.secondaryColor),
                                  Text(" MidLevel",style: TextStyles.regular12.copyWith(color: AppColors.secondaryColor))
                                ],
                              ),
                            ),
                            SizedBox(width: 8,),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                              decoration: BoxDecoration(
                                color: AppColors.backgroundColor,
                                borderRadius: BorderRadius.circular(100)
                              ),
                              child: Text("Fixed",style: TextStyles.regular12.copyWith(color: Color(0xFF6A3BE8))),
                            ),
                            SizedBox(width: 8,),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                              decoration: BoxDecoration(
                                color: AppColors.backgroundColor,
                                borderRadius: BorderRadius.circular(100)
                              ),
                              child: Text("Sponsored",style: TextStyles.regular12),
                            ),
                            
                          ],
                        ),
                        SizedBox(height: 12,),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 12,vertical: 10),
                          height: 44,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: AppColors.backgroundColor
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                            Text("Fixed Price",style: TextStyles.regular14),
                            Text("\$126",style: TextStyles.p1Medium),
                          ],),
                        )
                      ],
                    ),
                  )
                ],
              ), 
              )
            ],
          )
        ),
      ),
    );
  }
}