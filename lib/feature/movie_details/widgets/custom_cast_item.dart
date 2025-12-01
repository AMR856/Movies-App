
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/resources/color_manager.dart';
import 'package:movies_app/core/resources/values_manager.dart';
import 'package:movies_app/feature/movie_details/models/character_model.dart';

class CustomCastItem extends StatelessWidget {
  const CustomCastItem({
    super.key,
    required this.chraModel,
  });
  final CharacterModel chraModel;
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
          Image.asset(chraModel.imagePath),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    overflow: TextOverflow.ellipsis,
                    'Name: ${chraModel.name}',
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
                    'Character: ${chraModel.character}',
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
