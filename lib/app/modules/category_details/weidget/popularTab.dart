import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/global/const.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/network_image.dart';
class popularTap extends StatefulWidget {
  const popularTap({super.key,required this.image,required this.name,required this.time,required this.id,required this.rate});
  final image;final name;final time,id,rate;
  @override
  State<popularTap> createState() => _popularTapState();
}

class _popularTapState extends State<popularTap> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.toNamed(Routes.RESTAURANT_DETAILS,arguments: {
          "res_id":widget.id
        });

      },
      child: Container(
        child: Row(
          children: [
            AppCashedImage(
              imageUrl: widget.image??dummyImage,
              width: 75.w,
              height: 75.h,
              fit: BoxFit.cover,
              radius: 20,

            ),
            SizedBox(width: 8.w,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(widget.name,style:  GoogleFonts.dmSans(fontSize: 16,fontWeight: FontWeight.w500,color: const Color(0xff101010)),),
                SizedBox(height: 7.h,),
                Row(
                  children: [
                    const Icon(Icons.access_time_sharp,color: Color(0xff878787),weight: 0.1,),
                    SizedBox(width: 3.w,),

                    Text('${widget.time} minutes',style:  GoogleFonts.dmSans(fontWeight: FontWeight.w500,fontSize: 13,color: const Color(0xff878787)),),
                    SizedBox(width: 4.w,),
                    const Icon(Icons.star,color: Color(0xffFECC63),),
                    SizedBox(width: 3.w,),

                    Text(widget.rate,style:  GoogleFonts.dmSans(fontSize: 14,fontWeight: FontWeight.w400,color: const Color(0xff878787)),),


                  ],
                )
              ],),
            const Spacer(),
            Icon(FontAwesomeIcons.heart,color: const Color(0xff78828A),)
          ],
        ),
      ),
    );
  }
}

