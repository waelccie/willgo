// ignore_for_file: deprecated_member_use_from_same_package
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:willgo/app/modules/home/views/home_view.dart';
import 'package:willgo/app/modules/orders/views/orders_view.dart';
import 'package:willgo/app/modules/profile/views/profile_view.dart';
import 'package:willgo/app/widgets/custom_future_builder.dart';
import '../../../data/models/user_model.dart';
import '../controllers/nav_screen_controller.dart';
import '../widgets/bottom_navigation_bar_widget.dart';

class NavScreenView extends GetView<NavScreenController> {
  const NavScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavScreenController>(
      builder: (controller) {
        return CustomFutureBuilder<UserModel>(
          usingMaterial: true,
          future: controller.getUserData,
          onData: (context, data) {
            return Scaffold(
              body: IndexedStack(
                index: controller.navIndex,
                children: const [
                  HomeView(),
                  OrdersView(),
                  ProfileView(),
                ],
              ),
              bottomNavigationBar: const BottomNavigationBarWidget(),
            );
          },
        );
      },
    );
  }
}
