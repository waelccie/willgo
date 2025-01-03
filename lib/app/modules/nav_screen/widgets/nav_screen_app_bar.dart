import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:willgo/app/data/models/getLocation.dart';
import 'package:willgo/app/modules/environment/views/internet_connection_view.dart';
import 'package:willgo/app/modules/home/controllers/home_controller.dart';
import 'package:willgo/app/widgets/custom_future_builder.dart';
import 'package:willgo/core/extensions/build_context.dart';
import '../../../../core/services/get_storage_helper.dart';
import '../../../data/models/locationById.dart';
import '../../../data/models/setPrimaryLocation.dart';
import '../../../routes/app_pages.dart';
import '../../../../core/constants/theme/colors_manager.dart';
import '../../../../gen/assets.gen.dart';

import '../controllers/nav_screen_controller.dart';

class NavScreenAppBar extends GetView<NavScreenController>
    implements PreferredSizeWidget {
  const NavScreenAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: 70,
      centerTitle: false,
      title: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 10.w,
        ),
        child: GestureDetector(
          onTap: () {
            Get.toNamed(Routes.UPDATE_CURRUNT_ADDRESS);
          },
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Text(
                 context.translate.deliver_to,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                GetBuilder<HomeController>(
                  builder: (controller) {
                    return Row(
                      children: [
                        Container(
                          width: 150.w,
                          child: Text(
                            maxLines: 2,
                            CacheHelper.getUserToken == null
                                ? Get.find<HomeController>().currentCity.trim()
                                : Get.find<HomeController>().currentCity.trim(),
                            style: TextStyle(
                              color: ColorsManager.grey,
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(width: 5.w),
                        const Icon(
                          Icons.keyboard_arrow_down,
                          color: ColorsManager.grey,
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            Get.toNamed(Routes.CART, arguments: {"s": true});
          },
          icon: Assets.icons.cart.svg(),
        ),
        IconButton(
          onPressed: () {
            Get.toNamed(Routes.NOTIFICATIONS);
          },
          icon: Assets.icons.notification.svg(),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(55.h);
}
