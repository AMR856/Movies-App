import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/resources/assets_manager.dart';
import 'package:movies_app/core/resources/color_manager.dart';
import 'package:movies_app/core/resources/values_manager.dart';
import 'package:movies_app/core/widgets/custom_elevated_button.dart';
import 'package:movies_app/core/widgets/custom_text_filed.dart';
import 'package:movies_app/features/update_profile/data/models/update_profile_request.dart';
import 'package:movies_app/features/update_profile/presentation/cubit/avatar_cubit.dart';
import 'package:movies_app/features/update_profile/presentation/cubit/update_profile_cubit.dart';
import 'package:movies_app/features/update_profile/presentation/utils/show_bottom_sheet.dart';
import 'package:movies_app/features/update_profile/presentation/utils/validators.dart';
import 'package:movies_app/features/update_profile/presentation/widgets/loading.dart';

import 'widgets/toasts.dart';

class UpdateProfile extends StatefulWidget {
  UpdateProfile({super.key});

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  bool _loadedArgs = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_loadedArgs) {
      final args =
          ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

      nameController.text = args['name'] ?? "";
      phoneController.text = args['phone'] ?? "";

      context.read<AvatarCubit>().selectAvatar((args['avatarId'] ?? 1) - 1);

      _loadedArgs = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdateProfileCubit, UpdateProfileState>(
      listener: (context, state) async {
        if (state is UpdateProfileLoading || state is DeleteProfileLoading) {
          Loading.showLoading(context);
        } else {
          Loading.stopLoading(context);
        }

        if (state is UpdateProfileSuccess) {
          Toasts.showToast(ColorManager.green, "Profile updated successfully");
          Navigator.pop(context);
        }

        if (state is DeleteProfileSuccess) {
          Toasts.showToast(ColorManager.red, "Account deleted successfully");
          Navigator.pop(context);
        }

        if (state is UpdateProfileError) {
          Toasts.showToast(ColorManager.red, state.message);
        }
        if (state is DeleteProfileError) {
          Toasts.showToast(ColorManager.red, state.message);
        }
      },
      builder: (context, state) {
        return Form(
          key: formKey,
          child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              leading: InkWell(
                onTap: () => Navigator.pop(context),
                child: Image.asset(IconsAssets.icon5Arrow),
              ),
              title: const Text('Update Profile'),
              centerTitle: true,
            ),
            body: Padding(
              padding: REdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  BlocBuilder<AvatarCubit, int>(
                    builder: (context, selectedAvatarIndex) {
                      return CircleAvatar(
                        radius: 80.r,
                        backgroundColor: ColorManager.primary,
                        child: GestureDetector(
                          onTap: () => showBottomSheetFunction(context),
                          child: Image.asset(
                            AvatarCubit.imagesPathAvatar[selectedAvatarIndex],
                            fit: BoxFit.fill,
                          ),
                        ),
                      );
                    },
                  ),

                  SizedBox(height: 20.h),

                  CustomTextFiled(
                    controller: nameController,
                    icon: CupertinoIcons.person_fill,
                    validator: Validator.validateName,
                  ),

                  SizedBox(height: 20.h),

                  CustomTextFiled(
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    icon: CupertinoIcons.phone_fill,
                    validator: Validator.validatePhone,
                  ),

                  const Spacer(),

                  CustomElevatedButton(
                    bgColor: ColorManager.red,
                    fgColor: ColorManager.white,
                    fontSize: AppSize.s20.sp,
                    fontWeight: FontWeight.w400,
                    onPressed: () {
                      context.read<UpdateProfileCubit>().deleteProfile();
                    },
                    horizontal: 0,
                    text: 'Delete Account',
                  ),

                  SizedBox(height: 20.h),

                  BlocBuilder<AvatarCubit, int>(
                    builder: (context, selectedAvatarIndex) {
                      return CustomElevatedButton(
                        bgColor: ColorManager.yellow,
                        fgColor: ColorManager.primary,
                        fontSize: AppSize.s20.sp,
                        fontWeight: FontWeight.w400,
                        horizontal: 0,
                        text: 'Update Data',
                        onPressed: () {
                          if (!formKey.currentState!.validate()) return;

                          final request = UpdateProfileRequest(
                            name: nameController.text,
                            phone: phoneController.text,
                            avatarId: context.read<AvatarCubit>().state + 1,
                            email: 'amer.live477@gmail.com',
                          );

                          context.read<UpdateProfileCubit>().updateProfile(
                            request,
                          );
                        },
                      );
                    },
                  ),

                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
