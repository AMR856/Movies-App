import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/resources/assets_manager.dart';
import 'package:movies_app/core/resources/color_manager.dart';
import 'package:movies_app/core/resources/font_manager.dart';
import 'package:movies_app/core/resources/values_manager.dart';
import 'package:movies_app/core/routes_manager/route_manager.dart';
import 'package:movies_app/core/widgets/custom_elevated_button.dart';
<<<<<<< HEAD:lib/feature/main_layout/profile/profile_tab.dart
import 'package:movies_app/feature/main_layout/profile/widget/custom_toggle.dart';
=======
import 'package:movies_app/core/widgets/custom_movie_item.dart';
import 'package:movies_app/features/main_layout/profile/widget/custom_toggle.dart';
>>>>>>> 9e6d2ce8114061c6dbb3c988c0567d21e88e826f:lib/features/main_layout/profile/profile_tab.dart

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: ColorManager.grey,
              height: 389.h,
              width: double.infinity,
              child: Padding(
                padding: REdgeInsets.only(left: 6, right: 6, top: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            CircleAvatar(
                              radius: AppSize.s60.r,
                              backgroundImage: AssetImage(
                                ImageAssets.avatarProfile,
                              ),
                            ),
                            SizedBox(height: AppSize.s14.h),
                            Text(
                              'Ahmed Moo',
                              style: TextStyle(
                                color: ColorManager.white,
                                fontSize: FontSize.s20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              '12',
                              style: TextStyle(
                                color: ColorManager.white,
                                fontSize: FontSize.s36,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: AppSize.s14.h),
                            Text(
                              'Wish List',
                              style: TextStyle(
                                color: ColorManager.white,
                                fontSize: FontSize.s20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              '10',
                              style: TextStyle(
                                color: ColorManager.white,
                                fontSize: FontSize.s36,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: AppSize.s14.h),
                            Text(
                              'History',
                              style: TextStyle(
                                color: ColorManager.white,
                                fontSize: FontSize.s20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 23.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomElevatedButton(
                          text: 'Edit Profile',
                          bgColor: ColorManager.yellow,
                          fgColor: ColorManager.primary,
                          horizontal: 60,
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              RoutesManager.updateProfile,
                            );
                          },
                        ),
                        CustomElevatedButton(
                          text: 'Exit',
                          bgColor: ColorManager.red,
                          fgColor: ColorManager.white,
                          horizontal: 39,
                          onPressed: () {},
                          isIcon: true,
                        ),
                      ],
                    ),
                    SizedBox(height: 30.h),
                    UnderlineToggleSwitch(),
                  ],
                ),
              ),
            ),
            SizedBox(height: 169.h),
            Image.asset(ImageAssets.noMoviesImage, height: 124.h, width: 124.w),
            // GridView.builder(
            //   physics: NeverScrollableScrollPhysics(),
            //   shrinkWrap: true,
            //   padding: REdgeInsets.all(16),
            //   scrollDirection: Axis.vertical,
            //   itemBuilder: (context, index) {
            //     return CustomMovieItem(
            //       height: 180,
            //       width: 122,
            //     );
            //   },
            //   itemCount: 12,
            //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //     crossAxisCount: 3,
            //     childAspectRatio: 0.70,
            //     mainAxisSpacing: 10,
            //     crossAxisSpacing: 12,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
