import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constants/const/app_constants.dart';
import '../../../data/models/onboarding_model.dart';
import '../controllers/onboarding_controller.dart';
import '../widgets/onboarding_footer.dart';
import '../widgets/onboarding_item_widget.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnboardingController>(
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
          ),
          body: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  itemCount: AppConstants().getOnboardingList().length,
                  controller: controller.pageController,
                  onPageChanged: controller.onCnahgeOnBoardingIndex,
                  itemBuilder: (context, index) {
                    OnboardingModel item =
                        AppConstants().getOnboardingList()[index];
                    return OnboardingItemWidget(
                      index: index,
                      iteml: item,
                    );
                  },
                ),
              ),
              const OnboardingFooter(),
            ],
          ),
        );
      },
    );
  }
}
