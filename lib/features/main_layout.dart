import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/di/di.dart';
import 'package:movies_app/core/resources/assets_manager.dart';
import 'package:movies_app/core/resources/color_manager.dart';
import 'package:movies_app/core/resources/font_manager.dart';
import 'package:movies_app/features/main_layout/browser/browser_tab.dart';
import 'package:movies_app/features/main_layout/home/presentation/home_tab.dart';
import 'package:movies_app/features/main_layout/profile/presentation/cubit/get_favorite_cubit.dart';
import 'package:movies_app/features/main_layout/profile/presentation/cubit/get_profile_cubit.dart';
import 'package:movies_app/features/main_layout/profile/presentation/cubit/history_cubit.dart';
import 'package:movies_app/features/main_layout/profile/presentation/profile_tab.dart';
import 'package:movies_app/features/main_layout/search/search_tab.dart';

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
    screens = [
      const HomeTab(),
      const SearchTab(),
      const BrowserTab(),
      MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => getIt<ProfileCubit>()..getProfile()),
          BlocProvider(create: (_) => getIt<FavoritesCubit>()..getFavorites()),
          BlocProvider(create: (_) => getIt<HistoryCubit>()..loadHistory()),
        ],
        child: const ProfileTab(),
      ),
    ];
    controller = PageController(initialPage: currentScreen);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: screens[currentScreen],
      bottomNavigationBar: Container(
        height: 61.h,
        margin: REdgeInsets.only(left: 12, right: 12, bottom: 20),
        decoration: BoxDecoration(
          color: ColorManager.grey,
          borderRadius: BorderRadius.circular(16),
        ),
        child: BottomNavigationBar(
          currentIndex: currentScreen,
          onTap: changeSelectedIndex,
          backgroundColor: Colors.transparent,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            CustomBottomNavBarItem(IconsAssets.icon1, ""),
            CustomBottomNavBarItem(IconsAssets.icon2, ""),
            CustomBottomNavBarItem(IconsAssets.icon3, ""),
            CustomBottomNavBarItem(IconsAssets.icon4, ""),
          ],
        ),
      ),
    );
  }

  void changeSelectedIndex(int selectedIndex) {
    setState(() {
      currentScreen = selectedIndex;
    });
  }
}

class CustomBottomNavBarItem extends BottomNavigationBarItem {
  CustomBottomNavBarItem(String iconPath, String title)
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
