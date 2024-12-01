// ignore_for_file: deprecated_member_use_from_same_package

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/theme/colors_manager.dart';
import '../../../../gen/assets.gen.dart';
import '../controllers/nav_screen_controller.dart';

class BottomNavigationBarWidget extends GetView<NavScreenController> {
  const BottomNavigationBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavScreenController>(
      builder: (controller) {
        return BottomNavigationBar(
          backgroundColor: Colors.white,
          currentIndex: controller.navIndex,
          onTap: controller.changeNavIndex,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Assets.icons.home.svg(
                color: controller.navIndex == 0
                    ? ColorsManager.primary
                    : const Color(0xFFA7AEC1),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Assets.icons.orders.svg(
                color: controller.navIndex == 1
                    ? ColorsManager.primary
                    : const Color(0xFFA7AEC1),
              ),
              label: 'Orders',
            ),
            BottomNavigationBarItem(
              icon: Assets.icons.user.svg(
                color: controller.navIndex == 2
                    ? ColorsManager.primary
                    : const Color(0xFFA7AEC1),
              ),
              label: 'Profile',
            ),
          ],
        );
      },
    );
  }
}
