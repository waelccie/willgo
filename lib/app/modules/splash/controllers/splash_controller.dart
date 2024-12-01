import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/services/get_storage_helper.dart';
import '../../../routes/app_pages.dart';

class SplashController extends GetxController with GetTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> opacityAnimation;
  @override
  void onInit() {
    animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    opacityAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(animationController)
          ..addListener(() {
            update();
          });
    animationController.forward();
    super.onInit();
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }

  void onFinished() {
    String initRoute;
    switch (CacheHelper.getIsFirstTime) {
      case true:
        initRoute = Routes.ONBOARDING;
        break;
      case false:
        switch (CacheHelper.getUserToken != null) {
          case true:
            initRoute = Routes.NAV_SCREEN;
            break;
          case false:
            initRoute = Routes.AUTH;
            break;
        }
        break;
    }
    Get.offAllNamed(initRoute);
  }
}
