import 'package:flutter/material.dart';
import 'package:movies_app/core/models/onboarding_model.dart';
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
      backgroundColor: Colors.black,
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
              backgroundColor: const Color(0xFFFFCC00),
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
            child: const Text('Explore Now', style: TextStyle(color: Colors.black, fontSize: 18)),
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
                Navigator.pushReplacementNamed(context, RoutesManager.login);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFFCC00),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              child: const Text('Finish', style: TextStyle(color: Colors.black, fontSize: 18)),
            ),
          ),
          const SizedBox(height: 15),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => _pageController.previousPage(
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeIn,
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: const BorderSide(color: Color(0xFFFFCC00), width: 1.5),
                ),
              ),
              child: const Text('Back', style: TextStyle(color: Color(0xFFFFCC00), fontSize: 18)),
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
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeIn,
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFFCC00),
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
            child: const Text('Next', style: TextStyle(color: Colors.black, fontSize: 18)),
          ),
        ),
        if (showBackButton) ...[
          const SizedBox(height: 15),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () => _pageController.previousPage(
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeIn,
              ),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                side: const BorderSide(color: Color(0xFFFFCC00)),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              child: const Text('Back', style: TextStyle(color: Color(0xFFFFCC00), fontSize: 18)),
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
      color: Colors.black,
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
          Colors.black,
        ],
        stops: const [0.0, 0.7, 1.0],
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

            padding: const EdgeInsets.only(top: 30, left: 30, right: 30, bottom: 0),
            decoration: cardDecoration, // استخدام الـ BoxDecoration المحدد
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [

                Text(
                  data.title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                if (data.description.isNotEmpty)
                  Text(
                    data.description,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  ),
                const SizedBox(height: 25),
              ],
            ),
          ),
        ),
      ],
    );
  }
}