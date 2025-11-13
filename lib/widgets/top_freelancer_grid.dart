import 'package:flutter/material.dart';
import 'package:freelancer_app/app/view/color/color.dart';
import 'package:freelancer_app/app/view/style/text_style.dart';
import 'package:freelancer_app/models/freelancer_model.dart';
import 'package:freelancer_app/provider/home_provider.dart';
import 'package:provider/provider.dart';

class TopFreelancerGrid extends StatelessWidget {
  const TopFreelancerGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeProvider>(context);

    if (provider.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (provider.error != null) {
      return Center(child: Text('Error: ${provider.error}'));
    }

    if (provider.freelancers.isEmpty) {
      return const Center(child: Text('No freelancers found.'));
    }
    
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
        itemCount: provider.freelancers.length,
        itemBuilder: (context, index) {

          final Freelancer item = provider.freelancers[index];
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
                          CircleAvatar(
                            radius: 24,
                            backgroundImage: NetworkImage(
                              item.image != "https://xilancer.xgenious.com/assets/static/img/default-profile.png"?
                              item.image : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ-Ne7oVV6Lx9uAnmJDUZrrLcGy8yzo1sXdpQ&s"
                            ),
                          ),
                          Positioned(
                            bottom: 1,
                            right: 1,
                            child: Container(
                              width: 12,
                              height: 12,
                              decoration: BoxDecoration(
                                color: item.isOnline? AppColors.secondaryColor : AppColors.blue400,
                                shape: BoxShape.circle,
                                border: Border.all(color: AppColors.whiteColor, width: 2),
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
                                  item.name,
                                  style: TextStyles.p1Reguler
                                ),
                                const SizedBox(width: 4),
                                if(item.isVerified)
                                Icon(Icons.verified, color: AppColors.secondaryColor, size: 16),
                              ],
                            ),
                            Text(
                              item.title,
                              style: TextStyle(color: AppColors.blue300, fontSize: 13),
                            ),
                          ],
                        ),
                      ),
                      if(item.experienceLevel == "senior")
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Color(0xFFFFF1F0),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                          Icon(Icons.bolt, color: AppColors.primaryColor, size: 14),
                          SizedBox(width: 3),
                          Text(
                            "Pro",
                            style: TextStyle(
                              color: AppColors.primaryColor,
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
                    "${item.statistics.averageRating} (${item.statistics.totalReviews} reviews)"
                  ),
                  SizedBox(height: 6,),
                  _textRow(
                    Icons.location_on_outlined, 
                    "Location", 
                    item.location.country
                  ),
                  SizedBox(height: 6,),
                  _textRow(
                    Icons.attach_money_outlined, 
                    "Hourly Rate", 
                    "\$${item.hourlyRate}/hr"
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