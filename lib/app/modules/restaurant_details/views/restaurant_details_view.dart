import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:willgo/app/data/models/product_model.dart';

import '../../../../core/constants/const/app_constants.dart';
import '../../../../core/constants/theme/colors_manager.dart';
import '../../../../core/global/const.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/custom_future_builder.dart';
import '../../../widgets/network_image.dart';
import '../Weidget/Resturant Info.dart';
import '../Weidget/compolist.dart';
import '../controllers/restaurant_details_controller.dart';

class RestaurantDetailsView extends GetView<RestaurantDetailsController> {
  const RestaurantDetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<RestaurantDetailsController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(elevation: 0),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 21.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  resturantInfo(),
                  SizedBox(
                    height: 16.h,
                  ),
                  Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: ColorsManager.primaryBackground,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "All Products",
                          style: GoogleFonts.dmSans(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      )),

                  // SizedBox(
                  //   height: 40.h,
                  //   child: ListView.builder(
                  //     scrollDirection: Axis.horizontal,
                  //     itemCount: controller.classes.length + 1,
                  //     itemBuilder: (context, index) {
                  //       final isSelected = controller.selectedIndex == index;
                  //       return GestureDetector(
                  //         onTap: () => controller.onFilterSelected(index),
                  //         child: Container(
                  //           padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  //           margin: const EdgeInsets.symmetric(horizontal: 4),
                  //           decoration: BoxDecoration(
                  //             border: Border.all(color: isSelected ? Colors.blue : Colors.grey),
                  //             color: isSelected ? Colors.blue[50] : Colors.white,
                  //             borderRadius: BorderRadius.circular(25),
                  //           ),
                  //           child: Center(
                  //             child: Text(
                  //               index == 0 // التحقق إذا كانت خانة "عرض الكل"
                  //                   ? "Show All" // النص لخيار "عرض الكل"
                  //                   : controller.classes[index ].nameEn ?? "Unknown",
                  //               style: TextStyle(
                  //                 fontSize: 14,
                  //                 color: isSelected ? Colors.blue : Colors.black,
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //       );
                  //     },
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: SizedBox(
                      height: 300,
                      child: CustomFutureBuilder<ResturantProductModel>(
                        future: controller.getproduct,
                        onData:
                            (BuildContext context, ResturantProductModel data) {
                          return ListView.builder(
                            itemCount: data.data?.length,
                            itemBuilder: (context, index) {
                              final product = data.data?[index];
                              return InkWell(
                                onTap: () {
                                  Get.toNamed(
                                    Routes.PRODUCT_DETAILS,
                                    arguments: {
                                      "product_id": int.parse(
                                          data.data![index].id.toString()),
                                    },
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: Container(
                                    child: Row(
                                      children: [
                                        AppCashedImage(
                                          imageUrl: data.data?[index].images?[0]
                                                  .toString() ??
                                              "",
                                          width: 89.w,
                                          height: 75.h,
                                          fit: BoxFit.cover,
                                          radius: 20,
                                        ),
                                        SizedBox(width: 10.w),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              product?.enName.toString() ?? "",
                                              style: GoogleFonts.dmSans(
                                                  fontSize: 14.31,
                                                  fontWeight: FontWeight.w500,
                                                  color:
                                                      const Color(0xff101010)),
                                            ),
                                            SizedBox(height: 7.h),
                                            FittedBox(
                                              fit: BoxFit.scaleDown,
                                              child: Text(
                                                product?.description
                                                        .toString() ??
                                                    "",
                                                maxLines: 2,
                                                style: GoogleFonts.dmSans(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.03,
                                                    color: const Color(
                                                        0xff878787)),
                                              ),
                                            )
                                          ],
                                        ),
                                        const Spacer(),
                                        Text(
                                          "${AppConstants.appCurrency} ${product?.price.toString() ?? ""}",
                                          style: GoogleFonts.dmSans(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500,
                                              color: const Color(0xff101010)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
