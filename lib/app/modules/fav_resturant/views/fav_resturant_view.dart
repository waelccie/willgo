import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/global/const.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/network_image.dart';
import '../controllers/fav_resturant_controller.dart';

class FavResturantView extends GetView<FavResturantController> {
  const FavResturantView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourite Restaurants'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Get.toNamed(Routes.RESTAURANT_DETAILS);
              },
              child: Container(
                child: Row(
                  children: [
                    AppCashedImage(
                      imageUrl: dummyImage,
                      width: 75.w,
                      height: 75.h,
                      fit: BoxFit.cover,
                      radius: 20,
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "the pizza place",
                          style: GoogleFonts.dmSans(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xff101010)),
                        ),
                        SizedBox(
                          height: 7.h,
                        ),
                        Row(
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
                              '29 minutes',
                              style: GoogleFonts.dmSans(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                  color: const Color(0xff878787)),
                            ),
                            SizedBox(
                              width: 4.w,
                            ),
                            const Icon(
                              Icons.star,
                              color: Color(0xffFECC63),
                            ),
                            SizedBox(
                              width: 3.w,
                            ),
                            Text(
                              '4',
                              style: GoogleFonts.dmSans(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff878787)),
                            ),
                          ],
                        )
                      ],
                    ),
                    const Spacer(),
                    const Icon(
                      FontAwesomeIcons.solidHeart,
                      color: Color(0xff01A0E2),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            GestureDetector(
              onTap: () {
                Get.toNamed(Routes.RESTAURANT_DETAILS);
              },
              child: Container(
                child: Row(
                  children: [
                    AppCashedImage(
                      imageUrl: dummyImage,
                      width: 75.w,
                      height: 75.h,
                      fit: BoxFit.cover,
                      radius: 20,
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "the pizza place",
                          style: GoogleFonts.dmSans(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xff101010)),
                        ),
                        SizedBox(
                          height: 7.h,
                        ),
                        Row(
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
                              '29 minutes',
                              style: GoogleFonts.dmSans(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                  color: const Color(0xff878787)),
                            ),
                            SizedBox(
                              width: 4.w,
                            ),
                            const Icon(
                              Icons.star,
                              color: Color(0xffFECC63),
                            ),
                            SizedBox(
                              width: 3.w,
                            ),
                            Text(
                              '4',
                              style: GoogleFonts.dmSans(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff878787)),
                            ),
                          ],
                        )
                      ],
                    ),
                    const Spacer(),
                    const Icon(
                      FontAwesomeIcons.solidHeart,
                      color: Color(0xff01A0E2),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            GestureDetector(
              onTap: () {
                Get.toNamed(Routes.RESTAURANT_DETAILS);
              },
              child: Container(
                child: Row(
                  children: [
                    AppCashedImage(
                      imageUrl: dummyImage,
                      width: 75.w,
                      height: 75.h,
                      fit: BoxFit.cover,
                      radius: 20,
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "the pizza place",
                          style: GoogleFonts.dmSans(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xff101010)),
                        ),
                        SizedBox(
                          height: 7.h,
                        ),
                        Row(
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
                              '29 minutes',
                              style: GoogleFonts.dmSans(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                  color: const Color(0xff878787)),
                            ),
                            SizedBox(
                              width: 4.w,
                            ),
                            const Icon(
                              Icons.star,
                              color: Color(0xffFECC63),
                            ),
                            SizedBox(
                              width: 3.w,
                            ),
                            Text(
                              '4',
                              style: GoogleFonts.dmSans(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff878787)),
                            ),
                          ],
                        )
                      ],
                    ),
                    const Spacer(),
                    const Icon(
                      FontAwesomeIcons.solidHeart,
                      color: Color(0xff01A0E2),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            GestureDetector(
              onTap: () {
                Get.toNamed(Routes.RESTAURANT_DETAILS);
              },
              child: Container(
                child: Row(
                  children: [
                    AppCashedImage(
                      imageUrl: dummyImage,
                      width: 75.w,
                      height: 75.h,
                      fit: BoxFit.cover,
                      radius: 20,
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "the pizza place",
                          style: GoogleFonts.dmSans(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xff101010)),
                        ),
                        SizedBox(
                          height: 7.h,
                        ),
                        Row(
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
                              '29 minutes',
                              style: GoogleFonts.dmSans(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                  color: const Color(0xff878787)),
                            ),
                            SizedBox(
                              width: 4.w,
                            ),
                            const Icon(
                              Icons.star,
                              color: Color(0xffFECC63),
                            ),
                            SizedBox(
                              width: 3.w,
                            ),
                            Text(
                              '4',
                              style: GoogleFonts.dmSans(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff878787)),
                            ),
                          ],
                        )
                      ],
                    ),
                    const Spacer(),
                    const Icon(
                      FontAwesomeIcons.solidHeart,
                      color: Color(0xff01A0E2),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}