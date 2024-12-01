import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:willgo/app/modules/category_details/controllers/category_details_controller.dart';
import 'package:willgo/app/modules/check_out/controllers/check_out_controller.dart';

import '../../../../core/global/const.dart';
import '../../../widgets/network_image.dart';


class resturant_Weidget extends StatelessWidget {
  final int id;
  final String name;
  final String image;

  const resturant_Weidget({super.key, required this.name,required this.image,required this.id});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryDetailsController>(
      builder: (controller){
        return InkWell(
          onTap: (){
            controller.fetchResturantByCat(id,null);

            controller.isClicked=!controller.isClicked;
            controller.update();
          },
          child: Container(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                      border: Border.all(color:controller.isClicked==true?Color(0xff01A0E2):Colors.white)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: AppCashedImage(
                      imageUrl: image==""? dummyImage:image,
                      width: 72.w,
                      height: 60.h,
                      fit: BoxFit.cover,
                      radius: 20,

                    ),
                  ),
                ),
                SizedBox(height: 3.h,),
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color:controller.isClicked==true?Color(0xff01A0E2):Colors.white),


                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 5),
                      child: Text(name,style:  GoogleFonts.dmSans(fontWeight: FontWeight.w500,fontSize: 12,color:controller.isClicked==true?Colors.white:Colors.black), ),
                    ),)
              ],
            ),
          ),
        );
      },
    );
  }
}


