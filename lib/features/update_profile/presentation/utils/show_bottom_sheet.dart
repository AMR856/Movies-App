import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/resources/color_manager.dart';
import 'package:movies_app/core/resources/values_manager.dart';
import 'package:movies_app/features/update_profile/presentation/cubit/avatar_cubit.dart';

void showBottomSheetFunction(BuildContext parentContext) {
  showModalBottomSheet(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
    backgroundColor: Colors.transparent,
    context: parentContext,
    builder: (bottomSheetContext) {
      return AspectRatio(
        aspectRatio: 1,
        child: Padding(
          padding: REdgeInsets.only(left: 16, right: 16, bottom: 20),
          child: Container(
            decoration: BoxDecoration(
              color: ColorManager.grey,
              borderRadius: BorderRadius.circular(24.r),
            ),
            padding: REdgeInsets.all(8),

            child: BlocBuilder<AvatarCubit, int>(
              bloc: parentContext.read<AvatarCubit>(),
              builder: (context, selectedIndex) {
                return GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  padding: REdgeInsets.only(top: 13),
                  itemCount: AvatarCubit.imagesPathAvatar.length,
                  gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 12,
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        parentContext.read<AvatarCubit>().selectAvatar(index);
                        Navigator.pop(parentContext);
                      },
                      child: Container(
                        padding: REdgeInsets.all(AppPadding.p8),
                        decoration: BoxDecoration(
                          color: selectedIndex == index
                              ? ColorManager.yellow.withValues(alpha: 0.56)
                              : ColorManager.grey,
                          borderRadius: BorderRadius.circular(20.r),
                          border: Border.all(color: ColorManager.yellow),
                        ),
                        child: Image.asset(AvatarCubit.imagesPathAvatar[index]),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
      );
    },
  );
}