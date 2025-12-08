import 'package:flutter/material.dart';
import 'package:movies_app/core/prefs/prefs_manager.dart';
import 'package:movies_app/core/resources/assets_manager.dart';
import 'package:movies_app/core/routes_manager/routes_manager.dart';

import 'dart:async';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigate();
  }

  Future<void> _navigate() async {
    await Future.delayed(const Duration(seconds: 2));

    final token = PrefsManager.getToken();

    if (!mounted) return;

    if (token != null && token.isNotEmpty) {
      Navigator.pushReplacementNamed(context, RoutesManager.mainLayout);
    } else {
      Navigator.pushReplacementNamed(context, RoutesManager.login);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(height: 30),

            Expanded(
              child: Center(
                child: Image.asset(
                  ImageAssets.movieLogo,
                  width: 250,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(bottom: 25),
              child: Column(
                children: [
                  Image.asset(
                    ImageAssets.routeLogo,
                    width: 120,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Supervised by Mohamed Nabil",
                    style: TextStyle(
                      color: Colors.white54,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
