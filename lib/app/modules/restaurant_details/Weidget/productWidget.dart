import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/global/const.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/network_image.dart';

Widget ProductWidget(name,description,price,context)=>Container(
  child: Row(
    children: [
      AppCashedImage(
        imageUrl: dummyImage,
        width: 89.w,
        height: 75.h,
        fit: BoxFit.cover,
        radius: 20,

      ),
      SizedBox(width: 10.w,),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(name,style:  GoogleFonts.dmSans(fontSize: 14.31,fontWeight: FontWeight.w500,color: const Color(0xff101010)),),
          SizedBox(height: 7.h,),
          FittedBox(
            fit: BoxFit.scaleDown,
              child: Text(maxLines: 2,description,style:  GoogleFonts.dmSans(fontWeight: FontWeight.w500, fontSize: MediaQuery.of(context).size.width * 0.023,color: const Color(0xff878787)),))
        ],),
      const Spacer(),
      Text("\$$price",style:  GoogleFonts.dmSans(fontSize: 13,fontWeight: FontWeight.w500,color: const Color(0xff101010)),),
    ],
  ),
);