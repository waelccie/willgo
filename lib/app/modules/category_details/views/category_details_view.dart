import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:willgo/app/modules/category_details/weidget/resturant_weidget.dart';
import 'package:willgo/app/widgets/custom_future_builder.dart';
import '../../../data/models/ResturantByCat.dart';
import '../../../data/models/cat_Details.dart';
import '../controllers/category_details_controller.dart';
import '../weidget/freeDeliveryTab.dart';

class CategoryDetailsView extends GetView<CategoryDetailsController> {
  const CategoryDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "All Resturant",
          style: GoogleFonts.dmSans(fontWeight: FontWeight.w500),
        ),
      ),
      body: SafeArea(
        child: GetBuilder<CategoryDetailsController>(
          builder: (CategoryDetailsController controller) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: CustomFutureBuilder<categoriesDetails>(
                      future: controller.getCateogriesDetails,
                      onData: (BuildContext context, categoriesDetails data) {
                        return data.data!.isEmpty
                            ? Center(
                                child: Container(
                                    height: 50,
                                    child: Text(
                                      "No Result Found",
                                      style: GoogleFonts.dmSans(
                                          fontWeight: FontWeight.w500),
                                    )))
                            : Container(
                                height: 120,
                                child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return resturant_Weidget(
                                      name: data.data![index].nameEn.toString(),
                                      image: data.data![index].icon.toString(),
                                      id: data.data![index].id!.toInt(),
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return SizedBox(width: 8);
                                  },
                                  itemCount: data.data!.length,
                                ),
                              );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      "All Resturant",
                      style: GoogleFonts.dmSans(fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: CustomFutureBuilder<ResturantByCat>(
                        future: controller.getResurantByCat,
                        onData: (BuildContext context, ResturantByCat data) {
                          return data.data!.isEmpty
                              ? Center(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 20,
                                      ),
                                      SvgPicture.asset(
                                          "assets/images/NotFound.svg"),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Text(
                                        "No Resturant found",
                                        style: GoogleFonts.dmSans(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 16),
                                      ),
                                    ],
                                  ),
                                )
                              : ListView.separated(
                                  physics:
                                      const AlwaysScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return freeDeliveryTab(
                                      image: data.data?[index].photo,
                                      name: data.data?[index].enName,
                                      time: data.data?[index].deliveryTime,
                                      id: data.data?[index].id,
                                      rate: data.data?[index].rate,
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return SizedBox(height: 5);
                                  },
                                  itemCount: data.data!.length,
                                );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
