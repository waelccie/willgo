import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_social_button/flutter_social_button.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:willgo/app/modules/AddSupportRequest/views/add_support_request_view.dart';
import 'package:willgo/core/extensions/build_context.dart';

import '../../../../core/global/const.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/network_image.dart';

class freeDeliveryTab extends StatefulWidget {
  const freeDeliveryTab(
      {super.key,
      required this.image,
      required this.name,
      required this.time,
      required this.id,
      required this.rate});
  final image;
  final name;
  final time, id, rate;
  @override
  State<freeDeliveryTab> createState() => _freeDeliveryTabState();
}

class _freeDeliveryTabState extends State<freeDeliveryTab> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.RESTAURANT_DETAILS,
            arguments: {"res_id": widget.id});
      },
      child: Container(
        child: Row(
          children: [
            AppCashedImage(
              imageUrl: widget.image ?? dummyImage,
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
                  widget.name,
                  style: GoogleFonts.dmSans(
                      fontSize: 16.sp,
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
                      '${widget.time} ${context.translate.minut}',
                      style: GoogleFonts.dmSans(
                          fontWeight: FontWeight.w500,
                          fontSize: 13.sp,
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
                      widget.rate.toString(),
                      style: GoogleFonts.dmSans(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff878787)),
                    ),
                  ],
                )
              ],
            ),
            const Spacer(),
            const Icon(
              FontAwesomeIcons.heart,
              color: Color(0xff78828A),
            )
          ],
        ),
      ),
    );
  }
}
