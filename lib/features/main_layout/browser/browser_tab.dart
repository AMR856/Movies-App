import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/resources/color_manager.dart';
<<<<<<< HEAD:lib/feature/main_layout/browser/browser_tab.dart
import 'package:movies_app/feature/main_layout/browser/widgets/custom_tab_bar.dart';
=======
import 'package:movies_app/core/widgets/custom_movie_item.dart';
import 'package:movies_app/features/main_layout/browser/widgets/custom_tab_bar.dart';
>>>>>>> 9e6d2ce8114061c6dbb3c988c0567d21e88e826f:lib/features/main_layout/browser/browser_tab.dart

class BrowserTab extends StatelessWidget {
  const BrowserTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: REdgeInsets.all(16),
        child: Column(
          children: [
            CustomTabBar(
              selectedTapBgColor: ColorManager.yellow,
              selectedTapFgColor: ColorManager.primary,
              unSelectedTapBgColor: ColorManager.primary,
              unSelectedTapFgColor: ColorManager.yellow,
            ),
            // Expanded(
            //   child: GridView.builder(
            //     physics: BouncingScrollPhysics(),
            //     padding: REdgeInsets.only(top: 13),
            //     scrollDirection: Axis.vertical,
            //     itemBuilder: (context, index) {
            //       return CustomMovieItem();
            //     },
            //     itemCount: 10,
            //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //       crossAxisCount: 2,
            //       childAspectRatio: 0.75,
            //       mainAxisSpacing: 10,
            //       crossAxisSpacing: 12
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
