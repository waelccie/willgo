import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:willgo/app/modules/all_offers/bindings/all_offers_binding.dart';
import 'package:willgo/app/modules/product_details/controllers/product_details_controller.dart';

import '../../../../widgets/progress_button.dart';

Widget foteButton(productId,quantity)=>Row(
  children: [
    Expanded(
      child: Row(
        children: [
          InkWell(
            onTap:(){
              Get.find<ProductDetailsController>().decreaseQuantity();
            },
            child: Container(
              height: 40.h,
              width: 40.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(color: const Color(0xffE9EAEB))
              ),child: const Icon(FontAwesomeIcons.minus,color: Colors.black
              ,),),
          ),
          SizedBox(width: 15.w,),
           Text(Get.find<ProductDetailsController>().quantity.toString(),style: TextStyle(fontWeight: FontWeight.w400,fontSize: 21),),
          SizedBox(width: 15.w,),
          InkWell(
            onTap: (){
              Get.find<ProductDetailsController>().increaseQuantity();

            },
            child: Container(
              height: 40.h,
              width: 40.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(color: const Color(0xffE9EAEB))
              ),child: const Icon(Icons.add,color: Colors.black
              ,),),
          ),
        ],
      ),
    ),
    SizedBox(width: 1.w,),
    Expanded(
      child: AppProgressButton(
        onPressed: (anim) {

Get.find<ProductDetailsController>().addToCart(productId);
        },

        child:  Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text('Add to Basket',style: GoogleFonts.roboto(fontSize: 17.25.sp,fontWeight: FontWeight.w600,color: Colors.white),)
          ],
        ),
      ),
    ),


  ],
);