import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:willgo/core/global/validator.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/progress_button.dart';
import '../../../widgets/custom_text_field.dart';
import '../../../widgets/phone_text_form_field.dart';
import '../../auth/widgets/auth_footer.dart';
import '../../auth/widgets/auth_header.dart';
import '../controllers/register_controller.dart';
import '../widgets/terms_privacy_row.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(),
          body: Form(
            key: controller.registerKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AuthHeader(
                    title: "Create your new\naccount",
                    subTitle:
                    "Create an account to start looking for the food you like",
                  ),
                  SizedBox(height: 20.h),
                  CustomTextField(
                    controller: controller.userController,
                    name: "User Name",
                    hint: "Enter your Name",
                    type: TextInputType.name,
                    validate: Validator.validateUsername,
                  ),
                  SizedBox(height: 12.h),
                  CustomTextField(
                    controller: controller.emailController,
                    hint: "Enter Email Address",
                    name: "Email Address",
                    type: TextInputType.emailAddress,
                    validate: Validator.validateEmail,
                  ),
                  SizedBox(height: 12.h),
                  PhoneTextFormField(
                    controller: controller.phoneController,
                    onCountryChanged: controller.onChangePhoneKey,
                    hintText: "Enter your  number Phone",
                    name: "Phone Number",
                  ),
                  SizedBox(height: 12.h),
                  CustomTextField(
                    controller: controller.passwordController,
                    hint: "Enter Password",
                    name: "Password",
                    type: TextInputType.visiblePassword,
                    validate: Validator.validatePassword,
                    isPassword: true,
                  ),
                  SizedBox(height: 12.h),
                  CustomTextField(
                    controller: controller.confirmPasswordController,
                    hint: "Re-Enter password",
                    name: "Confirm Password",
                    type: TextInputType.visiblePassword,
                    validate: (val) {
                      return Validator.validateConfirmPassword(
                        val,
                        controller.passwordController.text,
                      );
                    },
                    isPassword: true,
                  ),
                  SizedBox(height: 12.h),
                  const TermsPrivacyRow(),
                  SizedBox(height: 12.h),
                  AppProgressButton(
                    onPressed: (anim) {
                      controller.register();
                    },
                    text: "Register",
                  ),
                  SizedBox(height: 20.h),
                  AuthFooter(
                    title: "Have an account?",
                    subTitle: "Login",
                    onTap: () {
                      Get.toNamed(Routes.LOGIN);
                    },
                  ),
                ],
              ).paddingSymmetric(
                horizontal: 20.w,
                vertical: 20.h,
              ),
            ),
          ),
        );
      },
    );
  }
}
