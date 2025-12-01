import 'package:flutter/material.dart';
import 'package:movies_app/config/theme/theme_manager.dart';
import 'package:movies_app/core/routes_manager/routes_manager.dart';



void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      routes: RoutesManager.Routes(),
      initialRoute: RoutesManager.splashScreen,


    );
  }
}