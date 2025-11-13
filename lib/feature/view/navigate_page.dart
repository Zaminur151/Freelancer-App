import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:freelancer_app/app/view/color/color.dart';
import 'package:freelancer_app/app/view/style/text_style.dart';
import 'package:freelancer_app/feature/view/dummy_screens.dart';
import 'package:freelancer_app/feature/view/home_page.dart';
import 'package:freelancer_app/provider/home_provider.dart';
import 'package:provider/provider.dart';

class NavigatePage extends StatelessWidget {
  const NavigatePage({super.key});

  final List<Widget> _screens = const [
    HomePage(),
    SearchScreen(),
    MassageScreen(),
    AboutScreen(),
    UserProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final nav = Provider.of<HomeProvider>(context);
    final selectedIndex = nav.curNavIndex;

    return Scaffold(
      body: _screens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.whiteColor,
        currentIndex: selectedIndex,
        onTap: nav.setNavIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.secondaryColor,
        unselectedItemColor: AppColors.blue400,
        selectedLabelStyle: TextStyles.regular14.copyWith(color: AppColors.secondaryColor),
        unselectedLabelStyle: TextStyles.regular14.copyWith(color: AppColors.blue400),
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/nav_home.svg",
              colorFilter: ColorFilter.mode(
                selectedIndex == 0 ? AppColors.secondaryColor : AppColors.blue400,
                BlendMode.srcIn,
              ),
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/nav_inbox.svg",
              colorFilter: ColorFilter.mode(
                selectedIndex == 1 ? AppColors.secondaryColor : AppColors.blue400,
                BlendMode.srcIn,
              ),
            ),
            label: "Inbox",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/nav_search.svg",
              colorFilter: ColorFilter.mode(
                selectedIndex == 2 ? AppColors.secondaryColor : AppColors.blue400,
                BlendMode.srcIn,
              ),
            ),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/nav_more.svg",
              colorFilter: ColorFilter.mode(
                selectedIndex == 3 ? AppColors.secondaryColor : AppColors.blue400,
                BlendMode.srcIn,
              ),
            ),
            label: "More",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/nav_profile.svg",
              colorFilter: ColorFilter.mode(
                selectedIndex == 4 ? AppColors.secondaryColor : AppColors.blue400,
                BlendMode.srcIn,
              ),
            ),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
