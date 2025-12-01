import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/resources/color_manager.dart';
import 'package:movies_app/core/resources/font_manager.dart';
import 'package:movies_app/core/resources/values_manager.dart';

class UnderlineToggleSwitch extends StatefulWidget {
  const UnderlineToggleSwitch({super.key});

  @override
  State<UnderlineToggleSwitch> createState() => _UnderlineToggleSwitchState();
}

class _UnderlineToggleSwitchState extends State<UnderlineToggleSwitch> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedPositioned(
          duration: const Duration(milliseconds: 300),
          left: _currentIndex == 0 ? 0 : MediaQuery.of(context).size.width / 2,
          bottom: 0,
          child: Container(
            width: MediaQuery.of(context).size.width / 2,
            height: 3,
            color: ColorManager.yellow,
          ),
        ),
        Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () => setState(() => _currentIndex = 0),
                child: Container(
                  color: Colors.transparent,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.list,
                          color: ColorManager.yellow,
                          size: AppSize.s30,
                        ),
                        Text(
                          'Watch List',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: FontSize.s16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 32.h,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () => setState(() => _currentIndex = 1),
                child: Container(
                  color: Colors.transparent,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.folder,
                          color: ColorManager.yellow,
                          size: AppSize.s30,
                        ),
                        Text(
                          'History',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: FontSize.s16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 32.h,
                        ),
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
