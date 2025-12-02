import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/resources/assets_manager.dart';
import 'package:movies_app/core/resources/color_manager.dart';
import 'package:movies_app/core/resources/values_manager.dart';
import 'package:movies_app/core/widgets/custom_elevated_button.dart';
import 'package:movies_app/core/widgets/custom_text_filed.dart';

class UpdateProfile extends StatelessWidget {
  UpdateProfile({super.key});
  TextEditingController nameController = TextEditingController(
    text: 'Ahmed Muhamed',
  );
  TextEditingController phoneController = TextEditingController(
    text: '012055545454',
  );
  List<String> imagesPathAvatar = [
    ImageAssets.character1,
    ImageAssets.character2,
    ImageAssets.character3,
    ImageAssets.character4,
    ImageAssets.character5,
    ImageAssets.character6,
    ImageAssets.character7,
    ImageAssets.character8,
    ImageAssets.character9,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Image.asset(IconsAssets.icon5Arrow),
        ),
        title: Text('Pick Avatar'),
        centerTitle: true,
      ),
      body: Padding(
        padding: REdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CircleAvatar(
              radius: 80.r,
              backgroundColor: ColorManager.primary,
              child: GestureDetector(
                onTap: () {
                  showBottomSheet(context);
                },
                child: Image.asset(
                  ImageAssets.character2,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomTextFiled(
              controller: nameController,
              icon: CupertinoIcons.person_fill,
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomTextFiled(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              icon: CupertinoIcons.phone_fill,
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              'Reset Password',
              style: TextStyle(
                color: ColorManager.white,
                fontSize: AppSize.s20.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            Spacer(),
            CustomElevatedButton(
              bgColor: ColorManager.red,
              fgColor: ColorManager.white,
              fontSize: AppSize.s20.sp,
              fontWeight: FontWeight.w400,
              onPressed: () {},
              horizontal: 0,
              text: 'Delete Account',
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomElevatedButton(
              bgColor: ColorManager.yellow,
              fgColor: ColorManager.primary,
              fontSize: AppSize.s20.sp,
              fontWeight: FontWeight.w400,
              onPressed: () {},
              horizontal: 0,
              text: 'Update Data',
            ),
            SizedBox(
              height: 20.h,
            ),
          ],
        ),
      ),
    );
  }

  void showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(8),
      ),
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) => AspectRatio(
        aspectRatio: 1,
        child: Padding(
          padding: REdgeInsets.only(left: 16, right: 16, bottom: 20),
          child: Container(
            decoration: BoxDecoration(
              color: ColorManager.grey,
              borderRadius: BorderRadius.circular(24.r),
            ),
            padding: REdgeInsets.all(8),
            child: GridView.builder(
              physics: BouncingScrollPhysics(),
              padding: REdgeInsets.only(top: 13),
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: REdgeInsets.all(AppPadding.p8),
                    decoration: BoxDecoration(
                      color: imagesPathAvatar[index] == ImageAssets.character2
                          ? ColorManager.yellow.withValues(alpha: 0.56)
                          : ColorManager.grey,
                      borderRadius: BorderRadius.circular(20.r),
                      border: Border.all(color: ColorManager.yellow),
                    ),
                    child: Image.asset(imagesPathAvatar[index]),
                  ),
                );
              },
              itemCount: imagesPathAvatar.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1,
                mainAxisSpacing: 10,
                crossAxisSpacing: 12,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
