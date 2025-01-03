import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:willgo/core/extensions/build_context.dart';

import '../../../../core/constants/const/app_constants.dart';



class payment_SummeryWidget extends StatelessWidget {
  final price,dicsounr,total,quentity,delivery;
  const payment_SummeryWidget({super.key, this.price, this.dicsounr, this.total,this.quentity,this.delivery});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 8.0.h,horizontal: 18.w),
      child: Container(decoration: BoxDecoration(border:Border.all( color: const Color(0xffEDEDED)),borderRadius: BorderRadius.circular(16.r)),
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 10.0.h,vertical: 10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(context.translate.payment_summary,style: GoogleFonts.inter(
                  fontWeight: FontWeight.w600,
                  fontSize: 16.sp
              ),),
              SizedBox(height: 8.h,),
        
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(context.translate.total_items+ quentity,style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: const Color(0xff878787)
                  ),),
                  Text('${context.translate.egp} $price',style: GoogleFonts.inter(
                      fontWeight: FontWeight.w700,
                      fontSize: 14
                  ),)
                ],),
              SizedBox(height: 8.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(context.translate.delivery_fee,style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                      color: const Color(0xff878787)
                  ),),
                  Text(delivery,style: GoogleFonts.inter(
                      fontWeight: FontWeight.w700,
                      fontSize: 14.sp
                  ),)
                ],),
              SizedBox(height: 8.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(context.translate.discount,style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                      color: const Color(0xff878787)
                  ),),
                  Text('-${context.translate.egp} $dicsounr',style: GoogleFonts.inter(
                      fontWeight: FontWeight.w700,
                      color: const Color(0xff01A0E2),
                      fontSize: 14.sp
                  ),)
                ],),
              SizedBox(height: 8.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(context.translate.total,style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                      color: const Color(0xff878787)
                  ),),
                  Text('${context.translate.egp} $total',style: GoogleFonts.inter(
                      fontWeight: FontWeight.w700,
                      fontSize: 14.sp
                  ),)
                ],),

            ],),
        ),
      ),
    );
  }
}
