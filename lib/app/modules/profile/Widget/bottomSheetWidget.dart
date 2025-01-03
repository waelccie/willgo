
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:willgo/app/modules/profile/controllers/translation_controller.dart';
import 'package:willgo/core/extensions/build_context.dart';
import 'package:get/get.dart';
import 'package:willgo/gen/assets.gen.dart';


Widget BottomSheetView(BuildContext context) {
  final translationController = Get.find<TranslationController>();

  return Padding(
    padding: EdgeInsets.symmetric(vertical: 8.0.h, horizontal: 18.w),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Container(
            height: 4.h,
            width: 50.w,
            color: const Color(0xffD6D6D6),
          ),
        ),
        SizedBox(height: 12.h),
        Text(
          context.translate
              .slectlanguage, 
          style: GoogleFonts.inter(fontWeight: FontWeight.w600, fontSize: 16.sp),
        ),
        SizedBox(height: 12.h),

        GestureDetector(
          onTap: () => translationController.changeLanguage('en'),
          child: Container(
            height: 55.h,
            decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: translationController.currentLocale.value.languageCode == 'en'
                        ? Colors.blue  
                        : const Color(0xffEAEAEA), 
                  ),
                ),
            child: Padding(
              padding:  EdgeInsets.all(8.0.w),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: const Color(0xffF3F6FB),
                    radius: 28.r,
                    child: Image.asset(
                      Assets.images.ukflagnew.path,
                      height: 27.h,
                      width: 27.w,
                    ),
                   
                  ),
                   SizedBox(width: 10.w),
                  Text(
                    context.translate.english,
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.w600, fontSize: 14.sp),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 12.h),

        GestureDetector(
          onTap: () => translationController.changeLanguage('ar'),
          child: Container(
            height: 55.h,
             decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(
                    color: translationController.currentLocale.value.languageCode == 'ar'
                        ? Colors.blue  
                        : const Color(0xffEAEAEA), 
                  ),
                ),
          
            child: Padding(
              padding:  EdgeInsets.all(8.0.r),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: const Color(0xffF3F6FB),
                    radius: 28.r, child: Image.asset(
                      Assets.images.saudiArabiaflagnew.path,
                      height: 27.h,
                      width: 27.w,
                    ),

                   
                  ),
                   SizedBox(width: 10.w),
                  Text(
                    context.translate.arabic,
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.w600, fontSize: 14.sp),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
