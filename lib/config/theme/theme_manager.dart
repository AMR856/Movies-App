import 'package:flutter/material.dart';
import 'package:movies_app/core/resources/color_manager.dart';
import 'package:movies_app/core/resources/values_manager.dart';

class ThemeManager {
  static final ThemeData light = ThemeData(
    scaffoldBackgroundColor: ColorManager.primary,
    appBarTheme: AppBarTheme(
      backgroundColor: ColorManager.primary,
      foregroundColor: ColorManager.yellow,
      titleTextStyle: TextStyle(
        fontSize: AppSize.s16,
        fontWeight: FontWeight.w400,
        color: ColorManager.yellow,
      ),
    ),

    // appBarTheme: AppBarTheme(
    //   backgroundColor: ColorsManager.whiteBlue,
    //   titleTextStyle: GoogleFonts.inter(
    //     color: ColorsManager.blue,
    //     fontSize: 25,
    //   ),
    //   centerTitle: true,
    //   foregroundColor: ColorsManager.blue,
    // ),
    // bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    //   backgroundColor: ColorsManager.blue,
    //   type: BottomNavigationBarType.fixed,
    //   elevation: 0,
    //   selectedItemColor: ColorsManager.white,
    //   unselectedItemColor: ColorsManager.white,
    // ),
    // floatingActionButtonTheme: const FloatingActionButtonThemeData(
    //   backgroundColor: ColorsManager.blue,
    //   foregroundColor: ColorsManager.white,
    //   shape: StadiumBorder(
    //     side: BorderSide(color: ColorsManager.white, width: 4),
    //   ),
    // ),
    // inputDecorationTheme: InputDecorationTheme(
    //   enabledBorder: OutlineInputBorder(
    //     borderRadius: BorderRadius.circular(14.r),
    //     borderSide: BorderSide(color: ColorsManager.grey, width: 1.w),
    //   ),
    //   focusedBorder: OutlineInputBorder(
    //     borderRadius: BorderRadius.circular(14.r),
    //     borderSide: BorderSide(color: ColorsManager.blue, width: 1.w),
    //   ),
    //   errorBorder: OutlineInputBorder(
    //     borderRadius: BorderRadius.circular(14.r),
    //     borderSide: BorderSide(color: ColorsManager.red, width: 1.w),
    //   ),
    //   focusedErrorBorder: OutlineInputBorder(
    //     borderRadius: BorderRadius.circular(14.r),
    //     borderSide: BorderSide(color: ColorsManager.red, width: 1.w),
    //   ),
    //   labelStyle: GoogleFonts.inter(
    //     fontSize: 14.sp,
    //     fontWeight: FontWeight.w500,
    //     color: ColorsManager.grey,
    //   ),
    //   prefixIconColor: ColorsManager.grey,
    //   suffixIconColor: ColorsManager.grey,
    // ),
    // elevatedButtonTheme: ElevatedButtonThemeData(
    //   style: ElevatedButton.styleFrom(
    //     shape: RoundedRectangleBorder(
    //       borderRadius: BorderRadius.circular(16.r),
    //     ),
    //     padding: REdgeInsets.symmetric(vertical: 16),
    //     backgroundColor: ColorsManager.blue,
    //     foregroundColor: ColorsManager.white,
    //     textStyle: GoogleFonts.inter(
    //       fontSize: 20.sp,
    //       fontWeight: FontWeight.w500,
    //       color: ColorsManager.whiteBlue,
    //     ),
    //   ),
    // ),
    // outlinedButtonTheme: OutlinedButtonThemeData(
    //   style: OutlinedButton.styleFrom(
    //     padding: REdgeInsets.symmetric(vertical: 16),
    //     side: const BorderSide(color: ColorsManager.blue, width: 1),
    //     shape: RoundedRectangleBorder(
    //       borderRadius: BorderRadius.circular(16.r),
    //     ),
    //   ),
    // ),
    // textTheme: TextTheme(
    //   headlineSmall: GoogleFonts.inter(
    //     fontSize: 14.sp,
    //     fontWeight: FontWeight.w400,
    //     color: ColorsManager.white,
    //   ),
    //   headlineMedium: GoogleFonts.inter(
    //     fontSize: 14.sp,
    //     fontWeight: FontWeight.w700,
    //     color: ColorsManager.blue,
    //   ),
    //   headlineLarge: GoogleFonts.inter(
    //     fontSize: 24.sp,
    //     fontWeight: FontWeight.bold,
    //     color: ColorsManager.white,
    //   ),
    //   titleMedium: GoogleFonts.inter(
    //     fontSize: 14.sp,
    //     fontWeight: FontWeight.bold,
    //     color: ColorsManager.black1c,
    //   ),
    //   bodySmall: GoogleFonts.inter(
    //     fontSize: 16.sp,
    //     fontWeight: FontWeight.w500,
    //     color: ColorsManager.black1c,
    //   ),
    //   bodyLarge: GoogleFonts.inter(
    //     fontSize: 20.sp,
    //     fontWeight: FontWeight.bold,
    //     color: ColorsManager.blue,
    //   ),
    //   titleLarge: GoogleFonts.inter(
    //     fontSize: 20.sp,
    //     fontWeight: FontWeight.bold,
    //     color: ColorsManager.black1c,
    //   ),
    // ),
  );
  static final ThemeData dark = ThemeData();
}
