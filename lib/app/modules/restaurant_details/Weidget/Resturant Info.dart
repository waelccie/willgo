import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:willgo/app/data/models/Resturant_details.dart';
import 'package:willgo/app/widgets/custom_future_builder.dart';

import '../../../../core/global/const.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/network_image.dart';
import '../controllers/restaurant_details_controller.dart';

class resturantInfo extends StatelessWidget {
  const resturantInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final RestaurantDetailsController controller =
        Get.find<RestaurantDetailsController>();

    return CustomFutureBuilder<ResturantDetailsModel>(
        future: controller.getResturantDetails,
        onData: (context, data) {
          final res_Details = data.data;
          return Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0),
                child: Stack(
                  children: [
                    AppCashedImage(
                      imageUrl: data.data?.photo.toString() ?? "",
                      width: context.width,
                      height: 200.h,
                      fit: BoxFit.fill,
                      radius: 15,
                    ),
                    // Positioned(
                    //   top: 10,
                    //   right: 12,
                    //   left: 12,
                    //
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: [
                    //       InkWell(
                    //         onTap:(){
                    //           Get.toNamed(Routes.CATEGORY_DETAILS);
                    //         },
                    //         child: const CircleAvatar(
                    //           backgroundColor: Colors.white,
                    //           child: Icon(Icons.arrow_back_ios_new_sharp,color: Colors.black,size: 18,),
                    //         ),
                    //       ),
                    //       Container(
                    //         decoration: BoxDecoration(
                    //             color: Colors.transparent.withOpacity(0.33),
                    //             borderRadius: BorderRadius.circular(10)
                    //         ),
                    //         child: Padding(
                    //           padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 10),
                    //           child: Text('Free delivery on orders above 300 EGP',style:  GoogleFonts.dmSans(
                    //               color: Colors.white,
                    //               fontWeight: FontWeight.w500,
                    //               fontSize: 10
                    //           ),),
                    //         ),),
                    //
                    //     ],
                    //   ),
                    // )
                  ],
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        res_Details!.arName.toString(),
                        style: GoogleFonts.dmSans(
                            color: const Color(0xff101010),
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Container(
                        child: Row(
                          children: [
                            Text(
                              res_Details.rate.toString(),
                              style: GoogleFonts.dmSans(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff878787)),
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 20,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            const Icon(
                              Icons.access_time_sharp,
                              color: Color(0xff878787),
                              weight: 0.1,
                            ),
                            SizedBox(
                              width: 3.w,
                            ),
                            Text(
                              res_Details.deliveryTime.toString(),
                              style: GoogleFonts.dmSans(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: const Color(0xff878787)),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.delivery_dining,
                              color: Color(0xff878787),
                              weight: 0.1,
                            ),
                            SizedBox(
                              width: 3.w,
                            ),
                            Text(
                              res_Details.deliveryTime.toString(),
                              style: GoogleFonts.dmSans(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: const Color(0xff878787)),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ],
          );
        });
  }
}
