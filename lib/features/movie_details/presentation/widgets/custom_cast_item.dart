import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/resources/color_manager.dart';
import 'package:movies_app/core/resources/values_manager.dart';
<<<<<<<< HEAD:lib/features/movie_details/widgets/custom_cast_item.dart
import 'package:movies_app/features/movie_details/models/character_model.dart';
========
import 'package:movies_app/features/movie_details/domain/entities/cast_entity.dart';
>>>>>>>> feature/home_screen:lib/features/movie_details/presentation/widgets/custom_cast_item.dart

class CustomCastItem extends StatelessWidget {
  const CustomCastItem({
    super.key,
    required this.castEntity,
  });
  final CastEntity castEntity;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 92.h,
      padding: REdgeInsets.all(AppPadding.p14),
      decoration: BoxDecoration(
        color: ColorManager.grey,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        spacing: 10,
        children: [
          Image.network(castEntity.urlSmallImage),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    overflow: TextOverflow.ellipsis,
                    'Name: ${castEntity.name}',
                    style: TextStyle(
                      fontSize: AppSize.s20.sp,
                      fontWeight: FontWeight.w400,
                      color: ColorManager.white,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    overflow: TextOverflow.ellipsis,
                    'Character: ${castEntity.characterName}',
                    style: TextStyle(
                      fontSize: AppSize.s20.sp,
                      fontWeight: FontWeight.w400,
                      color: ColorManager.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
