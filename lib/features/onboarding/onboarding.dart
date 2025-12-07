import 'package:flutter/material.dart';
import 'package:movies_app/core/resources/colors_manager.dart';
import 'package:movies_app/features/onboarding/onboarding_model.dart';
import 'package:movies_app/core/routes_manager/routes_manager.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _Onboarding();
}

class _Onboarding extends State<OnboardingView> {
  final PageController _pageController = PageController();
  int _currentPageIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  bool get _isCardOpaque {

    return _currentPageIndex >= 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.black,
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: onboardingData.length,
              onPageChanged: (index) {
                setState(() {
                  _currentPageIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return OnboardingPageContent(
                  data: onboardingData[index],
                  isOpaque: _isCardOpaque,
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 15),
            child: Column(
              children: [
                _currentPageIndex == 0
                    ? _buildFirstPageButtons()
                    : _buildNavigationButtons(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFirstPageButtons() {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () => _pageController.nextPage(
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeIn,
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor:  ColorsManager.yellow,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
            child:  Text('Explore Now', style: TextStyle(color: ColorsManager.black, fontSize: 18)),
          ),
        ),
      ],
    );
  }


  Widget _buildNavigationButtons() {
    if (_currentPageIndex == onboardingData.length - 1) {
      return Column(
        children: [

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, RoutesManager.login);              },
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorsManager.yellow,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              child:  Text('Finish', style: TextStyle(color: ColorsManager.black, fontSize: 18)),
            ),
          ),
           SizedBox(height: 15),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => _pageController.previousPage(
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeIn,
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorsManager.black,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side:  BorderSide(color: ColorsManager.yellow, width: 1.5),
                ),
              ),
              child:  Text('Back', style: TextStyle(color: ColorsManager.yellow, fontSize: 18)),
            ),
          ),
        ],
      );
    }


    bool showBackButton = _currentPageIndex >= 2;

    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              _pageController.nextPage(
                duration:  Duration(milliseconds: 400),
                curve: Curves.easeIn,
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorsManager.yellow,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
            child:  Text('Next', style: TextStyle(color: ColorsManager.black, fontSize: 18)),
          ),
        ),
        if (showBackButton) ...[
           SizedBox(height: 15),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () => _pageController.previousPage(
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeIn,
              ),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                side:  BorderSide(color: ColorsManager.yellow),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              child:  Text('Back', style: TextStyle(color:ColorsManager.yellow, fontSize: 18)),
            ),
          ),
        ],
      ],
    );
  }
}
class OnboardingPageContent extends StatelessWidget {
  final OnboardingModel data;
  final bool isOpaque;

  const OnboardingPageContent({
    super.key,
    required this.data,
    this.isOpaque = false,
  });

  @override
  Widget build(BuildContext context) {
    final BoxDecoration cardDecoration = isOpaque
        ? BoxDecoration(
      color: ColorsManager.black,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
    )
        : BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Colors.transparent,
          Colors.black.withOpacity(0.9),
          ColorsManager.black,
        ],
        stops:  [0.0, 0.7, 1.0],
      ),
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
    );

    return Stack(
      children: [
        Image.asset(
          data.imagePath,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(

            padding:  EdgeInsets.only(top: 30, left: 30, right: 30, bottom: 0),
            decoration: cardDecoration,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [

                Text(
                  data.title,
                  textAlign: TextAlign.center,
                  style:  TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: ColorsManager.white,
                  ),
                ),
                 SizedBox(height: 8),
                if (data.description.isNotEmpty)
                  Text(
                    data.description,
                    textAlign: TextAlign.center,
                    style:  TextStyle(
                      fontSize: 16,
                      color: ColorsManager.white,
                    ),
                  ),
                 SizedBox(height: 25),
              ],
            ),
          ),
        ),
      ],
    );
  }
}