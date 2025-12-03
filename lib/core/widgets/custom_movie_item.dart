import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/resources/color_manager.dart';
import 'package:movies_app/core/resources/values_manager.dart';
import 'package:movies_app/core/routes_manager/routes.dart';
import 'package:movies_app/feature/main_layout/home/domain/entities/movies_entity.dart';

class CustomMovieItem extends StatelessWidget {
  const CustomMovieItem({
    super.key,
    this.height = 279,
    this.width = 189,
    required this.moviesEntity,
  });
  final double? height;
  final double? width;
  final MoviesEntity moviesEntity;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Routes.movieDetailsRoute);
      },
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(16),
            child: CachedNetworkImage(
              imageUrl: moviesEntity.largeCoverImage!,
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),

            // Image.network(
            //   fit: BoxFit.fill,
            //   moviesEntity.largeCoverImage!,
            //   height: height?.h,
            //   width: width?.w,
            // ),
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
                  '${moviesEntity.rating}',
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
