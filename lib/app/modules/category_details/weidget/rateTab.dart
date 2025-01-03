import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:willgo/app/modules/AddSupportRequest/views/add_support_request_view.dart';
import 'package:willgo/core/extensions/build_context.dart';

import '../../../../core/global/const.dart';
import '../../../widgets/network_image.dart';

class rateTab extends StatelessWidget {
  const rateTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          AppCashedImage(
            imageUrl: dummyImage,
            width: 80.w,
            height: 80.h,
            fit: BoxFit.cover,
            radius: 20.r,
          ),
          Column(
            children: [
               Text(
                context.translate.thepizzaplace,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff101010)),
              ),
              Row(
                children: [
                  const Icon(
                    Icons.access_time_rounded,
                    color: Color(0xff878787),
                  ),
                  Text(
                    '29 minutes',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 13.sp,
                        color: const Color(0xff878787)),
                  ),
                  const Icon(
                    Icons.star,
                    color: Color(0xffFECC63),
                  ),
                  Text(
                    '4',
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff878787)),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
