import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../auth/widgets/auth_footer.dart';
import '../../auth/widgets/auth_header.dart';
import '../../../widgets/progress_button.dart';
import '../../../widgets/main_pin_code_field.dart';
import '../controllers/verification_controller.dart';

class VerificationView extends GetView<VerificationController> {
  const VerificationView({super.key});
  @override
  Widget build(BuildContext context) {




    return GetBuilder<VerificationController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('OTP'),
            centerTitle: true,
          ),
          body: Form(
            key: controller.verifyOtpKey,
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        AuthHeader(
                          title: "Phone number verification",
                          subTitle:
                          "Enter the verification code we send you on:${controller.phone??"No phon provided"}",
                        ),
                        SizedBox(height: 40.h),
                        PinCodeFields(onChanged: controller.onChangeOtpCode),

                        SizedBox(height: 12.h),
                        Text(
                          controller.formatTime(controller.remainingSeconds),
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        AuthFooter(
                          title: "Didn’t receive code?",
                          subTitle: "Resend",
                          onTap: () {
                            controller.resendOtpCode();
                          },
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
                    controller.verifyOtp();
                    print(controller.type);
                  },
                  text: 'Continue',
                ).paddingAll(20.w)
              ],
            ),
          ),
        );
      },
    );
  }
}
