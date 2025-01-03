import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_extra_fields/form_builder_extra_fields.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:willgo/app/modules/AddSupportRequest/views/add_support_request_view.dart';
import 'package:willgo/core/extensions/build_context.dart';
import '../controllers/all_restaurants_controller.dart';
import 'WEidgets.dart';

class AllRestaurantsView extends GetView<AllRestaurantsController> {
  const AllRestaurantsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(context.translate.allrestaurants,),
        centerTitle: true,
      ),
      body: GetBuilder<AllRestaurantsController>(
        builder: (controller) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 10.0.w),
                child: Text(
                  context.translate.allrestaurants,
                  style: GoogleFonts.dmSans(fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding:  EdgeInsets.all(12.0.w),
                child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return AllResturantWidget(
                        image: controller
                            .getAllResturantController?.data?[index].photo
                            .toString(),
                        name: controller
                            .getAllResturantController?.data?[index].enName
                            .toString(),
                        time: controller.getAllResturantController?.data?[index]
                            .deliveryTime
                            .toString(),
                        id: controller
                            .getAllResturantController?.data?[index].id
                            .toString(),
                        rate: controller
                            .getAllResturantController?.data?[index].rate
                            .toString(),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 8,
                      );
                    },
                    itemCount:
                        controller.getAllResturantController!.data!.length),
              )
            ],
          );
        },
      ),
    );
  }
}
