import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import '../../auth/widgets/auth_header.dart';
import '../../../widgets/progress_button.dart';

import '../../../widgets/phone_text_form_field.dart';
import '../controllers/forget_password_controller.dart';

class ForgetPasswordView extends GetView<ForgetPasswordController> {
  const ForgetPasswordView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ForgetPasswordController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(),
          body: Form(
            key: controller.forgetPasswordKey,
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const AuthHeader(
                          title: "Forgot password?",
                          subTitle:
                              "Enter your email address and we’ll send you confirmation code to reset your password",
                        ),
                        SizedBox(height: 20.h),
                        PhoneTextFormField(
                          controller: controller.phoneController,
                          hintText: "Enter your phone number",
                          name: "Phone Number",
                        ),
                      ],
                    ).paddingSymmetric(
                      horizontal: 20.w,
                      vertical: 20.h,
                    ),
                  ),
                ),
                AppProgressButton(
                  onPressed: (anim) {
                    controller.sendOtpCode();
                  },
                  text: "Continue",
                ).paddingSymmetric(
                  horizontal: 20.w,
                  vertical: 20.h,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
