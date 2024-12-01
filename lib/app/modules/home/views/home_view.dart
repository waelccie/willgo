import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/custom_text_field.dart';

import '../../all_restaurants/controllers/all_restaurants_controller.dart';
import '../../nav_screen/widgets/nav_screen_app_bar.dart';
import '../controllers/home_controller.dart';
import '../widgets/home_categories_list_view.dart';
import '../widgets/home_sliders_widget.dart';
import '../widgets/popular_restaurants_list_view.dart';
import '../widgets/text_header_widget.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) {
        return Scaffold(
          appBar: const NavScreenAppBar(),
          body: RefreshIndicator.adaptive(
            onRefresh: () async {
              controller.getAllParentCategoriesPagingController.refresh();
              controller.getAllPopularResturantPagingController.refresh();
            },
            child: SingleChildScrollView(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.SEARCH);
                    },
                    child: CustomTextField(
                      height: 40,
                      onTap: () {
                        Get.toNamed(Routes.SEARCH);
                      },
                      hint: "Search for food",
                      prefixIcon: const Icon(
                        Icons.search,
                      ),
                    ),
                  ).paddingSymmetric(horizontal: 20.w),
                  SizedBox(height: 20.h),
                  const HomeSlidersWidget(),
                  SizedBox(height: 20.h),
                  const HomeCategoriesListView(),
                  SizedBox(height: 12.h),
                  TextHeaderWidget(
                    title: "Popular Restaurants",
                    subTitle: "See all",
                    onTap: () {
                      Get.put(AllRestaurantsController());
                      Get.find<AllRestaurantsController>().getAllResturant();
                      Get.toNamed(Routes.ALL_RESTAURANTS);
                    },
                  ).paddingSymmetric(horizontal: 20.w),
                  SizedBox(height: 12.h),
                  const PopularRestaurantsListView(),
                  SizedBox(height: 12.h),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
