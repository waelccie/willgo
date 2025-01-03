import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:willgo/core/extensions/build_context.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/progress_button.dart';
import '../../../../core/constants/theme/colors_manager.dart';
import '../../../../gen/assets.gen.dart';

import '../controllers/auth_controller.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Assets.images.logo.image(),
          SizedBox(height: 20.h),
          AppProgressButton(
            text: context.translate.login,
            onPressed: (anim) {
              Get.toNamed(Routes.LOGIN);
            },
          ),
          SizedBox(height: 16.h),
          AppProgressButton(
            text: context.translate.register,
            isBordered: true,
            isOutlined: true,
            onPressed: (anim) {
              Get.toNamed(Routes.REGISTER);
            },
          ),
          SizedBox(height: 16.h),
          GestureDetector(
            onTap: () {
              Get.offAndToNamed(Routes.NAV_SCREEN);
            },
            child:  Text(
              context.translate.asaguest,
              style:  TextStyle(
                color: ColorsManager.primary,
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                decoration: TextDecoration.underline,
                decorationColor: ColorsManager.primary,
              ),
            ),
          )
        ],
      ).paddingSymmetric(horizontal: 20.w, vertical: 20.h),
    );
  }
}
