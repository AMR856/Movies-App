import 'package:flutter/material.dart';
import 'package:movies_app/core/resources/assets_manager.dart';
import 'package:movies_app/core/resources/colors_manager.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  ColorsManager.black,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon:  Icon(Icons.arrow_back,
                          color: ColorsManager.yellow, ),
                    ),
                  ),
                  const Text(
                    "Forget Password",
                    style: TextStyle(
                      color: ColorsManager.yellow,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
             SizedBox(height: 10),
            SizedBox(
              height: 250,
              child: Image(
                image: AssetImage(ImageAssets.forgetPassword),
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: BoxDecoration(
                  color:  ColorsManager.grey,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child:  TextField(
                  style: TextStyle(color: ColorsManager.white),
                  decoration: InputDecoration(
                    icon: Icon(Icons.email, color: ColorsManager.white),
                    hintText: "Email",
                    hintStyle: TextStyle(color: ColorsManager.white),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),

            SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorsManager.yellow,
                    foregroundColor: ColorsManager.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {},
                  child:  Text(
                    "Verify Email",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),

             Spacer(),
          ],
        ),
      ),
    );
  }
}
