import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/constants/const/app_constants.dart';
import '../../../../core/constants/theme/colors_manager.dart';
import '../../../../core/services/get_storage_helper.dart';
import '../../../routes/app_pages.dart';
import '../controllers/onboarding_controller.dart';
import 'onboarding_progress_button.dart';

class OnboardingFooter extends GetView<OnboardingController> {
  const OnboardingFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnboardingController>(
      builder: (context) {
        return Column(
          children: [
            DotsIndicator(
              dotsCount: AppConstants().getOnboardingList().length,
              position: controller.index,
              onTap: (index) {
                controller.pageController.animateToPage(
                  index.toInt(),
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                );
              },
              decorator: DotsDecorator(
                activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                color: ColorsManager.primary.withOpacity(.4),
                activeColor: ColorsManager.primary,
                activeSize: Size(16.w, 6.h),
                size: Size(6.w, 6.h),
              ),
            ),
            SizedBox(height: 20.h),
            CustomProgressButton(
              index: controller.index,
              listLength: AppConstants().getOnboardingList().length,
              next: () {
                controller.pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                );
              },
              onTapSkipButton: () {
                CacheHelper.cacheFirstTime(isFirst: false);
                Get.offAllNamed(Routes.AUTH);
              },
            ).paddingOnly(bottom: 20.h),
          ],
        ).paddingOnly(bottom: 50.h);
      },
    );
  }
}
