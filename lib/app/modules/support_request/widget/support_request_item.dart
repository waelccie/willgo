import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:willgo/app/data/models/add_support_request_model.dart';
import 'package:willgo/app/routes/app_pages.dart';
import 'package:willgo/core/constants/theme/colors_manager.dart';

class SupportRequestItem extends StatelessWidget {
  final String answer;
  final int id;
  final String date;
  final String name;
  final String note;

  const SupportRequestItem({
    super.key,
    required this.answer,
    required this.id,
    required this.date,
    required this.name,
    required this.note,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: GestureDetector(
        onTap: () {
          Get.toNamed(
            Routes.SUPPORT_RQUEST_DETAILS,
            arguments: {
              "id": id,
              "date": date,
              "name": name,
              "note": note,
              "answer": answer,
            },
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.r),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 2,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 22.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    " ${"#"}${id.toString()}",
                    style: GoogleFonts.dmSans(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: ColorsManager.primary,
                    ),
                  ),
                  Text(
                    date.substring(0, 11),
                    style: GoogleFonts.openSans(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: ColorsManager.black2,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Text(
                name,
                style: GoogleFonts.dmSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: ColorsManager.black2,
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                note,
                style: GoogleFonts.openSans(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: ColorsManager.black2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
