import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/custom_text_field.dart';
import '../../../widgets/progress_button.dart';
import '../../../../core/global/validator.dart';
import '../../../widgets/phone_text_form_field.dart';
import '../../auth/widgets/auth_footer.dart';
import '../../auth/widgets/auth_header.dart';
import '../controllers/login_controller.dart';
import '../widgets/remember_me_row.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(),
          body: Form(
            key: controller.loginKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AuthHeader(
                    title: "Login to your\naccount.",
                    subTitle: "Please sign in to your account.",
                  ),
                  SizedBox(height: 20.h),
                  PhoneTextFormField(
                    onCountryChanged: controller.onChangePhoneKey,
                    controller: controller.phoneController,
                    hintText: "Enter your phone number",
                    name: "Phone Number",
                  ),
                  SizedBox(height: 12.h),
                  CustomTextField(
                    controller: controller.passwordController,
                    hint: "Password",
                    name: "Password",
                    type: TextInputType.visiblePassword,
                    isPassword: true,
                    validate: Validator.validatePassword,
                  ),
                  SizedBox(height: 12.h),
                  const RememberMeRow(),
                  SizedBox(height: 20.h),
                  AppProgressButton(
                    onPressed: (anim) {
                      controller.login();
                    },
                    text: "Login",
                  ),
                  SizedBox(height: 20.h),
                  AuthFooter(
                    title: "Don't have an account?",
                    subTitle: "Register",
                    onTap: () {
                      Get.toNamed(Routes.REGISTER);
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
