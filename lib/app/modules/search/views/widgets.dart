import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/global/const.dart';
import '../../../widgets/network_image.dart';

Widget resturant_list(BuildContext context) => SizedBox(
      height: 100.h,
      width: context.width,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => resturant_Weidget(),
          separatorBuilder: (context, index) => SizedBox(
                width: 10.w,
              ),
          itemCount: 10),
    );

Widget resturant_Weidget() => Container(
      child: Column(
        children: [
          AppCashedImage(
            imageUrl: dummyImage,
            width: 72.w,
            height: 72.h,
            fit: BoxFit.cover,
            radius: 20,
          ),
          SizedBox(
            height: 3.h,
          ),
          Text(
            'Taco',
            style:
                GoogleFonts.dmSans(fontWeight: FontWeight.w500, fontSize: 12),
          )
        ],
      ),
    );
