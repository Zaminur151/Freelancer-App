import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:freelancer_app/app/view/color/color.dart';
import 'package:freelancer_app/app/view/style/text_style.dart';
import 'package:freelancer_app/provider/home_provider.dart';
import 'package:freelancer_app/widgets/carousel.dart';
import 'package:freelancer_app/widgets/job_post.dart';
import 'package:freelancer_app/widgets/populer_categories.dart';
import 'package:freelancer_app/widgets/populer_service_grid.dart';
import 'package:freelancer_app/widgets/top_freelancer_grid.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    Future.microtask(() =>
    Provider.of<HomeProvider>(context, listen: false).fetchFreelancers());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    final provider = Provider.of<HomeProvider>(context);
    final userName = "Zaminur Hasan";
    final userImage = 'https://images.unsplash.com/photo-1560674457-12073ed6fae6?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Y2FtfGVufDB8fDB8fHww&fm=jpg&q=60&w=3000';

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40,),
              _userHeader(userName, userImage),
              const SizedBox(height: 24,),
              _searchBar(),
              SizedBox(height: 24,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text("Popular Categories",style: TextStyles.p3Medium,),
              ),
              SizedBox(height: 12,),
              PopulerCategoryGrid(categories: provider.populerCategoryList),
              SizedBox(height: 24,),
              CustomCarosel(),
              SizedBox(height: 24,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Popular Services",style: TextStyles.p3Medium,),
                    Text("Explore all", style: TextStyles.p1Reguler,)
                  ],
                ),
              ),
              SizedBox(height: 12,),
              PopulerServiceGrid(),
              SizedBox(height: 50,),
              JobPostBuilder(),
              SizedBox(height: 12,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColors.whiteColor
                  ),
                  child: Center(child: Text("Load More", style: TextStyles.p1Reguler.copyWith(color: AppColors.blue400))),
                ), 
              ),
              SizedBox(height: 24,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Top Rated Freelancer",style: TextStyles.p3Medium,),
                    Text("Explore all", style: TextStyles.p1Reguler,)
                  ],
                ),
              ),
              SizedBox(height: 12,),
              TopFreelancerGrid()
            ],
          )
        ),
      ),
    );
  }
}

Widget _userHeader(String userName, String userImage){
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Welcome Back!",style: TextStyles.regular14,),
            Text(userName,style: TextStyles.p3Medium,)
          ],
        ),
        CircleAvatar(
          backgroundImage: NetworkImage(
            userImage
            ),
        )
      ],
    ),
    
  );
}

Widget _searchBar(){
  return Padding(
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
          padding: const EdgeInsets.all(8),
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
        fillColor: AppColors.whiteColor,
        contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    )
    ,
  );
}

