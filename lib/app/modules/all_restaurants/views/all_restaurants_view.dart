import 'package:flutter/material.dart';
import 'package:form_builder_extra_fields/form_builder_extra_fields.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/all_restaurants_controller.dart';
import 'WEidgets.dart';

class AllRestaurantsView extends GetView<AllRestaurantsController> {
  const AllRestaurantsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AllRestaurantsView'),
        centerTitle: true,
      ),
      body: GetBuilder<AllRestaurantsController>(
        builder: (controller) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  "All Rssturant",
                  style: GoogleFonts.dmSans(fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
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
