import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../gen/assets.gen.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      builder: (controller) {
        return Scaffold(
          body: Center(
            child: AnimatedOpacity(
              opacity: controller.opacityAnimation.value,
              duration: const Duration(seconds: 3),
              onEnd: () {
                controller.onFinished();
              },
              child: Assets.images.logo.image(),
            ),
          ),
        );
      },
    );
  }
}
