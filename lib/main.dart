import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/config/theme/theme_manager.dart';
import 'package:movies_app/core/routes_manager/route_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          theme: ThemeManager.light,
          themeMode: ThemeMode.light,
          title: 'Movies App',
          debugShowCheckedModeBanner: false,
          supportedLocales: const [Locale('en'), Locale('ar')],
          onGenerateRoute: RouteGenerator.getRoute,
          initialRoute: RoutesManager.mainLayout,
        );
      },
    );
  }
}
