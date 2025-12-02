import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/resources/assets_manager.dart';
import 'package:movies_app/core/resources/values_manager.dart';
import 'package:movies_app/core/widgets/custom_text_filed.dart';

class SearchTab extends StatefulWidget {
  const SearchTab({super.key});

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: REdgeInsets.all(AppSize.s16),
        child: Column(
          children: [
            CustomTextFiled(
              controller: controller,
              icon: Icons.search,
              label: 'Search',
              hint: 'Search',
            ),
            SizedBox(height: 300.h),
            Image.asset(ImageAssets.noMoviesImage, height: 124.h, width: 124.w),
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
            //       mainAxisSpacing: 8,
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
