import 'package:flutter/material.dart';
import 'package:movies_app/core/resources/colors_manager.dart';
import 'package:movies_app/core/routes_manager/routes_manager.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),color: ColorsManager.yellow,
          onPressed: () {
            Navigator.pushNamed(context,RoutesManager.login); // 🔙 يرجع خطوة للخلف
          },
        ),
        title: const Text("Home Tab"),
      ),
      body: const Center(
        child: Text(
          "Home Tab Screen",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
