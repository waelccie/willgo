import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:willgo/app/data/models/restaurants_model.dart';
import 'package:willgo/app/routes/app_pages.dart';
import '../../../../core/services/get_storage_helper.dart';
import '../../../widgets/empty_widget.dart';
import '../controllers/home_controller.dart';
import 'popular_restaurant_item.dart';
import 'restaurant_shimmer_item.dart';

class PopularRestaurantsListView extends GetView<HomeController> {
  const PopularRestaurantsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return PagedListView(
      scrollDirection: Axis.vertical,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      pagingController: controller.getAllPopularResturantPagingController,
      builderDelegate: PagedChildBuilderDelegate<Restaurant>(
        noItemsFoundIndicatorBuilder: (context) {
          return const EmptyWidget();
        },
        newPageProgressIndicatorBuilder: (context) =>
            const PopularRestaurantItemShimmer(),
        firstPageProgressIndicatorBuilder: (context) {
          return Column(
            children: List.generate(
              10,
              (index) => const PopularRestaurantItemShimmer(),
            ),
          );
        },
        itemBuilder: (context, item, index) {
          return PopularRestaurantItem(
            name: CacheHelper.getLocale == "ar"
                ? item.arName ?? ""
                : item.enName ?? "",
            imageUrl: item.photo,
            onTap: () {
              Get.toNamed(Routes.RESTAURANT_DETAILS, arguments: {
                "res_id":item.id
              });
            },
          );
        },
      ),
    );
  }
}
