import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/resources/color_manager.dart';
import 'package:movies_app/core/resources/font_manager.dart';
import 'package:movies_app/core/resources/values_manager.dart';
class UnderlineToggleSwitch extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onChanged;

  const UnderlineToggleSwitch({
    super.key,
    required this.currentIndex,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedPositioned(
          duration: const Duration(milliseconds: 300),
          left: currentIndex == 0 ? 0 : MediaQuery.of(context).size.width / 2,
          bottom: 0,
          child: Container(
            width: MediaQuery.of(context).size.width / 2,
            height: 3.h,
            color: ColorManager.yellow,
          ),
        ),
        Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () => onChanged(0),
                child: Container(
                  color: Colors.transparent,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.list, color: ColorManager.yellow, size: AppSize.s30),
                        Text(
                          'Watch List',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: FontSize.s16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 32.h),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () => onChanged(1),
                child: Container(
                  color: Colors.transparent,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.folder, color: ColorManager.yellow, size: AppSize.s30),
                        Text(
                          'History',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: FontSize.s16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 32.h),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

