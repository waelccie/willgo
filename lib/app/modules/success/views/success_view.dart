import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:willgo/core/extensions/build_context.dart';

import '../../../../core/constants/theme/colors_manager.dart';
import '../../../../core/enums/enums.dart';
import '../../../../gen/assets.gen.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/progress_button.dart';
import '../controllers/success_controller.dart';

class SuccessView extends GetView<SuccessController> {
  const SuccessView({super.key});
  @override
  Widget build(BuildContext context) {
    String title;
    String message;
    if (controller.successType == SuccessType.verifyPhone) {
      title = context.translate.verify_email_success_title;
      message = context.translate.verify_email_success_body;
    } else if (controller.successType == SuccessType.resetPassword) {
      title = context.translate.reset_password_success_title;
      message = context.translate.reset_password_success_body;
    } else if (controller.successType == SuccessType.changePassword) {
      title = context.translate.change_password_success_title;
      message = context.translate.change_password_success_subtitle;
    } else if (controller.successType == SuccessType.createOrder) {
      title = context.translate.thank_you;
      message = context.translate.order_success_subtitle;
    } else {
      title = "";
      message = "";
    }
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 40.h),
              Assets.images.success.svg(),
              SizedBox(height: 100.h),
              Text(
                title,
                textAlign: TextAlign.center,
                style: GoogleFonts.openSans(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                message,
                textAlign: TextAlign.center,
                style: GoogleFonts.openSans(
                  color: ColorsManager.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 20.h),
              AppProgressButton(
                text: context.translate.continue_title,
                onPressed: (anim) {
                  if (controller.successType == SuccessType.verifyPhone) {
                    Get.offAllNamed(Routes.NAV_SCREEN);
                  } else if (controller.successType ==
                      SuccessType.changePassword) {
                    Get.offAllNamed(Routes.NAV_SCREEN);
                  } else if (controller.successType ==
                      SuccessType.createOrder) {
                    Get.offAllNamed(Routes.NAV_SCREEN);
                  } else if (controller.successType ==
                      SuccessType.resetPassword) {
                    Get.offAllNamed(Routes.AUTH);
                  }
                },
              ),
            ],
          ).paddingSymmetric(horizontal: 20.w),
        ),
      ),
    );
  }
}
