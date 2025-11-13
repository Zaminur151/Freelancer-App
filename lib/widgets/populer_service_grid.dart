import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/gestures.dart';
import 'package:freelancer_app/app/view/color/color.dart';
import 'package:freelancer_app/app/view/style/text_style.dart';

class PopulerServiceGrid extends StatelessWidget {
  //final List<Map<String, String>> serviceList;

  const PopulerServiceGrid({
    super.key,
    //required this.serviceList,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      width: double.infinity,
      child: GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        physics: const ScrollPhysics(),
        scrollDirection: Axis.horizontal,
        dragStartBehavior: DragStartBehavior.start,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          mainAxisSpacing: 10,
          mainAxisExtent: 280, 
        ),
        itemCount: 10,
        itemBuilder: (context, index) {
          //final item = categories[index];
          return Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                width: 1,
                color:  AppColors.blue50
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
                        child: Icon(Icons.favorite_border_outlined,color: AppColors.blue600,),
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
                SizedBox(height: 4,),
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
          );
        },
      ),
    );
  }
}  