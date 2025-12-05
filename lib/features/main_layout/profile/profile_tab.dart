import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/resources/assets_manager.dart';
import 'package:movies_app/core/resources/color_manager.dart';
import 'package:movies_app/core/resources/font_manager.dart';
import 'package:movies_app/core/routes_manager/route_manager.dart';
import 'package:movies_app/core/widgets/custom_elevated_button.dart';
import 'package:movies_app/features/main_layout/profile/widget/custom_toggle.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: ColorManager.grey,
                height: 405.h,
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 20.h,
                    left: 16.w,
                    right: 16.w,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Container(
                                  width: 120.w,
                                  height: 120.h,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: ColorManager.yellow,
                                      width: 2,
                                    ),
                                  ),
                                  child: CircleAvatar(
                                    radius: 58.r,
                                    backgroundImage: AssetImage(
                                      ImageAssets.avatarProfile,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10.h),
                                Text(
                                  'Ahmed Moo',
                                  style: TextStyle(
                                    color: ColorManager.white,
                                    fontSize: FontSize.s18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '12',
                                  style: TextStyle(
                                    color: ColorManager.yellow,
                                    fontSize: FontSize.s36,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 5.h),
                                Text(
                                  'Wish List',
                                  style: TextStyle(
                                    color: ColorManager.white,
                                    fontSize: FontSize.s14,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '10',
                                  style: TextStyle(
                                    color: ColorManager.yellow,
                                    fontSize: FontSize.s36,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 5.h),
                                Text(
                                  'History',
                                  style: TextStyle(
                                    color: ColorManager.white,
                                    fontSize: FontSize.s14,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 35.h),
                      SizedBox(
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: CustomElevatedButton(
                                text: 'Edit Profile',
                                bgColor: ColorManager.yellow,
                                fgColor: ColorManager.primary,
                                onPressed: () {
                                  Navigator.pushNamed(
                                    context,
                                    RoutesManager.updateProfile,
                                  );
                                },
                                horizontal: 20,
                              ),
                            ),
                            SizedBox(width: 10.w),
                            Flexible(
                              child: CustomElevatedButton(
                                text: 'Exit',
                                bgColor: ColorManager.red,
                                fgColor: ColorManager.white,
                                onPressed: () {},
                                isIcon: true,
                                horizontal: 20,
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 35.h),
                      SizedBox(
                        width: double.infinity,
                        child: UnderlineToggleSwitch(),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 50.h),

              _buildEmptyState(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Column(
      children: [
        Container(
          width: 150.w,
          height: 150.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: ColorManager.grey.withOpacity(0.3),
          ),
          child: Center(
            child: Image.asset(
              ImageAssets.noMoviesImage,
              height: 100.h,
              width: 100.w,
            ),
          ),
        ),
        SizedBox(height: 20.h),
        Text(
          'Your list is empty',
          style: TextStyle(
            color: ColorManager.white,
            fontSize: FontSize.s20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.w),
          child: Text(
            'Start adding movies to your wish list or check your history',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: ColorManager.white.withOpacity(0.7),
              fontSize: FontSize.s14,
            ),
          ),
        ),
      ],
    );
  }
}
