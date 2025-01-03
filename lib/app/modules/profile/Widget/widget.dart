import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'bottomSheetWidget.dart';

Widget buildListTile(String title, leadingIcon, {bool isSupport = false}) {
  return Container(
    decoration: const BoxDecoration(
      color: Colors.white,
    ),
    child: ListTile(
      leading: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: const Color(0xffF5F5FF)),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Icon(
            leadingIcon,
            color: Colors.black87,
            size: 22,
          ),
        ),
      ),
      title: Text(
        title,
        style: GoogleFonts.inter(
          fontSize: 14,
          color: Colors.black87,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 16,
        color: Colors.black,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
    ),
  );
}

Widget buildListTileSettings(String title, Widget trailing) {
  return ListTile(
    contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
    title: Text(
      title,
      style: GoogleFonts.inter(
        fontSize: 14.sp,
        color: Colors.black,
        fontWeight: FontWeight.w500,
      ),
    ),
    trailing: trailing,
  );
}

void show(context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return SizedBox(
        width: context.width,
        height: context.height * 0.3, // Set your desired height
        child: BottomSheetView(context),
      );
    },
  );
}
