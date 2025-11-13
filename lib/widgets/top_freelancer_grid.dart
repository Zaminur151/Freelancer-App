import 'package:flutter/material.dart';
import 'package:freelancer_app/app/view/color/color.dart';
import 'package:freelancer_app/app/view/style/text_style.dart';

class TopFreelancerGrid extends StatelessWidget {
  const TopFreelancerGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        physics: const ScrollPhysics(),
        scrollDirection: Axis.horizontal,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          mainAxisSpacing: 10,
          mainAxisExtent: 302, 
        ),
        itemCount: 10,
        itemBuilder: (context, index) {
          //final item = categories[index];
          return 
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColors.whiteColor
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Stack(
                        children: [
                          const CircleAvatar(
                            radius: 24,
                            backgroundImage: NetworkImage(
                              'https://images.unsplash.com/photo-1560674457-12073ed6fae6?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Y2FtfGVufDB8fDB8fHww&fm=jpg&q=60&w=3000'
                            ),
                          ),
                          Positioned(
                            bottom: 1,
                            right: 1,
                            child: Container(
                              width: 12,
                              height: 12,
                              decoration: BoxDecoration(
                                color: AppColors.backgroundColor,
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.white, width: 2),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Esther Howard",
                                  style: TextStyles.p1Reguler
                                ),
                                const SizedBox(width: 4),
                                const Icon(Icons.verified, color: Colors.green, size: 16),
                              ],
                            ),
                            const Text(
                              "UI/UX Designer",
                              style: TextStyle(color: Colors.grey, fontSize: 13),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Color(0xFFFFF1F0),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: const [
                          Icon(Icons.bolt, color: Colors.red, size: 14),
                          SizedBox(width: 3),
                          Text(
                            "Pro",
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                            ),
                          ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12,),
                  Row(
                    children: [
                      _textContainer(
                        Text("Figma",style: TextStyles.regular10,)
                      ),
                      SizedBox(width: 8,),
                      _textContainer(
                        Text("Mobile App",style: TextStyles.regular10,)
                      ),
                      SizedBox(width: 8,),
                      Text("+4",style: TextStyles.regular14,)
                    ],
                  ),
                  SizedBox(height: 16,),
                  _textRow(
                    Icons.star_border_outlined, 
                    "Review", 
                    "4.5 (212 reviews)"
                  ),
                  SizedBox(height: 6,),
                  _textRow(
                    Icons.location_on_outlined, 
                    "Location", 
                    "6391 Elgin St. Celina"
                  ),
                  SizedBox(height: 6,),
                  _textRow(
                    Icons.money_outlined, 
                    "Hourly Rate", 
                    "\$83.00/hr"
                  ),
                  
                ],
              ),
            );
        },
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

Widget _textRow(IconData icon, String title, String value){
  return Row(
    children: [
      Icon(icon,size: 14,),
      SizedBox(width: 4,),
      Text(title,style: TextStyles.regular12,),
      Spacer(),
      Text(value,style: TextStyles.regular12,)
    ],
  );
}