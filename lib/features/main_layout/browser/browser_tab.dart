import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/resources/color_manager.dart';
import 'package:movies_app/features/main_layout/browser/widgets/custom_tab_bar.dart';


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
