import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:willgo/app/modules/home/controllers/home_controller.dart';
import 'package:willgo/core/services/get_storage_helper.dart';
import '../../../data/models/parent_categories_model.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/empty_widget.dart';
import '../../category_details/controllers/category_details_controller.dart';
import 'categories_shimmer_list.dart';
import 'category_item.dart';
import 'category_shimmer_widget.dart';

class HomeCategoriesListView extends GetView<HomeController> {
  const HomeCategoriesListView({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      height: 100.h,
      child: PagedListView(
        itemExtent: context.width / 2.5,
        scrollDirection: Axis.horizontal,
        pagingController: controller.getAllParentCategoriesPagingController,
        builderDelegate: PagedChildBuilderDelegate<ParentCategory>(
          noItemsFoundIndicatorBuilder: (context) {
            return const EmptyWidget();
          },
          newPageProgressIndicatorBuilder: (context) =>
              const CategoryItemShimmer(),
          firstPageProgressIndicatorBuilder: (context) =>
              const CategoriesShimmerList(),
          itemBuilder: (context, item, index) {
            return Padding(
              padding: EdgeInsets.only(
                left: index == 0 ? 12.w : 0,
                right: 12.w,
              ),
              child: GestureDetector(
                onTap: () {
                  Get.put(CategoryDetailsController());
                  Get.find<CategoryDetailsController>().fetchCateogriesDetails(item.id);
                  Get.find<CategoryDetailsController>().fetchResturantByCat(null,item.id);
                  Get.toNamed(Routes.CATEGORY_DETAILS);

                },
                child: CategoryItem(
                  name: CacheHelper.getLocale == "ar"
                      ? item.nameAr ?? ""
                      : item.nameEn ?? "",
                  imageUrl: item.icon,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
