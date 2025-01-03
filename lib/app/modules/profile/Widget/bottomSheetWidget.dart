import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/global/const.dart';
import '../../../widgets/network_image.dart';

Widget BottomSheetView(context) => Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0.h, horizontal: 18.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              height: 4.h,
              width: 50.w,
              color: const Color(0xffD6D6D6),
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
          Text(
            'Select Language',
            style: GoogleFonts.inter(fontWeight: FontWeight.w600, fontSize: 16),
          ),
          SizedBox(
            height: 12.h,
          ),
          Container(
            height: 55.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xffEAEAEA)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: const Color(0xffF3F6FB),
                    radius: 28,
                    child: AppCashedImage(
                      imageUrl: dummyImage,
                      width: 20.w,
                      height: 18.h,
                      fit: BoxFit.cover,
                      radius: 2,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'English',
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.w600, fontSize: 14),
                  ),
                ],
              ),
            ),
          ),

        ],
      ),
    );



Widget SignOutBottomSheetView(context) => Padding(
  padding: EdgeInsets.symmetric(vertical: 8.0.h, horizontal: 18.w),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Center(
        child: Container(
          height: 4.h,
          width: 50.w,
          color: const Color(0xffD6D6D6),
        ),
      ),
      SizedBox(
        height: 12.h,
      ),
      Text(
        'SignOut',
        style: GoogleFonts.inter(fontWeight: FontWeight.w600, fontSize: 16),
      ),
      SizedBox(
        height: 12.h,
      ),
      Container(
        height: 55.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xffEAEAEA)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: const Color(0xffF3F6FB),
                radius: 28,
                child: AppCashedImage(
                  imageUrl: dummyImage,
                  width: 20.w,
                  height: 18.h,
                  fit: BoxFit.cover,
                  radius: 2,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                'English',
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w600, fontSize: 14),
              ),
            ],
          ),
        ),
      ),

    ],
  ),
);
