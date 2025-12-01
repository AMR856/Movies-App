import 'package:flutter/material.dart';
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


    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, RoutesManager.onboarding);
    });
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
                child: Image.asset(ImageAssets.movieLogo,

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
