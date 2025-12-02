import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/resources/assets_manager.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:movies_app/core/resources/color_manager.dart';
import 'package:movies_app/core/widgets/custom_movie_item.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              height: 600.h,
              width: double.infinity,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  ShaderMask(
                    shaderCallback: (bounds) {
                      return LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black,
                        ],
                        stops: [0.0, 0.9],
                      ).createShader(bounds);
                    },
                    blendMode: BlendMode.darken,
                    child: Image.asset(
                      ImageAssets.testmovie1917,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Image.asset(
                        ImageAssets.testAvailableNow,
                        height: 93.h,
                        width: 267.w,
                      ),
                      Expanded(
                        child: CarouselSlider(
                          options: CarouselOptions(
                            aspectRatio: 1,
                            enlargeCenterPage: true,
                            enlargeFactor: 0.4,
                            viewportFraction: 0.42,
                          ),
                          items: [
                            CustomMovieItem(),
                            CustomMovieItem(),
                            CustomMovieItem(),
                            CustomMovieItem(),
                          ],
                        ),
                      ),
                      Image.asset(
                        ImageAssets.testWatchNow,
                        height: 146.h,
                        width: 354.w,
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: REdgeInsets.only(left: 16),
              color: Colors.black87,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Action',
                        style: TextStyle(color: ColorManager.white),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Row(
                          children: [
                            Text(
                              'See More',
                              style: TextStyle(color: ColorManager.yellow),
                            ),
                            Icon(
                              Icons.arrow_forward,
                              color: ColorManager.yellow,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 220.h,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => CustomMovieItem(
                        height: 220,
                        width: 146,
                      ),
                      itemCount: 6,
                      separatorBuilder: (context, index) => SizedBox(
                        width: 16.w,
                      ),
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
