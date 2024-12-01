import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/progress_button.dart';
import '../../../../gen/assets.gen.dart';

class ResetPasswordSuccess extends StatelessWidget {
  const ResetPasswordSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      height: context.height / 1.9,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: 70.w,
              height: 4.h,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(.2),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            SizedBox(height: 40.h),
            Assets.images.success.svg(),
            SizedBox(height: 20.h),
            const Text(
              "Password Changed",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.h),
            const Text(
              "Password changed successfully, you can login again with a new password",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 20.h),
            AppProgressButton(
              onPressed: (anim) {
                Get.offAllNamed(Routes.LOGIN);
              },
              text: "Login",
            )
          ],
        ),
      ),
    );
  }
}
