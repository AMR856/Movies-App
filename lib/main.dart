import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:movies_app/core/routes_manager/routes_manager.dart';
import 'package:movies_app/utils/auth_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthController()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: RoutesManager.Routes(),

      /// 🔥 أهم تعديل
      initialRoute: RoutesManager.splashScreen,
    );
  }
}
