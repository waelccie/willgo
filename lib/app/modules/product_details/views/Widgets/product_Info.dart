import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/constants/const/app_constants.dart';
import '../../../../../core/global/const.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../routes/app_pages.dart';
import '../../../../widgets/network_image.dart';

Widget product_Info(BuildContext context, name, oldprice, newprice, rate,
        numOfReate, bool isDescount, image) =>
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            AppCashedImage(
              imageUrl: image,
              width: context.width,
              height: 200.h,
              fit: BoxFit.cover,
              radius: 12,
            ),
            Positioned(
              top: 10,
              right: 12,
              left: 12,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: const CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.arrow_back_ios_new_sharp,
                        color: Colors.black,
                        size: 18,
                      ),
                    ),
                  ),
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.white,
                    child: IconButton(
                      onPressed: () {
                        Get.toNamed(Routes.CART);
                      },
                      icon: Assets.icons.cart.svg(
                          color: const Color(0xff01A0E2),
                          height: 20,
                          width: 20),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        SizedBox(
          height: 15.h,
        ),
        Text(
          name,
          style: GoogleFonts.roboto(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: const Color(0xff101010)),
        ),
        SizedBox(
          height: 8.h,
        ),
        isDescount == true
            ? Row(
                children: [
                  Text(
                    "${AppConstants.appCurrency}  $oldprice",
                    style: GoogleFonts.roboto(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff989DA3),
                        decoration: TextDecoration.lineThrough),
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  Text(
                    "${AppConstants.appCurrency}  $newprice",
                    style: GoogleFonts.roboto(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xff01A0E2),
                    ),
                  ),
                ],
              )
            : Text(
                "${AppConstants.appCurrency}  $newprice",
                style: GoogleFonts.roboto(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xff01A0E2),
                ),
              ),
        SizedBox(
          height: 8.h,
        ),
        Row(
          children: [
            const Icon(
              Icons.star,
              color: Color(0xffFFC700),
            ),
            SizedBox(
              width: 5.w,
            ),
            Text.rich(TextSpan(children: [
              TextSpan(
                  text: '$rate',
                  style: GoogleFonts.roboto(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 14.25.sp)),
              TextSpan(
                  text: '($numOfReate)',
                  style: GoogleFonts.roboto(
                      color: const Color(0xff878787),
                      fontWeight: FontWeight.w400,
                      fontSize: 15.25.sp))
            ])),
          ],
        )
      ],
    );
