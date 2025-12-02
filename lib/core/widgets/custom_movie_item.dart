import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/resources/assets_manager.dart';
import 'package:movies_app/core/resources/color_manager.dart';
import 'package:movies_app/core/resources/values_manager.dart';
import 'package:movies_app/core/routes_manager/route_manager.dart';

class CustomMovieItem extends StatelessWidget {
  const CustomMovieItem({
    super.key,
    this.height = 279,
    this.width = 189,
  });
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, RoutesManager.movieDetails);
      },
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(16),
            child: Image.asset(
              fit: BoxFit.fill,
              ImageAssets.testmovie1917,
              height: height?.h,
              width: width?.w,
            ),
          ),
          Container(
            height: 28.h,
            width: 58.w,
            margin: REdgeInsets.all(13),
            decoration: BoxDecoration(
              color: ColorManager.primary.withValues(alpha: 0.71),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  '7.7',
                  style: TextStyle(
                    color: ColorManager.white,
                    fontSize: AppSize.s18.sp,
                  ),
                ),
                Icon(
                  Icons.star,
                  color: ColorManager.yellow,
                  size: AppSize.s18.sp,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
