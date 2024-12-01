import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:willgo/core/global/validator.dart';
import '../../auth/widgets/auth_header.dart';
import '../../../widgets/custom_text_field.dart';
import '../../../widgets/progress_button.dart';

import '../controllers/reset_password_controller.dart';

class ResetPasswordView extends GetView<ResetPasswordController> {
  const ResetPasswordView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ResetPasswordController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Reset Password'),
            centerTitle: true,
          ),
          body: Form(
            key: controller.resetPasswordKey,
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const AuthHeader(
                          title: "Reset Password",
                          subTitle:
                              "Your new password must be different from the previously used password",
                        ),
                        SizedBox(height: 20.h),
                        CustomTextField(
                          controller: controller.newPasswordController,
                          hint: "********",
                          name: "New Password",
                          isPassword: true,
                          validate: Validator.validatePassword,
                        ),
                        SizedBox(height: 20.h),
                        CustomTextField(
                          controller: controller.confirmPasswordController,
                          hint: "********",
                          name: "Confirm Password",
                          isPassword: true,
                          validate: (val) {
                            return Validator.validateConfirmPassword(
                              val,
                              controller.newPasswordController.text,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                AppProgressButton(
                  onPressed: (anim) {
                    controller.resetPassword();
                  },
                  text: "Save",
                ),
              ],
            ).paddingSymmetric(
              horizontal: 20.w,
              vertical: 20.h,
            ),
          ),
        );
      },
    );
  }
}
