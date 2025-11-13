import 'package:flutter/material.dart';
import 'package:freelancer_app/app/view/color/color.dart';
import 'package:freelancer_app/app/view/style/text_style.dart';

class JobPostBuilder extends StatelessWidget {
  const JobPostBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Recent Job Posted",style: TextStyles.p3Medium,),
          ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 2,
            separatorBuilder: (context, index) => SizedBox(height: 12,),
            itemBuilder: (context, index){
              return Container(
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
                    _textContainer(
                     Row(
                        children: [
                          Icon(Icons.work_outline,color: AppColors.secondaryColor,size: 12,),
                          Text(" MidLevel",style: TextStyles.regular12.copyWith(color: AppColors.secondaryColor))
                        ],
                      ), 
                    ),
                    SizedBox(width: 8,),
                    _textContainer(
                      Text("Fixed",style: TextStyles.regular12.copyWith(color: Color(0xFF6A3BE8)))
                    ),
                    SizedBox(width: 8,),
                    _textContainer(
                      Text("Sponsored",style: TextStyles.regular12)
                    )
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
          );
            }
          ),
        ],
      ), 
      );
  }
}

Widget _textContainer(Widget widget){
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(80),
      color: AppColors.backgroundColor,
    ),
    child: widget,
  );
}