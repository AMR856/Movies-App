import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/resources/assets_manager.dart';
import 'package:movies_app/core/resources/color_manager.dart';
import 'package:movies_app/core/resources/font_manager.dart';
import 'package:movies_app/core/resources/values_manager.dart';
import 'package:movies_app/core/widgets/custom_elevated_button.dart';
import 'package:movies_app/core/widgets/custom_movie_item.dart';
import 'package:movies_app/feature/movie_details/models/character_model.dart';
import 'package:movies_app/feature/movie_details/widgets/custom_button_details.dart';
import 'package:movies_app/feature/movie_details/widgets/custom_cast_item.dart';

class MovieDetails extends StatelessWidget {
  MovieDetails({super.key});
  List<String> imagePathList = [
    ImageAssets.imageDetails1,
    ImageAssets.imageDetails2,
    ImageAssets.imageDetails3,
  ];
  List<CharacterModel> castList = [
    CharacterModel(
      name: 'Hayley Atwell',
      character: 'Captain Carter',
      imagePath: ImageAssets.character1,
    ),
    CharacterModel(
      name: 'Elizabeth Olsen',
      character: 'Wanda Maximoff / The Scarlet Witch',
      imagePath: ImageAssets.character2,
    ),
    CharacterModel(
      name: 'Rachel McAdams',
      character: 'Christine Palmer',
      imagePath: ImageAssets.character3,
    ),
    CharacterModel(
      name: 'Charlize Theron',
      character: 'Clea',
      imagePath: ImageAssets.character4,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: REdgeInsets.symmetric(horizontal: 16, vertical: 25),
              height: 766.h,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  colorFilter: ColorFilter.srgbToLinearGamma(),
                  image: AssetImage(ImageAssets.testDoctorStrange),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          size: 29,
                          Icons.arrow_back_ios,
                          color: ColorManager.white,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          size: 29,
                          Icons.bookmark,
                          color: ColorManager.white,
                        ),
                      ),
                    ],
                  ),
                  Image.asset(
                    ImageAssets.stopMovie,
                    height: 97.h,
                    width: 97.w,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        textAlign: TextAlign.center,
                        'Doctor Strange in the Multiverse of Madness',
                        style: TextStyle(
                          color: ColorManager.white,
                          fontSize: AppSize.s24.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        textAlign: TextAlign.center,
                        '2022',
                        style: TextStyle(
                          color: ColorManager.white.withValues(alpha: 0.5),
                          fontSize: AppSize.s20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      CustomElevatedButton(
                        horizontal: 0,
                        text: 'Watch',
                        bgColor: ColorManager.red,
                        fgColor: ColorManager.white,
                        onPressed: () {},
                      ),
                      Padding(
                        padding: REdgeInsets.only(top: AppPadding.p16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomButtonDetails(
                              icon: Icons.favorite,
                              text: '15',
                            ),
                            CustomButtonDetails(
                              icon: Icons.access_time_filled_rounded,
                              text: '90',
                            ),
                            CustomButtonDetails(
                              icon: Icons.star,
                              text: '7.6',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: REdgeInsets.all(AppPadding.p16),
              color: Colors.black54,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Screen Shots',
                    style: TextStyle(
                      color: ColorManager.white,
                      fontSize: AppSize.s24.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ListView.separated(
                    padding: REdgeInsets.symmetric(vertical: AppPadding.p8),
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) => ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(16),
                      child: Image.asset(imagePathList[index]),
                    ),
                    separatorBuilder: (context, index) => SizedBox(
                      height: 13,
                    ),
                    itemCount: imagePathList.length,
                  ),
                  Text(
                    'Similar',
                    style: TextStyle(
                      color: ColorManager.white,
                      fontSize: AppSize.s24.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GridView.builder(
                    padding: REdgeInsets.symmetric(vertical: AppPadding.p12),
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return CustomMovieItem();
                    },
                    itemCount: 4,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.70,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 12,
                        ),
                  ),
                  Text(
                    'Summary',
                    style: TextStyle(
                      color: ColorManager.white,
                      fontSize: AppSize.s24.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Following the events of Spider-Man No Way Home, Doctor Strange unwittingly casts a forbidden spell that accidentally opens up the multiverse. With help from Wong and Scarlet Witch, Strange confronts various versions of himself as well as teaming up with the young America Chavez while traveling through various realities and working to restore reality as he knows it. Along the way, Strange and his allies realize they must take on a powerful new adversary who seeks to take over the multiverse.—Blazer346',
                    style: TextStyle(
                      color: ColorManager.white,
                      fontSize: AppSize.s14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    '\nCast',
                    style: TextStyle(
                      color: ColorManager.white,
                      fontSize: AppSize.s24.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ListView.separated(
                    padding: REdgeInsets.symmetric(vertical: AppPadding.p12),
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: castList.length,
                    itemBuilder: (context, index) =>
                        CustomCastItem(chraModel: castList[index]),
                    separatorBuilder: (context, index) => SizedBox(
                      height: 10.h,
                    ),
                  ),
                  Text(
                    'Genres',
                    style: TextStyle(
                      color: ColorManager.white,
                      fontSize: AppSize.s24.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GridView.builder(
                    padding: REdgeInsets.symmetric(vertical: AppPadding.p12),
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return CustomElevatedButton(
                        text: 'Adventure',
                        horizontal: AppPadding.p12,
                        bgColor: ColorManager.grey,
                        fgColor: Colors.white,
                        fontSize: FontSize.s16.sp,
                        fontWeight: FontWeight.w400,
                        onPressed: () {},
                      );
                    },
                    itemCount: 4,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: 8 / 3.5,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 12,
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
