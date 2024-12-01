// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_social_button/flutter_social_button.dart';
import 'package:get/get.dart';

import 'package:willgo/core/constants/theme/colors_manager.dart';

import '../../../../core/enums/enums.dart';

class SendOtpTypeButton extends StatelessWidget {
  const SendOtpTypeButton({
    super.key,
    required this.otpMethodType,
    required this.activeMethod,
    required this.phone,
    this.onTap,
  });
  final OtpMethodType otpMethodType;
  final OtpMethodType activeMethod;
  final String phone;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    String title = "";
    IconData icon = Icons.call;
    switch (otpMethodType) {
      case OtpMethodType.sms:
        title = "Send via SMS";
        icon = Icons.sms;
        break;
      case OtpMethodType.whatsapp:
        title = "Send via WhatsApp";
        icon = FontAwesomeIcons.whatsapp;
        break;
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: context.width,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: ColorsManager.primary, width: 1),
        ),
        child: Row(
          children: [
            Container(
              width: 50.w,
              height: 44.h,
              decoration: BoxDecoration(
                color: ColorsManager.primary.withOpacity(.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                icon,
                color: ColorsManager.black,
              ),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: ColorsManager.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    phone,
                    style: TextStyle(
                      color: ColorsManager.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 10.w),
            if (otpMethodType == activeMethod)
              Container(
                width: 25.w,
                height: 25.h,
                decoration: const BoxDecoration(
                  color: ColorsManager.primary,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 20,
                ),
              )
            else
              Container(
                width: 25.w,
                height: 25.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: ColorsManager.primary,
                    width: 1,
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
