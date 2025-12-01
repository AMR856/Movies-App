import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/resources/assets_manager.dart';
import 'package:movies_app/core/resources/color_manager.dart';
import 'package:movies_app/core/resources/font_manager.dart';
import 'package:movies_app/feature/main_layout/browser/browser_tab.dart';
import 'package:movies_app/feature/main_layout/home/home_tab.dart';
import 'package:movies_app/feature/main_layout/profile/profile_tab.dart';
import 'package:movies_app/feature/main_layout/search/search_tab.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  late List<Widget> screens;
  late PageController controller;
  int currentScreen = 0;

  @override
  void initState() {
    screens = const [HomeTab(), SearchTab(), BrowserTab(), ProfileTab()];
    controller = PageController(initialPage: currentScreen);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: false,
      body: Stack(
        alignment: AlignmentGeometry.bottomCenter,
        children: [
          screens[currentScreen],
          Container(
            clipBehavior: Clip.antiAlias,
            height: 61.h,
            margin: REdgeInsets.only(left: 12, right: 12, bottom: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
            child: BottomNavigationBar(
              currentIndex: currentScreen,
              onTap: (value) => changeSelectedIndex(value),
              backgroundColor: ColorManager.grey,
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              selectedLabelStyle: TextStyle(fontSize: 0),
              items: [
                CustomBottomNavBarItem(IconsAssets.icon1, ""),
                CustomBottomNavBarItem(IconsAssets.icon2, ""),
                CustomBottomNavBarItem(IconsAssets.icon3, ""),
                CustomBottomNavBarItem(IconsAssets.icon4, ""),
              ],
            ),
          ),
        ],
      ),
    );
  }

  changeSelectedIndex(int selectedIndex) {
    setState(() {
      currentScreen = selectedIndex;
    });
  }
}

class CustomBottomNavBarItem extends BottomNavigationBarItem {
  String iconPath;
  String title;
  CustomBottomNavBarItem(this.iconPath, this.title)
    : super(
        label: title,
        icon: ImageIcon(
          AssetImage(iconPath),
          color: ColorManager.white,
          size: FontSize.s24.sp,
        ),
        activeIcon: ImageIcon(
          AssetImage(iconPath),
          size: FontSize.s24.sp,
          color: ColorManager.yellow,
        ),
      );
}
